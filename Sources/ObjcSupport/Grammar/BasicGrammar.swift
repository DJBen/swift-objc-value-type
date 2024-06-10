import Covfefe

@GrammarBuilder
func basicProductions() -> [Production] {
    "comments" --> n("any_comment") <|>
        n("comments") <+> n("any_comment") <|>
        t()
    "any_comment" --> n("line_comment") <|> n("block_comment")
    "line_comment" -%-%> t("//") <+> n("line_comment_body")
    "block_comment" -%-%> (try! re("/\\*(.|\\s)*?\\*\\/"))
    "line_comment_body" -%-%> (try! re("[^\\r\\n]+")) <|> t()

    "opt_comma" -%-%> t(",") <|> t()
    "integer" -%-%> (try! re("\\d+")) <|> t("-") <+> (try! re("\\d+"))
}
