load("@rules_java//java:java_binary.bzl", "java_binary")
load("@rules_java//java:java_library.bzl", "java_library")

# deps you may need for various targets
#    "@grpc_java//core",
#    "@grpc_java//netty",
#    "@junit_junit//jar" - optional

java_library(
    name = "JavaLoggingClientLibrary",
    srcs = ["JavaLoggingClientLibrary.java"]
    deps = [
        "//proto/logger:logger_java_grpc",
    ],
)

java_binary(
    name = "JavaLoggingClient",
    srcs = ["JavaLoggingClient.java"],
    deps = [
        # Add the library from above
    ],
)
