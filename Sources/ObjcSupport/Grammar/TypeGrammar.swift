import Covfefe

@GrammarBuilder
func typeProductions() -> [Production] {
    "typedef_block_var" -%-%> t("typedef") <+> ws <+> n("block_var_type") <+> t(";")
    
    "typedef_ns_enum" -%-%> n("comments") <+> t("typedef") <+> ws <+> t("NS_ENUM") <+> t("(") <+> n("ns_enum_def_params") <+> t(")") <+> n("ns_enum_case_scope") <+> t(";")

    // NSUInteger, NSEnumType
    "ns_enum_def_params" -%-%> n("identifier") <+> t(",") <+> n("identifier")

    "ns_enum_case_scope" -%-%> t("{") <+> n("ns_enum_case_list") <+> n("opt_comma") <+> t("}")

    "ns_enum_case_list" -%-%> n("ns_enum_case") <|>
        n("ns_enum_case_list") <+> t(",") <+> n("ns_enum_case")

    "ns_enum_case" -%-%> n("comments") <+> n("identifier") <+> t("=") <+> n("integer") <|>
        n("comments") <+> n("identifier")

    "typedef_ns_option" -%-%> n("comments") <+> t("typedef") <+> ws <+> t("NS_OPTIONS") <+> t("(") <+> n("ns_option_def_params") <+> t(")") <+> n("ns_option_case_scope") <+> t(";")

    // NSUInteger, NSOptionType
    "ns_option_def_params" -%-%> n("identifier") <+> t(",") <+> n("identifier")

    "ns_option_case_scope" -%-%> t("{") <+> n("ns_option_case_list") <+> n("opt_comma") <+> t("}")

    "ns_option_case_list" -%-%> n("ns_option_case") <|>
        n("ns_option_case_list") <+> t(",") <+> n("ns_option_case")

    "ns_option_case" -%-%> n("comments") <+> n("identifier") <+> t("=") <+> n("integer") <|>
        n("comments") <+> n("identifier") <+> t("=") <+> n("integer") <+> t("<<") <+> n("integer") <|>
        n("comments") <+> n("identifier")

    "var_type" -%-%> n("primitive_type")
                 <|> n("protocol_type") <+> n("nullability_specifier")
                 <|> n("class_type") <+> (try! re("\\s*\\*\\s*")) <+> n("nullability_specifier")
                 <|> n("block_var_type") <+> n("nullability_specifier")
                 <|> n("var_pointer_type") <+> n("nullability_specifier")

    "nullability_qualified_param_type" -%-%> n("param_nullability_specifier") <+> n("param_type")

    "param_type" -%-%> n("primitive_type")
                 <|> n("class_type")
                 <|> n("protocol_type")
                 <|> n("block_param_type")
                 <|> n("param_pointer_type")
                 <|> t("instancetype")

    "primitive_type" --> t("int") <|> t("float") <|> t("double") <|> t("BOOL") <|> t("char") <|> t("void") <|> t("NSInteger") <|> t("NSUInteger") <|> t("CGFloat") <|> t("int32_t") <|> t("uint32_t") <|> t("int64_t") <|> t("uint64_t")

    "class_type" --> n("identifier") <|> (n("identifier") <+> n("generic_args"))

    "protocol_type" --> n("id_type") <|>
    (
        n("id_type") <+>
        t("<") <+>
        n("protocol_list") <+>
        t(">")
    )

    "protocol_list" --> n("identifier") <|>
    (
        n("protocol_list") <+>
        t(",") <+>
        n("identifier")
    )

    // returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};
    "block_var_type" --> n("var_type") <+> t("(^") <+> n("nullability_specifier") <+> n("identifier") <+> (try! re("\\)\\s*\\(")) <+> n("var_type_list") <+> t(")")

    // - (void)someMethodThatTakesABlock:(returnType (^nullability)(parameterTypes))blockName;
    "block_param_type" --> n("param_type") <+> t("(^") <+> n("nullability_specifier") <+> (try! re("\\)\\s*\\(")) <+> n("param_type_list") <+> t(")")

    "var_pointer_type" --> n("var_type") <+> t("*")
    "param_pointer_type" --> n("param_type") <+> t("*")

    // (var_type[,var_type]*)?
    "var_type_list" --> n("var_type")
                    <|> (n("var_type_list") <+> t(",") <+> n("var_type"))
                    <|> t()

    // (param_type[,param_type]*)?
    "param_type_list" --> n("param_type")
                    <|> (n("param_type_list") <+> t(",") <+> n("param_type"))
                    <|> t()

    "generic_args" --> t("<") <+> n("var_type_list") <+> t(">")

    "param_nullability_specifier" -%-%> t("nonnull") <|> t("nullable") <|> t()

    "nullability_specifier" -%-%> t("_Nonnull") <|> t("_Nullable") <|> t()

    "id_type" -%-%> t("id")

    "identifier" -%-%> (try! re("[_a-zA-Z][_a-zA-Z0-9]+"))
}
