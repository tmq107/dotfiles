---
name: git-multi-repo
description: Safely clone, pull, commit, and push across many git repositories with dry-run and failure-aware workflows.
compatibility: opencode
metadata:
  audience: maintainers
  workflow: multi-repository-git-operations
---

## What I do

- Plan and execute batch git operations across many repositories.
- Use safe defaults: dry-run first, fast-forward pulls when possible, and no force-push in bulk.
- Skip or stop on failures based on requested behavior and provide a concise per-repo report.
- Standardize repo-list driven workflows for clone, pull, commit, and push.
- Create feature branches from the latest source branch state across many repos.
- Clean local branches safely while preserving protected branches.

## When to use me

Use this skill when you need to run the same git operation over many repositories from a single list.

Examples:

- Initial setup of many repos on a new machine
- Pulling updates across a portfolio of services
- Committing a coordinated change in multiple repositories
- Pushing already-reviewed commits in a batch

## Required operating rules

1. Run non-destructive checks first (show plan and inputs).
2. Prefer dry-run before executing real write operations.
3. Never use destructive git operations unless explicitly requested.
4. Never use force-push in bulk by default.
5. For pull, prefer `--ff-only` unless user asks otherwise.
6. Skip repos that are not valid git worktrees.
7. Report each repo as `OK`, `SKIP`, or `FAIL` with a short reason.
8. For feature branches, default source branch is `develop`; if missing, ask user for source branch.
9. For branch cleanup, delete local branches only; never delete remote branches by default.

## Input format

Use a repos file with one entry per line.

Accepted line formats:

- `https://github.com/org/repo.git`
- `git@github.com:org/repo.git`
- `https://github.com/org/repo.git,custom-folder-name`

Parsing rules:

- Ignore blank lines.
- Ignore lines beginning with `#`.
- If folder name is omitted, infer from repo URL basename without `.git`.

## Standard workflow

1. Validate inputs
   - Confirm repos file exists.
   - Confirm base directory exists (or create it if requested).
2. Execute target action per repo
     - `clone`: clone only if repo folder is missing.
     - `pull`: pull in existing repo; prefer `--ff-only`.
     - `commit`: stage with `git add -A`; commit only when there are staged changes.
     - `push`: push only if upstream is configured.
     - `feature-branch`: sync source branch, then create user-provided feature branch from latest source branch.
     - `clean-branches`: delete local branches except `develop` and remote default branch; keep checked-out branch.
3. Handle failures
   - If continue-on-error is enabled, record and continue.
   - Otherwise stop on first failure.
4. Print final summary
   - totals for ok, skipped, failed; include failed repo list.

## Command patterns

Use these command forms as defaults:

```bash
# Clone missing repos
multi-git.sh clone --repos-file repos.md --base-dir "$HOME/work/repos"

# Pull updates safely
multi-git.sh pull --repos-file repos.md --base-dir "$HOME/work/repos" --ff-only

# Commit changed repos
multi-git.sh commit --repos-file repos.md --base-dir "$HOME/work/repos" --message "chore: batch update"

# Push committed changes
multi-git.sh push --repos-file repos.md --base-dir "$HOME/work/repos"

# Create feature branch from latest develop
multi-git.sh feature-branch --repos-file repos.md --base-dir "$HOME/work/repos" --branch "feature/my-change" --source-branch develop

# Create feature branch, ask source branch when develop missing
multi-git.sh feature-branch --repos-file repos.md --base-dir "$HOME/work/repos" --branch "feature/my-change"

# Clean local branches, keep protected branches
multi-git.sh clean-branches --repos-file repos.md --base-dir "$HOME/work/repos"

# Preview before execution
multi-git.sh pull --repos-file repos.md --base-dir "$HOME/work/repos" --ff-only --dry-run
```

## Feature branch behavior

For action `feature-branch`, apply the following per repository:

1. Validate target feature branch name is provided by user.
2. Resolve source branch:
   - Use `develop` by default.
   - If `develop` does not exist (local or remote), ask user for the source branch to use.
3. Fetch latest refs from remote.
4. Update source branch to latest remote state (prefer fast-forward only).
5. Create new feature branch from updated source branch.
6. If target feature branch already exists, mark `SKIP` unless user explicitly requests overwrite behavior.
7. Report result as `OK`, `SKIP`, or `FAIL` with reason.

## Local branch cleanup behavior

For action `clean-branches`, apply the following per repository:

1. Operate on local branches only (never delete remote branches by default).
2. Detect remote default branch from `origin/HEAD` (fallback to `main`, then `master` if needed).
3. Preserve protected local branches:
   - `develop`
   - local branch matching remote default branch
   - currently checked out branch
4. Delete other local branches that are fully merged into protected base branch.
5. If unmerged local branches exist, ask user which branch names to keep.
   - User response must be explicit:
     - list branch names to keep (comma-separated), or
     - `none` to confirm deleting all unmerged branches.
6. Delete unmerged branches not listed in keep set after user confirmation.
7. If no deletable branches exist, mark `SKIP` with reason.
8. Report each repo as `OK`, `SKIP`, or `FAIL` with short reason.

### Example dry-run output (`clean-branches`)

Use a compact, per-repo report before real deletion:

```text
repo-a | clean-branches | OK   | would delete: feature/x, bugfix/y
repo-b | clean-branches | SKIP | protected/current branch only
repo-c | clean-branches | SKIP | waiting user keep list for unmerged: hotfix/z
repo-d | clean-branches | FAIL | cannot resolve origin/HEAD
```

Then print totals:

```text
ok=1 skip=2 fail=1
```

### Example execution output (`clean-branches`)

Use a matching compact report for real deletion runs:

```text
repo-a | clean-branches | OK   | deleted: feature/x, bugfix/y
repo-b | clean-branches | SKIP | protected/current branch only
repo-c | clean-branches | OK   | deleted unmerged after confirm keep=none: hotfix/z
repo-d | clean-branches | FAIL | cannot resolve origin/HEAD
```

Then print totals:

```text
ok=1 skip=2 fail=1
```

## Safety checklist before write operations

- Verify branch expectations for target repos.
- Verify source branch exists (`develop` by default).
- Verify feature branch name is explicitly provided by user.
- Verify cleanup scope is local branches only.
- Verify protected branches (`develop`, remote default branch, current branch) are excluded.
- Verify authentication (`ssh` or HTTPS token) works.
- Confirm commit message and scope are intentional.
- Start with dry-run and inspect planned actions.

## Failure handling output format

Return failures in a compact table-like list:

- `<repo>` | `<action>` | `<error summary>` | `<recommended fix>`

Exit expectations:

- `0`: all repos successful or intentionally skipped
- `1`: one or more repos failed
- `2`: invalid input/arguments

## Clarifying question policy

Ask exactly one focused question only when blocked by missing critical input, such as:

- missing repos file path
- missing commit message for `commit`
- missing feature branch name for `feature-branch`
- missing source branch choice when `develop` is unavailable
- missing keep-list confirmation for unmerged branches in `clean-branches` (`none` means delete all)
- ambiguous protected branch policy for `clean-branches`
- ambiguous target branch policy that changes behavior

Otherwise proceed with safe defaults and clearly state them.
