# Update the just files from the repository
update-just:
    git -C ./just pull

# Switch to the 'main' branch
just-main:
    cd just
    git checkout main
    cd ..

# Switch to the 'develop' branch
just-develop:
    cd just
    git checkout develop
    cd ..
