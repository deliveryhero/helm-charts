package main

import data.kubernetes

name = input.metadata.name

containers = input.spec.template.spec.containers

deny[msg] {
    kubernetes.is_deployment
    not containers[i].resources.requests.memory = containers[i].resources.limits.memory

    msg = sprintf("Memory requests/limits different for deployment %s (%s %s/%s)", [
        name, containers[i].name,
        containers[i].resources.requests.memory, containers[i].resources.limits.memory,
    ])
}
