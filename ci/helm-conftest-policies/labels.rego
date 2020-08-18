package main

import data.kubernetes

name = input.metadata.name

required_labels {
    input.metadata.labels["app.kubernetes.io/name"]
    input.metadata.labels["helm.sh/chart"]
    input.metadata.labels["app.kubernetes.io/instance"]
    input.metadata.labels["app.kubernetes.io/version"]
    input.metadata.labels["app.kubernetes.io/managed-by"]
}

required_deployment_selector_labels {
    input.spec.selector.matchLabels["app.kubernetes.io/name"]
    input.spec.selector.matchLabels["app.kubernetes.io/instance"]
}

required_deployment_pod_labels {
    input.spec.template.metadata.labels["app.kubernetes.io/name"]
    input.spec.template.metadata.labels["app.kubernetes.io/instance"]
}

deny[msg] {
    kubernetes.is_deployment
    not required_deployment_pod_labels
    msg = sprintf("%s deployment pod labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_deployment
    not required_deployment_selector_labels
    msg = sprintf("%s deployment selector labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_deployment
    not required_labels
    msg = sprintf("%s deployment must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_service
    not required_labels
    msg = sprintf("%s service must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [input.metadata.name])
}
