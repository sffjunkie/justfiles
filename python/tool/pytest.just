# Run unit tests with pytest
[private]
pytest-test-unit args:
    {{pypm_run}} dotenv run -- pytest -k unit --suppress-no-test-exit-code {{args}}

# Run integration tests with pytest
[private]
pytest-test-integration args:
    {{pypm_run}} dotenv run -- pytest -k integration --suppress-no-test-exit-code {{args}}

[private]
pytest-test args:
    {{pypm_run}} dotenv run -- pytest --suppress-no-test-exit-code {{args}}
