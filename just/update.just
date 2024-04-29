# Update the just files from the repository
update-just:
    git -C ./just pull

just-main:
    #!/bin/sh
    cd just
    git checkout main
    cd ..

just-develop:
    #!/bin/sh
    cd just
    git checkout develop
    cd ..
