load("@grpc_java//:java_grpc_library.bzl", "java_grpc_library")
load("@protobuf//bazel:java_proto_library.bzl", "java_proto_library")
load("@protobuf//bazel:proto_library.bzl", "proto_library")
load("@rules_go//go:def.bzl", "go_library")
load("@rules_go//proto:def.bzl", "go_proto_library")

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "logger_proto",
    srcs = ["logger.proto"],
)

go_proto_library(
    name = "logger_go_proto",
    compilers = [
        "@rules_go//proto:go_proto",
        "@rules_go//proto:go_grpc_v2",
    ],
    importpath = "bootcamp/proto/logger",
    proto = ":logger_proto",
)

go_library(
    name = "logger",
    embed = [":logger_go_proto"],
    importpath = "bootcamp/proto/logger",
)

java_proto_library(
    name = "logger_java_proto",
    deps = [":logger_proto"],
)

java_grpc_library(
    name = "logger_java_grpc",
    srcs = [":logger_proto"],
    deps = [":logger_java_proto"],
)
