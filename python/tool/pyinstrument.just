pyinstrument-profile-module args:
    {{pypm_run}} pyinstrument -m {{project_name}} {{args}}

pyinstrument-profile script args:
    {{pypm_run}} pyinstrument {{script}} {{args}}
