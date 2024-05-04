# Run unit tests with pytest
[private]
pytest-test-unit:
    {{pypm_run}} dotenv run -- pytest -k unit --suppress-no-test-exit-code

# Run integration tests with pytest
[private]
pytest-test-integration:
    {{pypm_run}} dotenv run -- pytest -k integration --suppress-no-test-exit-code

[private]
pytest-test:
    {{pypm_run}} dotenv run -- pytest --suppress-no-test-exit-code
