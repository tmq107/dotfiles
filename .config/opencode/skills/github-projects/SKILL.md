---
name: github-projects
description: Manage GitHub Projects with gh CLI. Use for listing projects, listing project items, creating draft project items from an idea, or adding existing issues and PRs to a project.
---

# GitHub Projects

Use `gh` CLI to work with GitHub Projects.

## Helper script

Prefer the wrapper script for repeatable actions:

```bash
./scripts/gh-projects.sh list-projects --owner <owner>
./scripts/gh-projects.sh list-items --owner <owner> --project <number>
./scripts/gh-projects.sh create-item --owner <owner> --project <number> --title "<title>" --body "<body>"
./scripts/gh-projects.sh add-item --owner <owner> --project <number> --url <issue-or-pr-url>
```

## Setup

Check auth and scope first:

```bash
gh auth status
gh auth refresh -s project
```

## Flow

When user wants project work:

1. Ask which GitHub owner/org to use if not already known.
2. List available projects.
3. Ask which project(s) should be used.
4. Ask for the idea or task.
5. Analyze the idea into a project-ready item description.
6. Confirm the final title/body if needed.
7. Create the item.

## List projects

```bash
gh project list --owner <owner> --format json
gh project list --owner <owner> --closed --format json
```

Use the JSON output to summarize:
- project number
- title
- state/open or closed
- short note if needed

## List items in a project

```bash
gh project item-list <number> --owner <owner> --format json
```

## Create a draft item

Use for an idea that is not yet an issue/PR:

```bash
gh project item-create <number> --owner <owner> --title "<short title>" --body "<full description>"
```

## Add existing issue or PR

Use when user gives an issue/PR URL:

```bash
gh project item-add <number> --owner <owner> --url <url>
```

## How to analyze user idea

Turn the idea into a clean body with:
- Problem
- Goal
- Scope
- Acceptance criteria
- Notes / risks

Keep title short and action-oriented.

## Suggested reply pattern

- Show available projects.
- Ask user to pick project(s).
- Restate idea as a concise title.
- Provide description draft.
- Create item after confirmation.

## Sample prompts

- "List my projects for owner <owner>"
- "Show project 12 items for owner <owner>"
- "Create draft item in project 12 for owner <owner> from idea: <idea>"
- "Add issue <url> to project 12 for owner <owner>"
- "Analyze this idea for a project item: <idea>"

## Example

User: "Add dark mode settings"

Draft body:
- Problem: Users need a persistent dark mode preference.
- Goal: Add UI and storage for theme selection.
- Scope: settings toggle, save preference, apply theme on load.
- Acceptance criteria: toggle works, preference persists, app loads correct theme.
- Notes: follow existing theme tokens.
