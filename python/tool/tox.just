# Run unit tests with tox
[private]
tox-test-unit:
    {{pypm_run}} dotenv run -- tox -- -k unit --suppress-no-test-exit-code

# Run integration tests with tox
[private]
tox-test-integration:
    {{pypm_run}} dotenv run -- tox -- -k integration --suppress-no-test-exit-code

# Ron tox to test documentation generation
[private]
tox-test-docs:
    {{pypm_run}} tox --workdir {{cache_dir}}/tox -e doc

[private]
tox-test:
    {{pypm_run}} dotenv run -- tox -- --suppress-no-test-exit-code
