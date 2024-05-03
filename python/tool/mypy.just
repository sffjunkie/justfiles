# Run the type checker (mypy)
test-types:
    {{pypm_run}} mypy --cache-dir={{cache_dir}}/mypy {{pkg_src_dir}}
