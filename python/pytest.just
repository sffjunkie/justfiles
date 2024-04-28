test_tool := 'pytest'

test-unit:
    {{pypm}} run pytest -k unit

test-integration:
    {{pypm}} run pytest -k integration

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
