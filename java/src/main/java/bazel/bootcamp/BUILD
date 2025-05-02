# deps you may need for various targets
#    "@io_grpc_grpc_java//core",
#    "@io_grpc_grpc_java//netty",
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
