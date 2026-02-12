# Agent Guidelines

Guidelines for AI agents working with this Nix configuration repository.

## Pre-completion Validation

Before marking any task as complete, agents MUST run:

```bash
nix flake check
```

This ensures all Nix expressions are valid and the configuration can be evaluated without errors.

If `nix flake check` fails:

1. Review the error output
2. Fix the issues
3. Re-run the check
4. Only mark complete once the check passes
