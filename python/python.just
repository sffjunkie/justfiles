import 'pdm.just'
import 'sphinx.just'

lint_tool := 'ruff'
test_tool := 'pytest'
docs_tool := 'sphinx'

alias build := python-project-build

init-src:
    mkdir -p src/{{project}}

init-dev-pkgs: 
    pdm add -dG dev {{lint_tool}} {{test_tool}}

# Run tox to test unit and integration tests
test:
    {{pypm}} run tox --workdir {{cache_dir}}/tox

test-unit:
    {{pypm}} run pytest -k unit

test-integration:
    {{pypm}} run pytest -k integration

# Ron tox to test documentation generation
test-docs:
    {{pypm}} run tox --workdir {{cache_dir}}/tox -e doc

# Run the type checker (mypy)
test-types:
    {{pypm}} run mypy --cache-dir={{cache_dir}}/mypy ./src/{{project}}

export COVERAGE_FILE := cache_dir + '/coverage'
# Generate test coverage metrics
test-coverage:
    {{pypm}} run pytest -o cache_dir={{cache_dir}}/pytest --cov=src/{{project}} src/test

# Generate test coverage HTML report
test-coverage-html:
    {{pypm}} run coverage html -d {{cache_dir}}/htmlcov/
    @xdg-open "{{cache_dir}}/htmlcov/index.html" 2>&1 >/dev/null

# Show test coverage in the terminal
test-coverage-term:
    {{pypm}} run coverage report

# Run a python repl
repl:
    @{{pypm}} run python
