# Enter a nix shell with the specified packages
nix-shell +pkgs:
    #!/bin/sh
    echo "Starting shell with {{pkgs}}"

    echo "{{pkgs}}" | grep " "
    if [ $? -eq 0 ]
        pkg_list=$(echo "{{pkgs}}" | sed -E 's/ /,/g')
        eval nix shell nixpkgs#{$pkg_list}
    else
        eval nix shell nixpkgs#{{pkgs}}
    fi
    exit 0
