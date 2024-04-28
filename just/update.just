# Update the just files from the repository
update-just:
    git -C ./just pull

just-main:
    cd just
    git checkout main
    cd ..

just-develop:
    cd just
    git checkout develop
    cd ..
