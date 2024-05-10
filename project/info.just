# Display project information
project-info:
    #!/bin/sh
    echo -e "{{color_green}}Project Information{{color_normal}}"
    echo -e "    {{color_blue}}Name{{color_normal}}:     {{project_name}}"
    echo -e "    {{color_blue}}Langauge{{color_normal}}: {{project_language}}"
    echo -e "    {{color_blue}}Justfile{{color_normal}}:"
    echo -e "        File  : {{justfile()}}"
    cd ./just
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ $? -ne 0 ]; then
        current_branch="None"
    fi
    echo -e "        Branch: $current_branch"
    cd ..
