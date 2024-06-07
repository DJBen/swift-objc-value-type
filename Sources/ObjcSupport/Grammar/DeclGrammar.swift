import Covfefe

@GrammarBuilder
func declProductions() -> [Production] {


    "method_decl_list" -%-%> n("method_decl") <|>
        n("method_decl_list") <+> n("method_decl") <|>
        t()

    "method_decl" -%-%> n("comments") <+> n("method_type_notation") <+> n("bracketed_param_type") <+> n("method_params") <+> t(";") <+> n("comments")

    "method_params" --> n("identifier") <|> // a signature without argument
    n("method_param") <|>
    n("method_params") <+> ws <+> n("method_param")

    "method_param" --> n("identifier") <+> t(":") <+> n("bracketed_param_type") <+> n("identifier")

    "bracketed_param_type" --> t("(") <+> n("nullability_qualified_param_type") <+> t(")")

    "method_type_notation" -%-%> t("-") <|> t("+")
}
