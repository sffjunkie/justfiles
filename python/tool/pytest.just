# Run unit tests
test-unit:
    {{pypm_run}} dotenv run pytest -k unit

# Run integration tests
test-integration:
    {{pypm_run}} dotenv run pytest -k integration
