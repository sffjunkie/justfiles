# Run unit tests
test-unit:
    {{pypm_run}} pytest -k unit

# Run integration tests
test-integration:
    {{pypm_run}} pytest -k integration
