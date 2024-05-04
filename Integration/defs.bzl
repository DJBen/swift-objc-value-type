load("@rules_swift//swift:swift.bzl", "swift_library")

def swift_objc_wrapper_library(
    name,
    srcs,
    struct_configs = None,
    exclude_structs = [],
    imports = [],
    **kwargs
):
    generated_srcs = []
    for src in srcs:
        generated_src = src.replace(".swift", "Wrapper.swift")
        generated_srcs.append(generated_src)

        exclude_structs_json = json.encode(exclude_structs)
        imports_json = json.encode(imports)

        native.genrule(
            name = src.replace(".swift", "_objc_wrapper"),
            srcs = [src],
            outs = [generated_src],
            cmd = "./$(location @swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable) gen $(SRCS) --output-dir $(@D)" +
                  # " --struct-configs '$(struct_configs)'" +
                  " --exclude-structs '%s'" % exclude_structs_json +
                  " --imports '%s'" % imports_json,
            tools = ["@swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable"],
        )

    swift_library(
        name = name,
        srcs = srcs + generated_srcs,
        **kwargs
    )