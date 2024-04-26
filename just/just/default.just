init-just:
    #!/bin/sh
    if [ -d ./just ]; then
        echo "Justfiles already initialised"
    else
        mkdir ./just
        tmp_dir=$(mktemp -d)
        git clone https://github.com/sffjunkie/just $tmp_dir
        cp -r $tmp_dir/just-*/* ./just
        rm -r $tmp_dir
    fi

update-just:
    cd ./just
    git pull
    cd ..
