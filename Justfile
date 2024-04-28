import 'just/just/update.just'
import 'just/python/python.just'

set dotenv-filename := ".project"

project_name := env_var("PROJECT_NAME")
project_language := env_var("PROJECT_LANGUAGE")

home_dir := env_var('HOME')
dev_home := env_var_or_default("DEVELOPMENT_HOME", home_dir + "/development")
project_home := env_var_or_default("DEVELOPMENT_PROJECT_HOME", dev_home + "/project")
cache_dir := dev_home + '/cache/' + project_name

[private]
default:
    @just --list
