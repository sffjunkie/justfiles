init-venv-python:
    #!/bin/sh
    mkdir -p {{dev_home}}/venv/{{project_name}}
    cd {{dev_home}}/venv/{{project_name}}
    py_ver=$(python -c 'import sys; print(".".join([str(x) for x in tuple(sys.version_info)[:2]]))')
    mkdir $py_ver
    python -m venv $py_ver
