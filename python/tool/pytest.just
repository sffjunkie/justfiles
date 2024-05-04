# Run unit tests with pytest
[private]
pytest-test-unit:
    #!/bin/sh
    {{pypm_run}} dotenv run -- pytest -k unit --suppress-no-test-exit-code
    rc=$?
    if [ $rc -eq {{no_tests_collected}} ]; then
        exit 0
    else
        exit $rc
    fi

# Run integration tests with pytest
[private]
pytest-test-integration:
    #!/bin/sh
    no_tests_collected=5
    {{pypm_run}} dotenv run -- pytest -k integration --suppress-no-test-exit-code
    rc=$?
    if [ $rc -eq {{no_tests_collected}} ]; then
        exit 0
    else
        exit $rc
    fi
