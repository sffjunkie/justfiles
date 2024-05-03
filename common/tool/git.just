merge-style := "--ff"

alias git-merge := vcs-merge

# Merge from a branch into this one
vcs-merge from-branch:
    #!/bin/sh
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ "{{from-branch}}" == "$current_branch" ]; then
        echo "Already in branch {{from-branch}} - no merging necessary"
        exit 0
    fi
    git merge {{merge-style}} {{from-branch}}

alias git-undo-commit := vcs-undo-commit

# Undo the last commit
vcs-undo-commit:
    git reset --hard HEAD~1
