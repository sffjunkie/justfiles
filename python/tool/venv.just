# Initialize a virtual environment using the current python version
init-venv-python:
    #!/bin/sh
    venv_dir={{venv_home}}/{{project_name}}
    py_ver=$(python -c 'import sys; print(".".join([str(x) for x in tuple(sys.version_info)[:2]]))')
    [ -d $venv_dir/$py_ver ] && echo "venv already exists in $venv_dir/$py_ver" && exit 0 || :
    mkdir -p $venv_dir
    python -m venv $venv_dir/$py_ver

    grep -q "PYTHON_VERSION=" {{dotenv-filename}}
    if [ $? -eq 0 ]; then
        sed -Ei "s/^PYTHON_VERSION=[0-9]+(\.[0-9]+(\.[0-9]+)?)?/PYTHON_VERSION=$py_ver/" {{dotenv-filename}}
    else
        echo "PYTHON_VERSION=$py_ver" >> {{dotenv-filename}}
    fi
    echo "Initialized venv in $venv_dir/$py_ver"

# Initialize a virtual environment using the version defined in pyproject.toml
init-venv-pyproject:
    #!/bin/sh
    venv_dir={{venv_home}}/{{project_name}}
    mkdir -p $venv_dir
    py_ver=$(sed -nE 's/^requires-python = "[~>=]=(3\.[0-9]+)"$/\1/p' pyproject.toml)
    python -m venv $venv_dir/$py_ver
    echo "Initialized venv in $venv_dir/$py_ver"
