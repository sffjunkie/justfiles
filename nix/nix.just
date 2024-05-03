# Enter a nix shell with the specified packages
nix-shell +pkgs:
    #!/bin/sh
    pkg_list=$(echo "{{pkgs}}" | sed -E 's/ /,/g')
    echo "Starting shell with {{pkgs}}"
    eval nix shell nixpkgs#{$pkg_list}
    exit 0
