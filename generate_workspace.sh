# This file is used for Bazel CI to write the WORKSPACE file for the project.

# You can use it to see the final solutions but note that it will delete your existing
# WORKSPACE files if you started working.

# write WORKSPACE file
cat > WORKSPACE <<EOF
# gazelle:repository_macro go_deps.bzl%go_deps
workspace(name = "bootcamp")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
    ],
    sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
)

http_archive(
    name = "rules_pkg",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.8.0/rules_pkg-0.8.0.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.8.0/rules_pkg-0.8.0.tar.gz",
    ],
    sha256 = "eea0f59c28a9241156a47d7a8e32db9122f3d50b505fae0f33de6ce4d9b61834",
)
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()

http_archive(
    name = "zlib",
    build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
    sha256 = "d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98",
    strip_prefix = "zlib-1.2.13",
    urls = [
        "https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.xz",
        "https://zlib.net/zlib-1.2.13.tar.xz",
    ],
)

# grpc dependencies
http_archive(
    name = "io_grpc_grpc_java",
    urls = [
        "https://github.com/grpc/grpc-java/archive/v1.50.2.tar.gz",
    ],
    sha256 = "992f757b022bb40d2db07a4924f169c0abacbbddcae8f32edb99921683fdffe9",
    strip_prefix = "grpc-java-1.50.2",
)

RULES_JVM_EXTERNAL_TAG = "4.5"
RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

# go dependenciesload("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "099a9fb96a376ccbbb7d291ed4ecbdfd42f6bc822ab77ae6f1b5cb9e914e94fa",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "448e37e0dbf61d6fa8f00aaa12d191745e14f07c31cabfa731f0c8e8a4f41b97",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")
load("//:go_deps.bzl", "go_deps")

go_deps()

go_rules_dependencies()

go_register_toolchains(version = "1.19.3")

gazelle_dependencies()

http_archive(
    name = "com_google_protobuf",
    sha256 = "0aa7df8289c957a4c54cbe694fbabe99b180e64ca0f8fdb5e2f76dcf56ff2422",
    strip_prefix = "protobuf-21.9",
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/v21.9.tar.gz",
    ],
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories", "IO_GRPC_GRPC_JAVA_ARTIFACTS")
grpc_java_repositories()

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = IO_GRPC_GRPC_JAVA_ARTIFACTS,
    generate_compat_repositories = True,
    repositories = ["https://repo1.maven.org/maven2"],
)

load("@maven//:compat.bzl", "compat_repositories")
compat_repositories()
EOF
