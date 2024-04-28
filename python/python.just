import 'mypy.just'
import 'pdm.just'
import 'pytest.just'
import 'ruff.just'
import 'sphinx.just'

alias build := build-project

project-init: init-pyproject init-dev-pkgs init-docs

# Run tox to test unit and integration tests
test:
    {{pypm_run}} tox --workdir {{cache_dir}}/tox

# Ron tox to test documentation generation
test-docs:
    {{pypm_run}} tox --workdir {{cache_dir}}/tox -e doc

# Run a python repl
repl:
    @{{pypm}} run python
