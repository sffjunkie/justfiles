# Display project information
project-info:
    @echo -e "{{color_green}}Project Information{{color_normal}}"
    @echo -e "    {{color_blue}}Name{{color_normal}}:     {{project_name}}"
    @echo -e "    {{color_blue}}Langauge{{color_normal}}: {{project_language}}"
    @echo -e "    {{color_blue}}Justfile{{color_normal}}: {{justfile()}}"
