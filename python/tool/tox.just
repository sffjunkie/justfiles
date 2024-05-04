no_tests_collected := '5'

# Run unit tests with tox
[private]
tox-test-unit:
    {{pypm_run}} dotenv run -- pytest -k unit --suppress-no-test-exit-code

# Run integration tests with tox
[private]
tox-test-integration:
    {{pypm_run}} dotenv run -- pytest -k integration --suppress-no-test-exit-code

# Ron tox to test documentation generation
test-docs:
    {{pypm_run}} tox --workdir {{cache_dir}}/tox -e doc

export COVERAGE_FILE := cache_dir + '/coverage'
# Generate test coverage metrics
test-coverage:
    {{pypm_run}} pytest -o cache_dir={{cache_dir}}/pytest --cov=src/{{project_name}} {{tests_dir}}

# Generate test coverage HTML report
test-coverage-html:
    {{pypm_run}} coverage html -d {{cache_dir}}/htmlcov/
    echo "Opening report in browser"
    @xdg-open "{{cache_dir}}/htmlcov/index.html" 2>&1 >/dev/null

# Show test coverage in the terminal
test-coverage-term:
    {{pypm_run}} coverage report
