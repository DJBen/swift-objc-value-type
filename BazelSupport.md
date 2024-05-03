# Bazel support

`Package.swift` is the source of truth.

This project leverages [`rule_swift_package_manager`](https://github.com/cgrindel/rules_swift_package_manager) to automatically generate Bazel
build files from `Package.swift`.

## Run with Bazel
```
bazel build //Sources/...
bazel test //Tests/...
```

## Update external dependencies
Whenever you change any external depednencies in `Package.swift`, you need to run the following to resolve them.

```bash
bazel run //:swift_update_pkgs
```

## Generate or update Bazel files
Generate/update the Bazel build files for your project by running the following:

```bash
bazel run //:update_build_files
```
This generation may not be perfect, and some following actions are needed in order to compile.

1. Test-only modules cannot be identified, so we need to insert `testonly = True`
to make compile.
1. `swift_compiler_plugin` rules cannot be correctly generated, instead they are
mistakenly generated as `swift_library`.

The necessary fix to make compilation successful has been dumped to `bazel_fix.patch`
file. In order to apply, run

```bash
git apply bazel_fix.patch
```

Note: if you see those error messages, you can safely ignore them:
```
gazelle: Unable to find dependency labels for Decl
gazelle: Unable to find dependency labels for WinSDK, s, the
gazelle: Unable to find dependency labels for ActionLib, FooServices, MediaModels
gazelle: Unable to find dependency labels for SwiftObjcValueTypeMacro
```