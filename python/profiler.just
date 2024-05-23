import './tool/pyinstrument.just'

# Profile the python module
profile-module *args: (pyinstrument-profile-module args)

# Profile a python script
profile-script script *args: (pyinstrument-profile-script script args)
