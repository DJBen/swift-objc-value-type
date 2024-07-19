import ArgumentParser

struct PrefixStrippingArguments: ParsableArguments {
    @Option(
        name: [.long],
        help: """
        An existing prefix to remove from the name of the type, if exists.
        Prefixing a type is standard pratice of Objective-C programming,
        but Swift naming convention advises againsts adding prefixes.
        """
    )
    var existingPrefix: String = ""
    
    @Option(
        name: [.long],
        help: """
        A list of type regex patterns that we exclude from stripping prefixes.
        """
    )
    var typePatternsExcludedFromPrefixStripping: [String] = []
}

