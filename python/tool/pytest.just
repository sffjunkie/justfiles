# Run unit tests with pytest
[private]
pytest-unit:
    {{pypm_run}} dotenv run -- pytest -k unit

# Run integration tests with pytest
[private]
pytest-integration:
    {{pypm_run}} dotenv run -- pytest -k integration
