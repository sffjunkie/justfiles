import 'docs.just'
import 'linter.just'
import 'project-manager.just'
import 'test-executor.just'
import 'type-checker.just'
import 'virtualenv.just'

default_python_version := '3.11'

# Initialize python project with a venv, project manager, pyproject.toml, dev packages and docs
init-project: init-venv-python init-pyproject init-dev-pkgs init-docs

# Run a python repl
[no-cd]
repl:
    @{{pypm}} run python
