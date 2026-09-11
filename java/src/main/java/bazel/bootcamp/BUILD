load("@rules_java//java:java_binary.bzl", "java_binary")
load("@rules_java//java:java_library.bzl", "java_library")

# deps you may need for various targets
#    "@grpc_java//core",
#    "@grpc_java//netty",
#    "@junit_junit//jar" - optional

java_library(
    name = "JavaLoggingClientLibrary",
    srcs = ["JavaLoggingClientLibrary.java"],
    deps = [
        "//proto/logger:logger_java_grpc",
        "//proto/logger:logger_java_proto",
        "@grpc_java//core",
    ],
)

java_binary(
    name = "JavaLoggingClient",
    srcs = ["JavaLoggingClient.java"],
    visibility = ["//visibility:public"],
    runtime_deps = ["@grpc_java//netty"],
    deps = [":JavaLoggingClientLibrary"],
)
