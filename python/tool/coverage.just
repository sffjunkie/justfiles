export COVERAGE_FILE := cache_dir + '/coverage'
# Generate test coverage metrics
test-coverage:
    {{pypm_run}} pytest -o cache_dir={{cache_dir}}/pytest --cov=src/{{project_name}} tests

# Generate test coverage HTML report
test-coverage-html:
    {{pypm_run}} coverage html -d {{cache_dir}}/htmlcov/
    @xdg-open "{{cache_dir}}/htmlcov/index.html" 2>&1 >/dev/null

# Show test coverage in the terminal
test-coverage-term:
    {{pypm_run}} coverage report
