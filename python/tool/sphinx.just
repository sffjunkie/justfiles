doc_tools := 'sphinx'

# Initialize docs directory with Sphinx
[private]
sphinx-init-docs:
    #!/bin/sh
    if [ -f src/docs/conf.py ]; then
        echo -e "{{color_yellow}}Docs already initialised{{color_normal}}"
    else
        [ ! -d {{docs_src_dir}} ] && mkdir -p {{docs_src_dir}} || :
        user_name=$(git config user.name)
        cd {{docs_src_dir}}
        {{pypm_run}} sphinx-quickstart \
            -q \
            -v="0.1.0" \
            --release="0.1.0" \
            --project="{{project_name}}" \
            --author="${user_name}" \
            --language="en" \
            --no-sep
    fi

# Build docs with Sphinx
[private]
sphinx-build-docs:
    {{pypm_run}} sphinx-build --builder html {{docs_src_dir}} {{docs_build_dir}}

# Test doc building with Sphinx
[private]
sphinx-test-docs:
    #!/bin/sh
    out_dir=$(mktemp -d)
    {{pypm_run}} sphinx-build --fail-on-warning --builder html {{docs_src_dir}} $out_dir
    rc=$?
    rm -rf $out_dir
    exit $rc
