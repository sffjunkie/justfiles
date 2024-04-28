import 'mypy.just'
import 'pdm.just'
import 'pytest.just'
import 'ruff.just'
import 'sphinx.just'
import 'venv.just'

# Initialize python project with a project manager, pyproject, dev packages and docs
init: init-pyproject init-dev-pkgs init-docs

# Initialize a virtual environment
init-venv: init-venv-python init-venv-use

# Run a python repl
repl:
    @{{pypm}} run python
