# justfiles -  A collection of Justfiles for development tasks

A set of [Justfiles](https://github.com/casey/just) for my development tasks.

Currently only targets Python projects.

I currently categorize projects into 2 stages

1. bluesky - Where I create projects I'm tinkering with that haven't been released to the world
2. project - Projects that are released on Github

There are 2 main Justfiles

1. `Justfile.init`
   - Initializes a new project with `init-project` and `init-bluesky` recipes. Can be run from any directory.
   - Retrieves the main Justfiles from Github with `init-just`. Run from within the project diredctory.
2. `Justfile` - The main entry point for project management. Includes the other Justfiles.

## Development Layout

Development related files are stored in `$HOME/development` with the folowing structure

```
project
    <project-name>
bluesky
    <project-name>
venv
    <project-name>
        <python-version>
```

## Project layout

The current project layout is as follows

```
src
    <project name>
    docs - source files for the documentation
tests
docs - Built documentation
```

## `Justfile.init`

Use the following to create a new project

```sh
just -f <path to Justfile.init> init-project <project-name> <project-language>
```

or

```sh
just -f <path to Justfile.init> init-bluesky <project-name> <project-language>
```

If not specified the default language is 'python'.

Use the following to download the Justfiles to the current directory

```sh
just -f <path to Justfile.init> init-just
```

## `Justfile`

Main recipes for project management

Running `just` will display a list of the recipes.

### Justfile

`update-just` - Updates the local Justfiles from Github

### Python

#### Python Recipes

`build` - Uses `pdm` to build the distribution files

`build-docs` - Builds the documentation using Sphinx

`init` - Initializes a new project using `pdm`,
adds the required development packages
and creates a set of documentation files.
Works by running the following recipes `init-pyproject`, `init-dev-pkgs`, and `init-docs`

`init-venv` - Intializes a virtual environment as configures the project manager `pdm` to use it

`lint` - Runs the `ruff` linter

`repl` - Opens a Python REPL

`test` - Uses `tox` to run the unit and integration tests

`test-coverage` - Generates test coverage metrics

`test-coverage-html` - Creates the test coverage report in HTML and opens it in a browser.

`test-coverage-text` - Creates the test coverage report and displays it in the terminal.

`test-docs` - Uses tox to test the documentation generation

`test-unit` - Runs unit tests using `pytest`

`test-integration` - Runs integration tests using `pytest`

`test-types` - Uses `mypy` to perform type checking

#### Python Tools

For Python projects I'm currently using the following tools

- pdm
  - [docs](https://pdm-project.org/en/latest/)
  - [Github](https://github.com/pdm-project/pdm)
- pytest
  - [docs](https://docs.pytest.org/)
  - [Github](https://github.com/pytest-dev/pytest)
- ruff
  - [docs](https://docs.astral.sh/ruff/)
  - [Github](https://github.com/astral-sh/ruff)
- mypy
  - [docs](https://mypy.readthedocs.io/en/stable/)
  - [Github](https://github.com/python/mypy)
- sphinx
  - [docs](https://www.sphinx-doc.org/en/master/)
  - [Github](https://github.com/sphinx-doc/sphinx)
