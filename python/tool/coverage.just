export COVERAGE_FILE := cache_dir + '/coverage'
# Generate test coverage metrics
[private]
coverage-test-coverage:
    {{pypm_run}} pytest -o cache_dir={{cache_dir}}/pytest --cov=src/{{project_name}} {{tests_dir}}

# Generate test coverage HTML report
[private]
coverage-test-coverage-html:
    {{pypm_run}} coverage html -d {{cache_dir}}/htmlcov/
    @xdg-open "{{cache_dir}}/htmlcov/index.html" 2>&1 >/dev/null

# Show test coverage in the terminal
[private]
coverage-test-coverage-term:
    {{pypm_run}} coverage report
