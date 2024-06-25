# Semantic meaning
- "opt_" prefixed rules are resolved to Optional type. The rule must have `<|> t()` as its *last* production (aside from the whitespace production).
- "_list" suffixed rules are resolved to an Array. The rule must have `<|> t()` as its *last* production (aside from the whitespace production). The raw syntax tree represents the list as tail recursions. 