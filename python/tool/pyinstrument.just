[private]
pyinstrument-profile-module args:
    {{pypm_run}} pyinstrument -m {{project_name}} {{args}}

[private]
pyinstrument-profile-script script args:
    {{pypm_run}} pyinstrument {{script}} {{args}}
