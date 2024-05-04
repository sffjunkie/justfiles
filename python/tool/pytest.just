# Run unit tests
test-unit:
    #!/bin/sh
    no_tests_collected=5
    {{pypm_run}} dotenv run -- pytest -k unit
    rc=$?
    if [ $rc -eq $no_tests_collected ]; then
        exit 0
    else
        exit $rc
    fi

# Run integration tests
test-integration:
    #!/bin/sh
    no_tests_collected=5
    {{pypm_run}} dotenv run -- pytest -k integration
    rc=$?
    if [ "$rc" -eq "$no_tests_collected" ]; then
        exit 0
    else
        exit $rc
    fi
