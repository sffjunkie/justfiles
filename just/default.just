init-just:
    #!/bin/sh
    if [ -d ./just ]; then
        echo "Justfiles already initialised"
    else
        git clone https://github.com/sffjunkie/just ./just
    fi

update-just:
    cd ./just
    git pull
    cd ..
