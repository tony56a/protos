load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_java",
    sha256 = "f8ae9ed3887df02f40de9f4f7ac3873e6dd7a471f9cddf63952538b94b59aeb3",
    urls = [
        "https://github.com/bazelbuild/rules_java/releases/download/7.6.1/rules_java-7.6.1.tar.gz",
    ],
)

grpc_kotlin_version = "1.4.1"

http_archive(
    name = "com_github_grpc_grpc_kotlin",
    strip_prefix = "grpc-kotlin-%s" % grpc_kotlin_version,
    urls = ["https://github.com/grpc/grpc-kotlin/archive/refs/tags/v{}.tar.gz".format(grpc_kotlin_version)],
)

RULES_JVM_EXTERNAL_TAG = "4.5"

RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

http_archive(
    name = "rules_proto",
    sha256 = "e017528fd1c91c5a33f15493e3a398181a9e821a804eb7ff5acdd1d2d6c2b18d",
    strip_prefix = "rules_proto-4.0.0-3.20.0",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/refs/tags/4.0.0-3.20.0.tar.gz",
    ],
)

http_archive(
    name = "rules_proto_grpc",
    sha256 = "507e38c8d95c7efa4f3b1c0595a8e8f139c885cb41a76cab7e20e4e67ae87731",
    strip_prefix = "rules_proto_grpc-4.1.1",
    urls = ["https://github.com/rules-proto-grpc/rules_proto_grpc/archive/4.1.1.tar.gz"],
)

# We will be using 1.48.1 for grpc-java
http_archive(
    name = "io_grpc_grpc_java",
    sha256 = "88b12b2b4e0beb849eddde98d5373f2f932513229dbf9ec86cc8e4912fc75e79",
    strip_prefix = "grpc-java-1.48.1",
    urls = ["https://github.com/grpc/grpc-java/archive/v1.48.1.tar.gz"],
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_repos", "rules_proto_grpc_toolchains")

rules_proto_grpc_toolchains()

rules_proto_grpc_repos()

load("@io_grpc_grpc_java//:repositories.bzl", "IO_GRPC_GRPC_JAVA_ARTIFACTS", "IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS", "grpc_java_repositories")

IO_GRPC_GRPC_KOTLIN_ARTIFACTS = [
    "com.squareup:kotlinpoet:1.11.0",
    "org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.2",
    "org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.6.2",
    "org.jetbrains.kotlinx:kotlinx-coroutines-debug:1.6.2",
]

maven_install(
    artifacts = [
        "com.google.jimfs:jimfs:1.1",
        "com.google.truth.extensions:truth-proto-extension:1.0.1",
        "com.google.protobuf:protobuf-kotlin:3.18.0",
        "javax.annotation:javax.annotation-api:1.3.2",
    ] + IO_GRPC_GRPC_KOTLIN_ARTIFACTS + IO_GRPC_GRPC_JAVA_ARTIFACTS,
    generate_compat_repositories = True,
    override_targets = IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS,
    repositories = [
        "https://repo.maven.apache.org/maven2/",
    ],
)

load("@maven//:compat.bzl", "compat_repositories")

compat_repositories()

grpc_java_repositories()

# loading kotlin rules
# first to load grpc/grpc-kotlin
http_archive(
    name = "io_bazel_rules_kotlin",
    sha256 = "01293740a16e474669aba5b5a1fe3d368de5832442f164e4fbfc566815a8bc3a",
    urls = ["https://github.com/bazelbuild/rules_kotlin/releases/download/v1.8/rules_kotlin_release.tgz"],
)

load("@io_bazel_rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories")

kotlin_repositories()

load("@io_bazel_rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")

kt_register_toolchains()

load(
    "@com_github_grpc_grpc_kotlin//:repositories.bzl",
    "IO_GRPC_GRPC_KOTLIN_ARTIFACTS",
    "grpc_kt_repositories",
)

grpc_kt_repositories()

graknlabs_bazel_distribution_version = "ebb4660cff37574876d37bf7c498bd735155554f"

http_archive(
    name = "graknlabs_bazel_distribution",
    sha256 = "c3181786d2544a7df54bcf326d5e40e6ec0b86dbc6c42e58d40f8c2c2225859f",
    strip_prefix = "bazel-distribution-{}".format(graknlabs_bazel_distribution_version),
    type = "zip",
    url = "https://github.com/graknlabs/bazel-distribution/archive/{}.zip".format(graknlabs_bazel_distribution_version),
)