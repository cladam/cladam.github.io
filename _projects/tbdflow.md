---
layout: project
title: "tbdflow"
tagline: "A CLI to streamline and safeguard your Git workflow for Trunk-Based Development."
---

## Overview

`tbdflow` is a lightweight wrapper around Git that codifies an opinionated TBD workflow. It automates common tasks, encourages best practices like Conventional Commits, and helps maintain a clean and stable `main` branch.

## Philosophy

This tool is built around a specific philosophy of Trunk-Based Development:

* **Main is the default.** The `commit` command is your everyday go-to. It automates pulling the latest changes, committing, and pushing directly to `main`, promoting small, frequent integrations.
* **Branches are the exception.** While feature, release, and hotfix branches are supported, they’re treated as short-lived exceptions and not the norm.
* **Cleanup is automatic.** The complete command enforces branch short-livedness by merging and automatically tagging (release/hotfix) and deleting completed branches, helping keep your repo tidy.
* **Conventional Commits encouraged.** Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/) for clarity and consistency.

### Why not just use Git?

This CLI isn’t a replacement for Git. You’ll still reach for raw `git` when doing advanced work like rebasing, cherry-picking, or running `git bisect`.

This tool is as a **workflow assistant**, `tbdflow` encapsulates a repeatable, opinionated process to support your day-to-day development.

It offers three main benefits:

1. **Consistency across the team**
   Everyone follows the same steps for common tasks. Commits, branches, and releases are handled the same way every time, keeping your Git history clean and predictable.

2. **Less to remember**
   No need to recall the exact flags or sequences (like `pull --rebase`, `merge --no-ff`, or commit message formats). The CLI handles that, so you can stay focused on writing code.

3. **It supports "the TBD way"**
   This tool makes the preferred approach easy by providing a smooth, safe, and efficient path for 80% of everyday tasks. For the other 20%, you can always use Git directly.

### Configuration
`tbdflow` is configurable via two optional files in the root of your repository. To get started quickly, run `tbdflow init` to generate default versions of these files.

`.tbdflow.yml`
This file controls the core workflow of the tool. You can customize:
* The name of your main branch (e.g., main, trunk).
* Branch name prefixes (e.g. feat- instead of feature_).
* The threshold for stale branch warnings.
* Automatic tagging formats.
* Commit message linting rules.

`.dod.yml`
This file controls the interactive Definition of Done checklist for the commit command. 

### Features

#### The Definition of Done (DoD) Check
To move beyond just automating process, `tbdflow` integrates an optional pre-commit quality check. If a `.dod.yml` file is present in your repository, the commit command will present an interactive checklist to ensure your work meets the team's agreed-upon standards.

**Example** `.dod.yml`:

```yaml
# --- Interactive Checklist ---
checklist:
  - "Code is clean, readable, and adheres to team coding standards."
  - "All relevant automated tests (unit, integration) pass successfully."
  - "New features or bug fixes are covered by appropriate new tests."
  - "Security implications of this change have been considered."
  - "Relevant documentation (code comments, READMEs, etc.) is updated."⏎
```

If you try to proceed without checking all items, the tool will offer to add a TODO list to your commit message footer, ensuring the incomplete work is tracked directly in your Git history.

#### Commit Message Linting

If a `.tbdflow.yml` file is present and contains a lint section, the commit command will automatically validate your commit message against the configured rules before the DoD check. This provides immediate feedback on stylistic and structural conventions.

**Default linting rules:**

```yaml
main_branch_name: main
stale_branch_threshold_days: 1
branch_prefixes:
  feature: feature_
  release: release_
  hotfix: hotfix_
automatic_tags:
  release_prefix: v
  hotfix_prefix: hotfix_
lint:
  conventional_commit_type:
    enabled: true
    allowed_types:
    - build
    - chore
    - ci
    - docs
    - feat
    - fix
    - perf
    - refactor
    - revert
    - style
    - test
  issue_key_missing:
    enabled: false
    pattern: ^[A-Z]+-\d+$
  subject_line_rules:
    subject_line_max_length: 72
    subject_line_not_capitalized: true
    subject_line_no_period: true
  body_line_rules:
    body_max_line_length: 80
```

### Examples of how to use tbdflow

#### Initialise

Set up a new local repo

```bash
# Create a new local repo
mkdir tbd && cd tbd
tbdflow init
```

*Next steps:*
1. Create a repository on your git provider (e.g. GitHub).
2. Run the following command to link it:
   git remote add origin `<your-repository-url>`
3. Then run this command to push your initial commit:
   git push -u origin main

#### Using tbdflow 

*Default flow:*

```bash
# A new feature
tbdflow commit -t feat -s auth -m "Add password reset endpoint"

# A bug fix with a breaking change
tbdflow commit -t fix -m "Correct user permission logic" -b
tbdflow commit -t refactor -m "Rename internal API" --breaking --breaking-description "The `getUser` function has been renamed to `fetchUser`."

# A bug fix with a new tag
tbdflow commit -t fix -m "Correct user permission logic" --tag "v1.1.1"

# Reference an issue
tbdflow commit -t feat -m "Add feature x as part of bigger thing" --issue "ABC-123"
```

*Exceptions a.k.a. branches*

```bash
# Create a feature branch
tbdflow feature -n "user-profile-page"

# Create a release branch
tbdflow release -v "2.1.0"

# Create a release branch from a specific commit
tbdflow release -v "2.1.0" -f "39b68b5"

# Create a hotfix branch
tbdflow hotfix -n "critical-auth-bug"

# Complete a feature branch
tbdflow complete -t feature -n "user-profile-page"

# Complete a release branch (this will be tagged v2.1.0)
tbdflow complete -t release -n "2.1.0"
```

#### Misc commands

`tbdflow` has a couple of commands that can be beneficial to use but they are not part of the workflow, they are for inspecting the state of the repository.

```bash
# Does a pull, shows latest changes to main branch, and warns about stale branches.
tbdflow sync

# Checks the status of the working dir
tbdflow status

# Shows the current branch name
tbdflow current-branch

# Explicitly checks for local branches older than one day.
tbdflow check-branches
```

### 5. Advanced Usage

#### Shell Completion

To make `tbdflow` even faster to use, you can enable shell completion. Add one of the following lines to your shell's configuration file.

For Zsh (`~/.zshrc`):

```bash
eval "$(tbdflow generate-completion zsh)"
```

For Bash (`~/.bashrc`):

```bash
eval "$(tbdflow generate-completion bash)"
```

For Fish (`~/.config/fish/config.fish`):

```bash
tbdflow generate-completion fish | source
```

#### Man Page Generation

You can generate a man page for `tbdflow` by running the following command:

```bash
tbdflow generate-man-page > tbdflow.1
```

### Development

All development happens at [tbdflow.git](https://github.com/cladam/tbdflow). Feedback and contributions welcome!

