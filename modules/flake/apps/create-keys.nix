{
  perSystem =
    { pkgs, ... }:
    {
      apps.create-keys = {
        meta.description = "Create SSH keys";
        program = pkgs.writeShellApplication {
          name = "create-keys";
          runtimeInputs = with pkgs; [
            coreutils
            openssh
          ];
          text = ''
            #!/usr/bin/env bash
            set -euo pipefail

            readonly COLOR_WARNING='\033[0;31m'
            readonly COLOR_SUCCESS='\033[0;32m'
            readonly COLOR_RESET='\033[0m'

            USER_NAME="$(id -un)"
            USER_GROUP="$(id -gn)"
            SSH_DIR="''${HOME}/.ssh"
            readonly USER_NAME USER_GROUP SSH_DIR

            log_warning() {
              printf '%b\n' "''${COLOR_WARNING}$*''${COLOR_RESET}"
            }

            log_success() {
              printf '%b\n' "''${COLOR_SUCCESS}$*''${COLOR_RESET}"
            }

            ensure_ssh_directory() {
              mkdir -p "''${SSH_DIR}"
              chmod 700 "''${SSH_DIR}"
            }

            confirm_key_replacement() {
              local key_name="''${1}"
              local key_path="''${SSH_DIR}/''${key_name}"

              if [[ ! -f "''${key_path}" ]]; then
                return 0
              fi

              log_warning "Existing SSH key found for ''${key_name}."
              if [[ -f "''${key_path}.pub" ]]; then
                cat "''${key_path}.pub"
              fi

              local reply=""
              read -r -p "Do you want to replace it? (y/n) " reply
              [[ "''${reply}" =~ ^[Yy]$ ]]
            }

            generate_key() {
              local key_type="''${1}"
              local key_name="''${2}"
              shift 2

              local key_path="''${SSH_DIR}/''${key_name}"
              if confirm_key_replacement "''${key_name}"; then
                ssh-keygen -t "''${key_type}" -f "''${key_path}" -N "" "$@"
                chown "''${USER_NAME}:''${USER_GROUP}" "''${key_path}" "''${key_path}.pub"
              else
                log_success "Kept existing ''${key_name}."
              fi
            }

            main() {
              ensure_ssh_directory
              generate_key "ed25519" "id_ed25519"
              generate_key "ed25519-sk" "id_ed25519_sk"
              generate_key "ed25519-sk" "id_ed25519_sk_signing" -O no-touch-required

              log_success "SSH key setup complete."
            }

            main "$@"
          '';
        };
      };
    };
}
