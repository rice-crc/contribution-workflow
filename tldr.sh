#!/usr/bin/env bash

central() {
    cat <<EOF

Contribution Workflow: Central Repository
See https://github.com/rice-crc/contribution-workflow.

1. Start work:
    git checkout main
    git pull
    git checkout -b working-branch

2. Commit changes:
    git add .
    git commit -m "Add small change"

3. (Optional) Clean up before Pull Request:
    git pull --rebase origin main
    
4. Push changes for Pull Request:
    git push -u origin HEAD

6. Clean up after changes merged:
    git checkout main
    git branch -D working-branch
    git pull

EOF
}

fork() {
    cat <<EOF

Contribution Workflow: Fork-and-Pull
See https://github.com/rice-crc/contribution-workflow.

1. Start work:
    git checkout main
    git pull upstream main
    git checkout -b working-branch

2. Commit changes:
    git add .
    git commit -m "Add small change"

3. (Optional) Clean up before Pull Request:
    git pull --rebase upstream main
    
4. Push changes for Pull Request:
    git push -u origin HEAD

6. Clean up after changes merged:
    git checkout main
    git branch -D working-branch
    git pull upstream main
    git push origin main

EOF
}

if [ $# -eq 0 ]; then
    central
elif [ $1 == "central" ]; then
    central
elif [ $1 == "fork" ]; then
    fork
else
    echo "Invalid option. Usage: git crc [central|fork]"
fi