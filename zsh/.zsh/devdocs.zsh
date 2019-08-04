ddbuild () {
    local dockerfile="${HOME}/.dockerfiles/devdocs-deploy.Dockerfile"
    local image="jmerle/devdocs:$1"

    echo "$ docker build -f \"$dockerfile\" -t \"$image\""
    docker build -f "$dockerfile" -t "$image" .
}

ddpush () {
    echo "$ docker push \"$1\""
    docker push "jmerle/devdocs:$1"
}

ddup () {
    local domain="$1.devdocs.jmerle.dev"
    local container="devdocs-$1"
    local image="jmerle/devdocs:$1"

    ssh jasper@51.68.121.142 /bin/bash << EOF
    echo "$ docker pull $image"
    docker pull $image
    echo "$ docker rm -f $container"
    docker rm -f $container
    echo "$ docker run -d --name=$container --network=web -l traefik.frontend.rule=Host:$domain $image"
    docker run -d --name=$container --network=web -l traefik.frontend.rule=Host:$domain $image
EOF
}

dddown () {
    local container="devdocs-$1"

    ssh jasper@51.68.121.142 /bin/bash << EOF
    echo "$ docker rm -f $container"
    docker rm -f $container
EOF
}

ddlist () {
    ssh jasper@51.68.121.142 /bin/bash << EOF
    echo "$ docker ps -f name=devdocs --format 'table {{.Label \"traefik.frontend.rule\"}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}'"
    docker ps -f name=devdocs --format 'table {{.Label "traefik.frontend.rule"}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}'
EOF
}

dddeploy() {
    ddbuild $1 && ddpush $1 && ddup $1
}
