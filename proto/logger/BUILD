load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

package(default_visibility = ["//visibility:public"])

# load("@io_grpc_grpc_java//:java_grpc_library.bzl", "java_grpc_library")
# load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
# load("@npm_bazel_typescript//:index.bzl", "ts_proto_library")

proto_library(
    name = "logger_proto",
    srcs = ["logger.proto"],
)

go_proto_library(
    name = "logger_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "bootcamp/proto/logger",
    proto = ":logger_proto",
)

go_library(
    name = "logger",
    embed = [":logger_go_proto"],
    importpath = "bootcamp/proto/logger",
)
