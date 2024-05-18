merge-style := "--ff"

# Merge from a branch into this one
[private]
git-merge-from branch:
    #!/bin/sh
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ $? -ne 0 ]; then
        echo -e "{{color_red}}No HEAD found, have you cmmitted anything yet?{{color_normal}}"
        exit 1
    fi
    if [ ! $(git for-each-ref --format='%(refname)' refs/heads/ | grep {{branch}}) ]; then
        echo -e "{{color_red}}Branch {{branch}} does not exist{{color_normal}}"
        exit 1
    fi
    if [ "{{branch}}" == "$current_branch" ]; then
        echo -e "{{color_yellow}}Already in branch {{branch}} - no merging necessary{{color_normal}}"
        exit 0
    fi
    git merge {{merge-style}} {{branch}}

# Undo the last commit
[private]
git-undo-commit:
    git reset --hard HEAD~1


[private, no-cd]
git-init:
    #!/bin/sh
    command -v git 2>&1 >/dev/null
    if [ $? -ne 0 ]; then
        echo -e "{{color_red}}git needs to be installed{{color_normal}}"
        exit 1
    fi

    if [ -d .git ]; then
        echo "Git repository already initialized"
    else
        git init .
    fi
