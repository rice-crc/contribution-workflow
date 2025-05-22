# Contribution Workflow

## Table of Contents

* [Overview](#overview)
* [Central Repository](#central-repository)
* [Fork-and-Pull](#fork-and-pull)
* [TLDR](#tldr)

## Overview

This document details common git contribution workflows used when working with the CRC on GitHub.

[Return to Top](#contribution-workflow)

## Central Repository

When following the Central Repository workflow:

- The `origin` remote refers to the parent repository
- Merge changes through Pull Requests from `origin/working-branch` to `origin/main`

Keep the following in mind when contributing code:

- Keep your local repository in sync with origin changes
- Always start new work with a new working branch
- Don't commit directly to the main branch
- Consider syncing your working branch with origin before opening a Pull Request if the repository is very active or if there is a chance of overlapping changes
- Ensure that your code is tested and complete. If you need feedback on unfinished work, feel free to create a Pull Request for review, but make sure to clearly mark it as a work-in-progress or for discussion purposes only
- Clean up your local repository once your Pull Request has been merged

Contribute by following the step-by-step git process outlined below.

```shell
###
### Daily Work
###

# Pull the latest changes from origin to ensure your main branch is up-to-date.

git checkout main
git pull

# Create a new branch based off of main to isolate your work.

git checkout -b working-branch

# Commit your changes using a concise and descriptive title.

git add .
git commit -m "Add small change"

# (Optional) Clean up before pushing your branch for a Pull Request:
#
# Use this step if origin activity is high or you're collaborating 
# closely with others on overlapping features. Rebasing is a preference
# to minimize merge commits. Only rebase on your local working branch.
#
# - Pull the latest changes from origin
# - Rebase the changes in your working branch
# - Commit fixes to resolve any merge conflicts

git pull --rebase origin main

git add .
git commit -m "Fixes merge conflict"

###
### Pull Request
###

# Push your working branch to origin on GitHub.

git push -u origin HEAD

# Open a Pull Request (PR) to merge your changes upstream:
# - Go to https://github.com/rice-crc/<repo>
# - Go to Pull Requests
# - Click "New pull request"
# - Set the base repository and branch as the parent and main
# - Set the head repository and branch as the parent and working branch
# - Give a concise title and description to the PR

# If there is feedback during the PR review:
# - Commit changes to resolve the feedback
# - Update the PR by pushing the branch to your fork

git add .
git commit -m "Resolves PR feedback"
git push origin HEAD

###
### Clean Up
###

# After the PR is merged and your work is complete, delete your working branch.

git checkout main
git branch -D working-branch

# Pull the latest changes from origin to make sure everything is in sync.

git pull
```

[Return to Top](#contribution-workflow)

## Fork-and-Pull

When following a fork-and-pull workflow:

- The `upstream` remote refers to the parent and `origin` refers to your fork
- Merge changes through Pull Requests from `origin/working-branch` to `upstream/main`

Keep the following in mind when contributing code:

- Keep your local and fork repositories in sync with upstream changes
- Always start new work with a new working branch
- Don't commit directly to the main branch
- Consider syncing your working branch with upstream before opening a Pull Request if the repository is very active or if there is a chance of overlapping changes
- Ensure that your code is tested and complete. If you need feedback on unfinished work, feel free to create a Pull Request for review, but make sure to clearly mark it as a work-in-progress or for discussion purposes only
- Clean up your local repository once your Pull Request has been merged

Contribute by following the step-by-step git process outlined below.

```shell
###
### Daily Work
###

# Pull the latest changes from upstream to ensure your main branch is up-to-date.

git checkout main
git pull upstream main

# Create a new branch based off of main to isolate your work.

git checkout -b working-branch

# Commit your changes using a concise and descriptive title.

git add .
git commit -m "Add small change"

# (Optional) Clean up before pushing your branch for a Pull Request:
#
# Use this step if upstream activity is high or you're collaborating 
# closely with others on overlapping features. Rebasing is a preference
# to minimize merge commits. Only rebase on your local working branch.
#
# - Pull the latest changes from upstream
# - Rebase the changes in your working branch
# - Commit fixes to resolve any merge conflicts

git pull --rebase upstream main

git add .
git commit -m "Fixes merge conflict"

###
### Pull Request
###

# Push your working branch to your fork on GitHub.

git push -u origin HEAD

# Open a Pull Request (PR) to merge your changes upstream:
# - Go to https://github.com/<user>/<repo>
# - Go to Pull Requests
# - Click "New pull request"
# - Set the base repository and branch as the parent and main
# - Set the head repository and branch as your fork and working branch
# - Give a concise title and description to the PR

# If there is feedback during the PR review:
# - Commit changes to resolve the feedback
# - Update the PR by pushing the branch to your fork

git add .
git commit -m "Resolves PR feedback"
git push origin HEAD

###
### Clean Up
###

# After the PR is merged and your work is complete, delete your working branch.

git checkout main
git branch -D working-branch

# Pull the latest changes from upstream and update your fork on GitHub to make sure everything is in sync.

git pull upstream main
git push origin main
```

[Return to Top](#contribution-workflow)

## TLDR

The following git alias remotely executes the `tldr.sh` script in this repository to output a concise reference for the contribution workflows.

```shell
###
### Usage: git crc [central|fork]
###

# Add the alias to ~/.gitconfig

git config --global alias.workflow '!sh -c "curl -sSL https://raw.githubusercontent.com/rice-crc/contribution-workflow/main/tldr.sh | sh -s $1" -'

# Remove the alias

git config --global --unset alias.workflow
```

[Return to Top](#contribution-workflow)
