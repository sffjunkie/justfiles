# Recipes
# - vcs-merge

import 'tool/git.just'

# Merge from a branch into this one
vcs-merge-from branch: (git-merge-from branch)

# Undo the last commit
vcs-undo-commit: git-undo-commit
