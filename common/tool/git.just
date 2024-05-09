merge-style := "--ff"

# Merge from a branch into this one
[private]
git-merge-from branch:
    #!/bin/sh
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ ! $(git for-each-ref --format='%(refname)' refs/heads/ | grep {{branch}}) ]; then
        echo "Branch {{branch}} does not exist"
        exit 1
    fi
    if [ "{{branch}}" == "$current_branch" ]; then
        echo "Already in branch {{branch}} - no merging necessary"
        exit 0
    fi
    git merge {{merge-style}} {{branch}}

# Undo the last commit
[private]
git-undo-commit:
    git reset --hard HEAD~1
