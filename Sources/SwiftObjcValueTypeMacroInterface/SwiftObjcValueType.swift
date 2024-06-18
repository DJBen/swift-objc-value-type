@attached(peer, names: suffixed(Objc))
@attached(extension, names: named(init))
public macro ObjcValueWrapper(
    nsCoding: Bool = false,
    nsCopying: Bool = false,
    objcBuilder: Bool = false
) = #externalMacro(
    module: "SwiftObjcValueTypeMacro",
    type: "SwiftObjcValueTypeMacro"
)
