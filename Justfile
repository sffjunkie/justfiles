import 'just/just/update.just'
import 'just/python/python.just'

project := 'just'

set dotenv-filename := ".project"

home_dir := env_var('HOME')
dev_home := env_var_or_default("DEVELOPMENT_HOME", home_dir + "/development")
project_home := env_var_or_default("DEVELOPMENT_PROJECT_HOME", dev_home + "/project")
cache_dir := dev_home + '/cache/' + project

# Show this list
default:
    @just --list --unsorted
