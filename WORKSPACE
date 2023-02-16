# gazelle:repository_macro go_deps.bzl%go_deps
workspace(name = "bootcamp")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
    ],
)

http_archive(
    name = "rules_pkg",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.8.1/rules_pkg-0.8.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.8.1/rules_pkg-0.8.1.tar.gz",
    ],
    sha256 = "8c20f74bca25d2d442b327ae26768c02cf3c99e93fad0381f32be9aab1967675",
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
        "https://github.com/grpc/grpc-java/archive/v1.53.0.tar.gz",
    ],
    sha256 = "fd0a649d03a8da06746814f414fb4d36c1b2f34af2aad4e19ae43f7c4bd6f15e",
    strip_prefix = "grpc-java-1.53.0",
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
    sha256 = "dd926a88a564a9246713a9c00b35315f54cbd46b31a26d5d8fb264c07045f05d",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
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

go_register_toolchains(version = "1.20.1")

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

# BEGIN: typescript dependencies
http_archive(
    name = "aspect_rules_js",
    sha256 = "6eaac9e07c6cac8d577fca0cd5362ca750ca5c60d20facac864ae358f39612a2",
    strip_prefix = "rules_js-1.6.7",
    url = "https://github.com/aspect-build/rules_js/archive/refs/tags/v1.6.7.tar.gz",
)

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")

rules_js_dependencies()

load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "nodejs",
    node_version = DEFAULT_NODE_VERSION,
)

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")

npm_translate_lock(
    name = "npm",
    pnpm_lock = "//typescript:pnpm-lock.yaml",
    verify_node_modules_ignored = "//:.bazelignore",
)

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()

http_archive(
    name = "aspect_rules_ts",
    sha256 = "1149d4cf7f210de67e0fc5cd3e8f624de3ee976ac05af4f1484e57a74c12f2dc",
    strip_prefix = "rules_ts-1.0.0-rc5",
    url = "https://github.com/aspect-build/rules_ts/archive/refs/tags/v1.0.0-rc5.tar.gz",
)

load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")

rules_ts_dependencies(ts_version_from = "//typescript:package.json")
# END: typescript dependencies
