{ lib, ... }:
{
  flake.modules.homeManager.owner.programs.zsh = {
    enable = true;

    autocd = false;

    history = {
      size = 50000;
      save = 500000;
      ignoreDups = true;
      share = false;
      extended = true;
    };

    sessionVariables = {
      EDITOR = "vim";
    };

    localVariables = {
      LANG = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
    };

    plugins = [ ];

    initContent = lib.mkBefore ''
      # Make sure that fzf does not override the meaning of ^T
      bindkey '^T' transpose-chars

      if [[ $TERM == dumb || $TERM == emacs || ! -o interactive ]]; then
          unsetopt zle
          unset zle_bracketed_paste
          export PROMPT='$ '
          export RPROMPT=""
          export PS1='$ '
      else
          autoload -Uz compinit
          compinit
      fi
    '';
  };
}
