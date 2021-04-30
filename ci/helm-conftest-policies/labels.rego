package main

import data.kubernetes

name = input.metadata.name

required_labels {
    input.metadata.labels["helm.sh/chart"]
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
    kubernetes.is_secret
    not required_labels
    msg = sprintf("%s Secret labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_configmap
    not required_labels
    msg = sprintf("%s ConfigMap labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_clusterrole
    not required_labels
    msg = sprintf("%s ClusterRole labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_pdb
    not required_labels
    msg = sprintf("%s PodDisruptionBudget labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_serviceaccount
    not required_labels
    msg = sprintf("%s ServiceAccount labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_clusterrolebinding
    not required_labels
    msg = sprintf("%s ClusterRoleBinding labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_deployment
    not required_deployment_pod_labels
    msg = sprintf("%s Deployment pod labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_deployment
    not required_deployment_selector_labels
    msg = sprintf("%s Deployment selector labels must follow Helm standard", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_deployment
    not required_labels
    msg = sprintf("%s Deployment must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [input.metadata.name])
}

deny[msg] {
    kubernetes.is_service
    not required_labels
    msg = sprintf("%s Service must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [input.metadata.name])
}
