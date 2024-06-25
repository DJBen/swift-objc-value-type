import Covfefe

@GrammarBuilder
func codeBlockProductions() -> [Production] {
    "code_block_list" --> n("code_block") <|> 
    n("code_block_list") <+> n("code_block") <|> 
    t()

    "code_block" --> n("import_stmt") <|> n("ns_assume_nonnull_scope") <|> n("protocol_decl") <|> n("interface_decl") <|> n("protocol_forward_decl") <|> n("class_forward_decl")

    "import_stmt" --> n("import_modular") <|> n("import_quoted") <|> n("import_slashed")

    "import_modular" -%-%> n("comments") <+> t("@import") <+> ws <+> n("identifier") <+> t(";") <+> n("comments")
    "import_quoted" -%-%> n("comments") <+> t("#import") <+> ws <+> t("<") <+> n("file_name") <+> t(">") <+> n("comments")
    "import_slashed" -%-%> n("comments") <+> t("#import") <+> ws <+> t("<") <+> n("module_name") <+> t("/") <+> n("file_name") <+> t(">") <+> n("comments")

    "module_name" --> (try! re("[\\w,\\s-]+"))
    "file_name" --> (try! re("[\\w,\\s-]+\\.[A-Za-z]{1,3}"))
}
