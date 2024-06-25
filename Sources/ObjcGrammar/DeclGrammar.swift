import Covfefe

@GrammarBuilder
func declProductions() -> [Production] {
    "ns_assume_nonnull_scope" -%-%> t("NS_ASSUME_NONNULL_BEGIN") <+>
        n("protocol_decl") <+>
        t("NS_ASSUME_NONNULL_END")
    
    "protocol_forward_decl" -%-%> n("comments") <+> t("@protocol") <+> n("identifier") <+> t(";")
    
    "class_forward_decl" -%-%> n("comments") <+> t("@class") <+> n("identifier") <+> t(";")

    "protocol_decl" -%-%> n("comments") <+> t("@protocol") <+> n("identifier") <+> n("bracketed_protocol_conformance_list") <+> n("protocol_member_list") <+> t("@end")
    
    "interface_decl" -%-%> n("comments") <+> t("@interface") <+> n("identifier") <+> t(":") <+> n("interface_inheritance_list") <+> n("opt_bracketed_protocol_conformance_list") <+> n("protocol_member_list") <+> t("@end")
    
    "interface_inheritance_list" -%-%> n("identifier") <+> t(",") <+> n("interface_inheritance_list") <+> t()

    "opt_bracketed_protocol_conformance_list" -%-%> n("bracketed_protocol_conformance_list") <|> t()

    "bracketed_protocol_conformance_list" -%-%> t("<") <+> n("protocol_conformance_list") <+> t(">")

    "protocol_conformance_list" -%-%> n("identifier") <|> n("protocol_conformance_list") <+> t(",") <+> n("identifier")

    "protocol_member_list" -%-%> n("method_decl") <|>
        n("protocol_member_list") <+> n("method_decl") <|>
        n("protocol_member_list") <+> n("property_decl") <|>
        t()

    // @property (nonatomic, strong, readonly, nonnull) Foo *bar;
    "property_decl" -%-%> n("comments") <+> t("@property") <+> n("opt_paren_property_attr") <+> n("param_type") <+> n("identifier") <+> t(";") <+> n("comments")

    "opt_paren_property_attr" -%-%> t("(") <+> n("property_attr_list") <+> t(")") <|> t()

    "property_attr_list" --> n("property_attr") <|>
    (
        n("property_attr_list") <+>
        t(",") <+>
        n("property_attr")
    )

    // atomic/nonatomic
    // strong/weak/assign/copy
    // readwrite/readonly
    // nullable/nonnull
    "property_attr" -%-%> t("atomic") <|> t("nonatomic") <|> t("strong") <|> t("weak") <|> t("assign") <|> t("copy") <|> t("readwrite") <|> t("readonly") <|> t("nullable") <|> t("nonnull")

    "method_decl" -%-%> n("comments") <+> n("method_type_notation") <+> n("paren_param_type") <+> n("method_params") <+> t(";") <+> n("comments")

    "method_params" --> n("identifier") <|> // a signature without argument
    n("method_param") <|>
    n("method_params") <+> ws <+> n("method_param")

    "method_param" --> n("identifier") <+> t(":") <+> n("paren_param_type") <+> n("identifier")

    "paren_param_type" --> t("(") <+> n("nullability_qualified_param_type") <+> t(")")

    "method_type_notation" -%-%> t("-") <|> t("+")
}
