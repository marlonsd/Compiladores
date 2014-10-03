DIGITO			[0-9]
LETRA			[a-zA-Z]
SUBLINHADO		"_"
ID				{LETRA}({LETRA}|{DIGITO}|{SUBLINHADO})*
EXP				("e"|"E")("+"|"-")?{DIGITO}+


%%
{DIGITO}+						{printf("Inteiro: %s\n",yytext);}
{DIGITO}+"."{DIGITO}+			{printf("Real: %s\n",yytext);}
{SUBLINHADO}					{printf("Sublinhado\n");}
{ID}							{printf("var: %s\n",yytext);}
{DIGITO}+("."{DIGITO}+)?{EXP}?	{printf("numero: %s\n",yytext);}
%%
int yywrap();

main(){
  yylex();
}

int yywrap(){
 return 1;
}
