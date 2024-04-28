# just -  A collection of Justfiles for development tasks

A set of [Justfiles](https://github.com/casey/just) for my development tasks.

Currently only targets Python projects.

I currently categorize projects into 2 stages

1. bluesky - Where I create projects I'm tinkering with that haven't been released to the world
2. project - Projects that are released on Github

Development related files are stored in `$HOME/development` with `project` and
`bluesky` under this.

There are 2 main Justfiles

1. `Justfile.init`
   - Initializes a new project with `init-project` and `init-bluesky` recipes.
   - Retrieves the main Justfiles from Github with `init-just`
2. `Justfile` - The main entry point for project management

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

## Project layout

The current project layout is as follows

```
src
    <project name>
    docs - source files for the documentation
tests
docs - Built documentation
```

## `Justfile`

Main recipes for project management

Running `just` will display a list of the recipes.

## Justfile

`update-just` - Updates the local Justfiles from Github

## Python

For Python projects I'm currently using the following tools

- [pdm](https://pdm-project.org/en/latest/)  - https://github.com/pdm-project/pdm
- [pytest](https://docs.pytest.org/) - https://github.com/pytest-dev/pytest
- [ruff](https://docs.astral.sh/ruff/) - https://github.com/astral-sh/ruff
- [mypy](https://mypy.readthedocs.io/en/stable/) - https://github.com/python/mypy
- [sphinx](https://www.sphinx-doc.org/en/master/) - https://github.com/sphinx-doc/sphinx

### Python Recipes

`init` - Initializes a new project using `pdm`,
adds the required development packages
and creates a set of documentation files.

Works by running the following recipes `init-pyproject`, `init-dev-pkgs`, and `init-docs`

`build` - Uses `pdm` to build the distribution files

`build-docs` - Builds the documentation using Sphinx

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
