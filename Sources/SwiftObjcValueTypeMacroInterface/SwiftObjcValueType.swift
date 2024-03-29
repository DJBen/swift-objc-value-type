@attached(peer, names: suffixed(Wrapper))
public macro ObjcValueWrapper() = #externalMacro(
    module: "SwiftObjcValueTypeMacro",
    type: "SwiftObjcValueTypeMacro"
)
