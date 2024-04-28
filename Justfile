import 'just/update.just'
import 'python/python.just'

project := 'just'

home_dir := env_var('HOME')
dev_home := env_var_or_default("DEVELOPMENT_HOME", home_dir + "/development")
project_home := env_var_or_default("DEVELOPMENT_PROJECT_HOME", dev_home)
cache_dir := dev_home + '/cache/' + project

# Show this list
default:
    @just --list --unsorted
