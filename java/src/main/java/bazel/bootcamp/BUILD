load("@rules_java//java:java_binary.bzl", "java_binary")
load("@rules_java//java:java_library.bzl", "java_library")
load("@rules_java//java:java_test.bzl", "java_test")

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
        "@grpc_java//netty",
    ],
)

java_binary(
    name = "JavaLoggingClient",
    srcs = ["JavaLoggingClient.java"],
    visibility = ["//visibility:public"],
    deps = [":JavaLoggingClientLibrary"],
)

java_test(
    name = "JavaLoggingClientLibraryTest",
    srcs = ["JavaLoggingClientLibraryTest.java"],
    deps = [":JavaLoggingClientLibrary"],
)

java_test(
    name = "JavaLoggingClientTest",
    srcs = ["JavaLoggingClientTest.java"],
    deps = [":JavaLoggingClient"],
)
