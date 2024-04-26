import './just/python/pdm.just'
import './just/python/sphinx.just'

pypm := 'pdm'
lint_tool := 'ruff'
test_tool := 'pytest'
docs_tool := 'sphinx'

init-project:
    #!/bin/sh
    if [ -f pyproject.toml ]; then
        echo "Project already initialised"
    else
        {{pypm}} init
    fi

init-src:
    mkdir -p src/{{project}}

init-docs:
    #!/bin/sh
    if [ -f src/docs/conf.py ]; then
        echo "Docs already initialised"
    else
        mkdir -p docs
        mkdir -p src/docs
        pdm add -dG dev {{docs_tool}}
        user_name=$(git config user.name)
        sphinx-quickstart --project={{project}} --author=${user_name} .
    fi

init-dev-pkgs:
    pdm add -dG dev {{lint_tool}} {{test_tool}}

# Lint the source
lint:
    #!/bin/sh
    command -v {{lint_tool}} &>/dev/null  && prefix="" || prefix="pdm run"
    ${prefix} {{lint_tool}} check --config "cache-dir = '{{cache_dir}}/ruff'" src/{{project}}
    if [ $? -eq 0 ]; then
        echo "{{lint_tool}}: no problems found"
    fi

build:
    {{pypm}} build

build-docs:
    {{docs_tool_build}}

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
