public struct ExternalHashSettings {
    public let libary: String?
    public let hashFunc: String
    public let hashFloatFunc: String?
    public let hashDoubleFunc: String?

    public init(libary: String? = nil, hashFunc: String, hashFloatFunc: String? = nil, hashDoubleFunc: String? = nil) {
        self.libary = libary
        self.hashFunc = hashFunc
        self.hashFloatFunc = hashFloatFunc
        self.hashDoubleFunc = hashDoubleFunc
    }
}
