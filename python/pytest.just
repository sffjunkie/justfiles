test-unit:
    {{pypm}} run pytest -k unit

test-integration:
    {{pypm}} run pytest -k integration
