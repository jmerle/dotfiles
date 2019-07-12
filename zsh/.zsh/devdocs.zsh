_dd_branch_name_or () {
    local branch_name=$1

    if [[ $# < 1 ]]; then
        branch_name=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
    fi

    echo $branch_name
}

ddbuild () {
    local tag=$(_dd_branch_name_or $1)

    local dockerfile="${HOME}/.dockerfiles/devdocs-deploy.Dockerfile"
    local image="jmerle/devdocs:$tag"

    echo "$ docker build -f \"$dockerfile\" -t \"$image\""
    docker build -f "$dockerfile" -t "$image" .
}

ddpush () {
    local tag=$(_dd_branch_name_or $1)

    local image="jmerle/devdocs:$tag"

    echo "$ docker push \"$image\""
    docker push "jmerle/devdocs:$tag"
}

ddup () {
    local subdomain=$(_dd_branch_name_or $1)
    local tag=$(_dd_branch_name_or $2)

    local container="devdocs-$subdomain"
    local image="jmerle/devdocs:$tag"

    ssh jasper@51.68.121.142 /bin/bash << EOF
    echo "$ docker pull $image"
    docker pull $image
    echo "$ docker rm -f $container"
    docker rm -f $container
    echo "$ docker run -d --name=$container --network=web -l traefik.frontend.rule=Host:$subdomain.devdocs.jmerle.dev $image"
    docker run -d --name=$container --network=web -l traefik.frontend.rule=Host:$subdomain.devdocs.jmerle.dev $image
EOF
}

dddown () {
    local subdomain=$(_dd_branch_name_or $1)

    local container="devdocs-$subdomain"

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
    ddbuild $2 && ddpush $2 && ddup $1 $2
}
