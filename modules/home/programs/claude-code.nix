{
  flake.modules.homeManager.owner =
    { config, ... }:
    {
      programs.claude-code = {
        enable = true;

        mcpServers = config.mcp.servers;

        commands.commit = ''
          ---
          allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*)
          description: Generate AI commit message for staged changes
          model: haiku
          ---

          Your task is to help the user to generate a commit message.

          ## Context

          - Current git status: !`git status`
          - Staged changes: !`git diff --cached --diff-algorithm=minimal`
          - Recent commits for style reference: !`git log -3 --pretty=format:"%B"`

          ## Guidelines

          - DO NOT add any ads such as "Generated with [Claude Code](https://claude.ai/code)"
          - Only generate the message for staged files/changes
          - Don't add any files using `git add`. The user will decide what to add.
          - Follow the rules below for the commit message.

          ## Format

          ```
          <type>:<space><message title>

          <bullet points summarizing what was updated>
          ```

          ## Example Titles

          ```
          feat(auth): add JWT login flow
          fix(ui): handle null pointer in sidebar
          refactor(api): split user controller logic
          docs(readme): add usage section
          ```

          ## Example with Title and Body

          ```
          feat(auth): add JWT login flow

          - Implemented JWT token validation logic
          - Added documentation for the validation component
          ```

          ## Rules

          * title is lowercase, no period at the end.
          * Title should be a clear summary, max 50 characters.
          * Use the body (optional) to explain *why*, not just *what*.
          * Bullet points should be concise and high-level.

          Avoid

          * Vague titles like: "update", "fix stuff"
          * Overly long or unfocused titles
          * Excessive detail in bullet points

          ## Allowed Types

          | Type     | Description                           |
          | -------- | ------------------------------------- |
          | feat     | New feature                           |
          | fix      | Bug fix                               |
          | chore    | Maintenance (e.g., tooling, deps)     |
          | docs     | Documentation changes                 |
          | refactor | Code restructure (no behavior change) |
          | test     | Adding or refactoring tests           |
          | style    | Code formatting (no logic change)     |
          | perf     | Performance improvements              |
        '';
      };
    };
}
