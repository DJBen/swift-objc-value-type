load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

def swift_objc_wrapper_library(
    name,
    srcs,
    prefix = "",
    exclude_types = [],
    imports = [],
    **kwargs
):
    generated_srcs = []
    for src in srcs:
        generated_src = src.replace(".swift", "Wrapper.swift")
        generated_srcs.append(generated_src)

        updated_imports = imports + ["Foundation"] if "Foundation" not in imports else imports
        imports_str = " ".join(updated_imports)
        exclude_types_str = " ".join(exclude_types)

        native.genrule(
            name = src.replace(".swift", "_objc_wrapper"),
            srcs = [src],
            outs = [generated_src],
            cmd = "./$(location @swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable) gen $(SRCS) --output-dir $(RULEDIR)" +
                  # " --struct-configs '$(struct_configs)'" +
                  # " --exclude-structs %s" % exclude_types_str +
                  " --imports %s" % imports_str +
                  " --prefix '%s'" % prefix,
            tools = ["@swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable"],
        )

    swift_library(
        name = name,
        srcs = srcs + generated_srcs,
        **kwargs
    )

def swift_objc_wrapper_library_from_remodel(
    name,
    srcs,
    prefix = "",
    imports = [],
    **kwargs
):
    migrated_srcs = []
    generated_srcs = []
    for src in srcs:
        migrated_src = src.replace(".value", ".swift").replace(".adtValue", ".swift").replace(".adtvalue", ".swift")
        migrated_srcs.append(migrated_src)

        generated_src = migrated_src.replace(".swift", "Wrapper.swift")
        generated_srcs.append(generated_src)

    updated_imports = imports + ["Foundation"] if "Foundation" not in imports else imports
    imports_str = " ".join(updated_imports)

    native.genrule(
        name = name + "_migrate_remodel",
        srcs = srcs,
        outs = migrated_srcs,
        cmd = "./$(location @swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable) migrate-remodel $(SRCS) --output-dir $(RULEDIR)" +
            " --imports %s" % imports_str +
            " --existing-prefix \"%s\"" % prefix + " -v",
        tools = ["@swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable"],
    )

    native.genrule(
        name = name + "_objc_wrapper",
        srcs = [":" + name + "_migrate_remodel"],
        outs = generated_srcs,
        cmd = "./$(location @swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable) gen $(SRCS) --output-dir $(RULEDIR)" +
                " --imports %s" % imports_str +
                " --prefix \"%s\"" % prefix + " -v",
        tools = ["@swift_objc_value_type//Sources/SwiftObjcValueTypeExecutable"],
    )

    swift_library(
        name = name,
        srcs = migrated_srcs + generated_srcs,
        **kwargs
    )
