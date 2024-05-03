# Update the just files from the repository
just-update:
    git -C ./just pull

# Switch to the 'main' branch
just-main:
    #!/bin/sh
    cd just
    git checkout main
    git pull
    cd ..

# Switch to the 'develop' branch
just-develop:
    #!/bin/sh
    cd just
    git checkout develop
    git pull
    cd ..
