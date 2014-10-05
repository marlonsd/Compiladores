DIGITO				[0-9]
LETRA				[a-zA-Z]

IDENTIFIER			{LETRA}({LETRA}|{DIGITO}|"_")*
INTEGER_LITERAL		{DIGITO}+

Identifier			{IDENTIFIER}

Goal				{MainClass}({ClassDeclaration})*<<EOF>>
MainClass			{"class"}{Identifier}{"{"}{"public"}{"static"}{"void"}{"main"}{"("}{"String"}{"["}{"]"}{Identifier}{")"}{"{"}{Statement}{"}"}{"}"}
ClassDeclaration	{"class"}{Identifier}({"extends"}{Identifier})?{"{"}({VarDeclaration})*({MethodDeclaration})*{"}"}
VarDeclaration		{Type}{Identifier}{";"}
MethodDeclaration	{"public"}{Type}{Identifier}{"("}({Type}{Identifier}({","}{Type}{Identifier})*)?{")"}{"{"}({VarDeclaration})*({Statement})*{"return"}{Expression}{";"}{"}"}
Type				{"int"}{"["}{"]"}|{"boolean"}|{"int"}|{Identifier}
Statement			{"{"}({Statement})*{"}"}|{"if"}{"("}{Expression}{")"}{Statement}{"else"}{Statement}|{"while"}{"("}{Expression}{")"}{Statement}|{"System.out.println"}{"("}{Expression}{")"}{";"}|{Identifier}{"="}{Expression}{";"}|{Identifier}{"["}{Expression}{"]"}{"="}{Expression}{";"}

Expression			{A}({B})*
B 					("&&"|"<"|"+"|"-"|"*"){Expression}({B})*
    |     "["{Expression}"]"({B})*
    |     ".""length"({B})*
    |     "."{Identifier}"("({Expression}(","{Expression})*)?")"({B})*
    
A ::=     INTEGER_LITERAL
    |     "true"
    |     "false"
    |     {Identifier}
    |     "this"
    |     "new" "int" "[" {Expression} "]"
    |     "new" {Identifier} "(" ")"
    |     "!" {Expression}
    |     "(" {Expression} ")"




%%
{INTEGER_LITERAL}				{printf("Inteiro: %s\n",yytext);}
{IDENTIFIER}					{printf("var: %s\n",yytext);}

%%
int yywrap();

main(){
  yylex();
}

int yywrap(){
 return 1;
}
