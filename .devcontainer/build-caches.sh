#!/bin/bash

# generate java BUILD file
cat > java/src/main/java/bazel/bootcamp/BUILD <<EOF
java_binary(
    name = "HelloBazelBootcamp",
    srcs = ["HelloBazelBootcamp.java"],
)

java_library(
    name = "JavaLoggingClientLibrary",
    srcs = ["JavaLoggingClientLibrary.java"],
    deps = [
        "//proto/logger:logger_java_proto",
        "//proto/logger:logger_java_grpc",
        "@io_grpc_grpc_java//core",
        "@io_grpc_grpc_java//netty",
    ]
)

java_binary(
    name = "JavaLoggingClient",
    srcs = ["JavaLoggingClient.java"],
    deps = [":JavaLoggingClientLibrary"],
    visibility = ["//visibility:public"]
)

java_test(
    name = "JavaLoggingClientLibraryTest",
    srcs = ["JavaLoggingClientLibraryTest.java"],
    deps = [":JavaLoggingClientLibrary"]
)

java_test(
    name = "JavaLoggingClientTest",
    srcs = ["JavaLoggingClientTest.java"],
    deps = [":JavaLoggingClient"]
)
EOF


# generate proto BUILD file
cat > proto/logger/BUILD <<EOF

package(default_visibility = ["//visibility:public"])

load("@io_grpc_grpc_java//:java_grpc_library.bzl", "java_grpc_library")

proto_library(
    name = "logger_proto",
    srcs = ["logger.proto"]
)

java_proto_library(
    name = "logger_java_proto",
    deps = [":logger_proto"]
)

java_grpc_library(
    name = "logger_java_grpc",
    srcs = [":logger_proto"],
    deps = [":logger_java_proto"],
)
EOF

bazel run //:gazelle
bazel build //...
git reset --hard
git clean -f
