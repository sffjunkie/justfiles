import 'mypy.just'
import 'pdm.just'
import 'pytest.just'
import 'ruff.just'
import 'sphinx.just'
import 'venv.just'

default_python_version := '3.11'

# Initialize python project with a venv, project manager, pyproject.toml, dev packages and docs
init-project: init-venv-python init-pyproject init-dev-pkgs init-docs

# Run a python repl
repl:
    @{{pypm}} run python
