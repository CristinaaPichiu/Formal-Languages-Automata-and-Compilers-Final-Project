%{
    #include <stdio.h>
    #include "y.tab.h"
%}
%option noyywrap

%%

"variabile_globale"              { return VARGLOBALE; }
"end_globale."                { return ENDGLOBALE; }
"functii"           { return STARTFUNCTIONS; }
"end_functii."             { return ENDFUNCTIONS; }
"clase"                  {return STCLASE;} 
"end_clase."              {return ENDCLASE;}
"main"             { return MAIN; }
"end."               { return END; }
"Eval"               { return EVAL;}
"TypeOf"             {return TYPEOF;}


"functie"                  { return FUNCTION; }
"const"                     { return CONST; }
"int"|"float"|"bool"        { yylval.str = strdup(yytext); return DATATYPE; }
"char"                      { yylval.str = strdup(yytext); return CHAR; }  
"string"                    { yylval.str = strdup(yytext); return STRING; }
"return"                    { return RETURN; }
"for"	                    { return FOR; }
"if"	                    { return IF; }
"while"                     { return WHILE; }
"else"	                    { return ELSE; }
"="                        { return ASSIGN; }

"TRUE"                      { yylval.boolnum = 1; return BOOL_VALUE; }             
"FALSE"                     { yylval.boolnum = 0; return BOOL_VALUE; }

"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
">"	                        { return GT; }
"<"	                        { return LT; }
"&&"	                    { return AND; }
"||"	                    { return OR; }
"+"                         { yylval.str = strdup(yytext); return PLUS; }
"-"                         { yylval.str = strdup(yytext); return MINUS; }
"/"                         { yylval.str = strdup(yytext); return DIV; }
"*"                         { yylval.str = strdup(yytext); return PROD; }
":"                        { return DOUBLE; }
"class"                   { return CLASS; }
"public"                   {return PUBLIC;}
"private"                   {return PRIVATE;}
"protected"                 {return PROTECTED;}

[-]?[0-9]+                                { yylval.intnum = atoi(yytext); return NR; }
[-]?[0-9]+\.[0-9]{1,6}                 { yylval.flnum = atof(yytext); return FLOAT_NUM; }
["].*["]                                    { yylval.str = strdup(yytext); return STR; }
['].[']                                     { yylval.str = yytext[1]; return CHARACTER; }
[a-zA-Z]([a-zA-Z]|[0-9])*                   { yylval.str = strdup(yytext); return ID; }
"++"|"--"                                   { yylval.str = strdup(yytext); return UNARY; }

\/\/.*                      { ; }
\/\*(.*\n)*.*\*\/           { ; } 
[ \t]                        ;
\n                          {yylineno++;}
.                           {return yytext[0];}
%%

