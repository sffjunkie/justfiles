# Enter a nix shell with the specified packages
nix-shell +pkgs:
    #!/bin/sh
    echo -e "{{color_green}}Starting shell with {{pkgs}}{{color_normal}}"

    echo "{{pkgs}}" | grep " " 2>&1 >/dev/null
    if [ $? -eq 0 ]; then
        pkg_list=$(echo "{{pkgs}}" | sed -E 's/ /,/g')
        eval nix shell nixpkgs#{$pkg_list}
    else
        eval nix shell nixpkgs#{{pkgs}}
    fi
    exit 0
