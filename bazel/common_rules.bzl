load("@com_github_grpc_grpc//bazel:python_rules.bzl", "py_grpc_library", "py_proto_library")
load("@com_github_grpc_grpc_kotlin//:kt_jvm_grpc.bzl", "kt_jvm_grpc_library", "kt_jvm_proto_library")
load("@io_bazel_rules_kotlin//kotlin:jvm.bzl", "kt_jvm_binary")
load("@rules_proto//proto:defs.bzl", "proto_library")

def service_proto_export(name, srcs = None, proto_deps = None):
    srcs = srcs or []
    proto_deps = proto_deps or []

    proto_library(
        name = "{}_proto".format(name),
        srcs = srcs,
        deps = proto_deps,
    )

    native.java_proto_library(
        name = "{}_proto_java_lib".format(name),
        deps = ["{}_proto".format(name)],
    )

    kt_jvm_proto_library(
        name = "{}_proto_kt_lib".format(name),
        deps = ["{}_proto".format(name)],
    )

    kt_jvm_grpc_library(
        name = "{}_proto_kt_grpc_lib".format(name),
        srcs = ["{}_proto".format(name)],
        deps = ["{}_proto_java_lib".format(name)],
    )

    py_proto_library(
        name = "{}_py_proto_lib".format(name),
        deps = ["{}_proto".format(name)],
    )

    py_grpc_library(
        name = "{}_py_grpc_lib".format(name),
        srcs = ["{}_proto".format(name)],
        deps = ["{}_py_proto_lib".format(name)],
    )
