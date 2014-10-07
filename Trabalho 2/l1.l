DIGITO				[0-9]
LETRA				[a-zA-Z]

IDENTIFIER			{LETRA}({LETRA}|{DIGITO}|"_")*
INTEGER_LITERAL		{DIGITO}+

WHITESPACE (([\t\n\r])|" ")

Identifier IDENTIFIER

AbreChaves			"{"
FechaChaves			"}"
AbreParenteses		"("
FechaParenteses		")"
AbreConchete		"["
FechaConchete		"]"
Virgula				","
PontoVirgura		";"
Ponto 				"."

ClassDeclaration	"class"
return				"return"	
public				"public"
new					"new"
this				"this"
true				"true"
false				"false"

Type				(("int"("[""]")?|"boolean")

MainClass			{"class"}{Identifier}{"{"}{"public"}{"static"}{"void"}{"main"}{"("}{"String"}{"["}{"]"}{Identifier}{")"}{"{"}
ClassDeclaration	{"class"}{Identifier}({"extends"}{Identifier})?{"{"}({VarDeclaration})*
VarDeclaration		{Type}{Identifier}{";"}


ComandoIf			"if"
ComandoWhile		"while"
ComandoPrintln		"System.out.println" 				

Operadores			("&&"|"<"|"+"|"-"|"*"|)
Length 				"length"
Exclamacao			"!"


%%
{Expression}							{printf("Tipo: %s\n",yytext);}
{WHITESPACE}+					{}
{DIGITO}+						{printf("Numero: %s\n",yytext);}
{IDENTIFIER}					{printf("Identifier: %s\n",yytext);}

%%
int yywrap();

main(){
  yylex();
}

int yywrap(){
 return 1;
}
