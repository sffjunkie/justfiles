merge-style := "--ff"

# Merge from a branch into this one
[private]
git-merge from-branch:
    #!/bin/sh
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ "{{from-branch}}" == "$current_branch" ]; then
        echo "Already in branch {{from-branch}} - no merging necessary"
        exit 0
    fi
    git merge {{merge-style}} {{from-branch}}

# Undo the last commit
[private]
git-undo-commit:
    git reset --hard HEAD~1
