DIGITO				[0-9]
LETRA				[a-zA-Z]

IDENTIFIER			{LETRA}({LETRA}|{DIGITO}|"_")*
INTEGER_LITERAL		{DIGITO}+

WHITESPACE [\t\n\r]

Identifier IDENTIFIER

Goal				{MainClass}({ClassDeclaration})*<<EOF>>
MainClass			{"class"}{Identifier}{"{"}{"public"}{"static"}{"void"}{"main"}{"("}{"String"}{"["}{"]"}{Identifier}{")"}{"{"}{Statement}{"}"}{"}"}
ClassDeclaration	{"class"}{Identifier}({"extends"}{Identifier})?{"{"}({VarDeclaration})*({MethodDeclaration})*{"}"}
VarDeclaration		{Type}{Identifier}{";"}
MethodDeclaration	{"public"}{Type}{Identifier}{"("}({Type}{Identifier}({","}{Type}{Identifier})*)?{")"}{"{"}({VarDeclaration})*({Statement})*{"return"}{Expression}{";"}{"}"}
Type				("int"{WHITESPACE}*"[""]"|"boolean"|"int"|{Identifier})
Statement			{"{"}({Statement})*{"}"})|({"if"}{"("}{Expression}{")"}{Statement}{"else"}{Statement})|({"while"}{"("}{Expression}{")"}{Statement})|({"System.out.println"}{"("}{Expression}{")"}{";"})|({Identifier}{"="}{Expression}{";"})|({Identifier}{"["}{Expression}{"]"}{"="}{Expression}{";"}

Expression			{OP}({OP1})*
OP1 				("&&")|("<")|("+")|("-")|("*"){Expression}({OP1})*)|("["{Expression}"]"({OP1})*)|(".""length"({OP1})*)|("."{Identifier}"("({Expression}(","{Expression})*)?")"({OP1})*    
OP 					(INTEGER_LITERAL)|("true")|("false")|({Identifier})|("this")|("new" "int" "[" {Expression} "]")|("new" {Identifier} "(" ")")|("!" {Expression})|("(" {Expression} ")"



%%
{Type}							{printf("Tipo: %s\n",yytext);}
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
