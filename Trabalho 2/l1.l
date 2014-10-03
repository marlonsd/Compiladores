DIGITO			[0-9]
LETRA			[a-zA-Z]

IDENTIFIER		{LETRA}({LETRA}|{DIGITO}|"_")*
INTEGER_LITERAL	{DIGITO}+

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
