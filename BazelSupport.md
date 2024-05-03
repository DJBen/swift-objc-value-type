# Bazel support

`Package.swift` is the source of truth.

This project leverages [`rule_swift_package_manager`](https://github.com/cgrindel/rules_swift_package_manager) to automatically generate Bazel
build files from `Package.swift`. However it is imperfect.

1. Test-only modules cannot be identified, so we need to insert `testonly = True`
to make compile.
2. `swift_compiler_plugin` rules cannot be correctly generated, instead they are
mistakenly generated as `swift_library`.
 
The necessary fix to make compilation successful has been dumped to `bazel_fix.patch` 
file. In order to apply, run

```bash
git apply bazel_fix.patch
```
