import './just/just/default.just'
import './just/python/default.just'

project := 'rgi'

home_dir := env_var('HOME')
dev_home := env_var_or_default("DEVELOPMENT_HOME", home_dir + "/development")
cache_dir := dev_home + '/cache/' + project

default:
    just --list

init: init-just init-project init-src init-docs init-dev-pkgs
