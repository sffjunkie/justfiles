# Recipes
# - vcs-merge

import 'tool/git.just'

vcs-merge from-branch: (git-merge from-branch)

vcs-undo-commit: git-undo-commit
