package main

deny[msg] {
    not ignored_charts_deprecations
    input.apiVersion == "v1"
    input.kind == "List"
    obj := input.items[_]
    msg := _deny with input as obj
}

deny[msg] {
    not ignored_charts_deprecations
    input.apiVersion != "v1"
    input.kind != "List"
    msg := _deny
}

# Based on https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.16.md

# All resources under apps/v1beta1 and apps/v1beta2 - use apps/v1 instead
_deny = msg {
    not ignored_charts_deprecations
    apis := ["apps/v1beta1", "apps/v1beta2"]
    input.apiVersion == apis[_]
    msg := sprintf("%s/%s: API %s has been deprecated, use apps/v1 instead.", [input.kind, input.metadata.name, input.apiVersion])
}

# daemonsets, deployments, replicasets resources under extensions/v1beta1 - use apps/v1 instead
_deny = msg {
    not ignored_charts_deprecations
    resources := ["DaemonSet", "Deployment", "ReplicaSet"]
    input.apiVersion == "extensions/v1beta1"
    input.kind == resources[_]
    msg := sprintf("%s/%s: API extensions/v1beta1 for %s has been deprecated, use apps/v1 instead.", [input.kind, input.metadata.name, input.kind])
}

# networkpolicies resources under extensions/v1beta1 - use networking.k8s.io/v1 instead
_deny = msg {
    not ignored_charts_deprecations
    input.apiVersion == "extensions/v1beta1"
    input.kind == "NetworkPolicy"
    msg := sprintf("%s/%s: API extensions/v1beta1 for NetworkPolicy has been deprecated, use networking.k8s.io/v1 instead.", [input.kind, input.metadata.name])
}

# podsecuritypolicies resources under extensions/v1beta1 - use policy/v1beta1 instead
_deny = msg {
    not ignored_charts_deprecations
    input.apiVersion == "extensions/v1beta1"
    input.kind == "PodSecurityPolicy"
    msg := sprintf("%s/%s: API extensions/v1beta1 for PodSecurityPolicy has been deprecated, use policy/v1beta1 instead.", [input.kind, input.metadata.name])
}

# PriorityClass resources will no longer be served from scheduling.k8s.io/v1beta1 and scheduling.k8s.io/v1alpha1 in v1.17.
_deny = msg {
    not ignored_charts_deprecations
    apis := ["scheduling.k8s.io/v1beta1", "scheduling.k8s.io/v1alpha1"]
    input.apiVersion == apis[_]
    input.kind == "PriorityClass"
    msg := sprintf("%s/%s: API %s for PriorityClass has been deprecated, use scheduling.k8s.io/v1 instead.", [input.kind, input.metadata.name, input.apiVersion])
}
