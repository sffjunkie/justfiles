import 'mypy.just'
import 'pdm.just'
import 'pytest.just'
import 'ruff.just'
import 'sphinx.just'

alias build := build-project

# Initialize python project with a project manager, pyproject, dev packages and docs
project-init: init-pyproject init-dev-pkgs init-docs

# Run a python repl
repl:
    @{{pypm}} run python
