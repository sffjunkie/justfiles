# Run the type checker (mypy)
test-types:
    {{pypm}} run mypy --cache-dir={{cache_dir}}/mypy ./src/{{project}}
