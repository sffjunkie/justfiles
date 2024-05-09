merge-style := "--ff"

# Merge from a branch into this one
[private]
git-merge-from branch:
    #!/bin/sh
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ "{{branch}}" == "$current_branch" ]; then
        echo "Already in branch {{branch}} - no merging necessary"
        exit 0
    fi
    git merge {{merge-style}} {{branch}}

# Undo the last commit
[private]
git-undo-commit:
    git reset --hard HEAD~1
