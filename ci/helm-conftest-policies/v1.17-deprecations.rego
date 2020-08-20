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

# PriorityClass resources will no longer be served from scheduling.k8s.io/v1beta1 and scheduling.k8s.io/v1alpha1 in v1.17.
_deny = msg {
  not ignored_charts_deprecations
  apis := ["scheduling.k8s.io/v1beta1", "scheduling.k8s.io/v1alpha1"]
  input.apiVersion == apis[_]
  input.kind == "PriorityClass"
  msg := sprintf("%s/%s: API %s for PriorityClass has been deprecated, use scheduling.k8s.io/v1 instead.", [input.kind, input.metadata.name, input.apiVersion])
}
