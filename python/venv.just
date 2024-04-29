# Create a virtual environment using the current python version
[private]
init-venv-python:
    #!/bin/sh
    py_ver=$(python -c 'import sys; print(".".join([str(x) for x in tuple(sys.version_info)[:2]]))')
    venv_dir={{dev_home}}/venv/{{project_name}}/
    mkdir -p $venv_dir
    cd $venv_dir
    python -m venv $py_ver
