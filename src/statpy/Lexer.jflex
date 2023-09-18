// ------------  Paquete e importaciones ------------
package statpy; 

import java_cup.runtime.*;

%%	
//-------> Directivas (No tocar)

%public 
%class Lexer
%cup
%char
%column
%line
%unicode
%ignorecase

%{ 
%} 

// ------> Expresiones Regulares 

entero = [0-9]+
caracter = [A-Za-z0-9\s]+
salto = [\n]+

// -------> Palabras reservadas

pr_console = "Console.Write"
pr_int = "int"
pr_double = "double"
pr_char = "char"
pr_bool = "bool"
pr_string = "string"
pr_main = "void main()"
pr_if = "if"
pr_switch = "switch"
pr_case = "case"
pr_brake = "brake"
pr_default = "default"
pr_for = "for"
pr_while = "while"
pr_do = "do"

%%
// ------------  Reglas Lexicas -------------------

"("                 { return new Symbol(sym.PARENTESIS_ABIERTO, yycolumn, yyline, yytext()); }
")"                 { return new Symbol(sym.PARENTESIS_CERRADO, yycolumn, yyline, yytext()); }
"\""                { return new Symbol(sym.COMILLAS, yycolumn, yyline, yytext()); }
";"                 { return new Symbol(sym.PUNTO_COMA, yycolumn, yyline, yytext()); }
"//"                { return new Symbol(sym.DOBLE_BARRA, yycolumn, yyline, yytext()); }

"+"                 { return new Symbol(sym.SUMA, yycolumn, yyline, yytext()); }
"-"                 { return new Symbol(sym.RESTA, yycolumn, yyline, yytext()); }
"*"                 { return new Symbol(sym.MULTIPLICACION, yycolumn, yyline, yytext()); }
"/"                 { return new Symbol(sym.DIVISION, yycolumn, yyline, yytext()); }

">"                 { return new Symbol(sym.MAYOR, yycolumn, yyline, yytext()); }
"<"                 { return new Symbol(sym.MENOR, yycolumn, yyline, yytext()); }
"=="                { return new Symbol(sym.IGUAL, yycolumn, yyline, yytext()); }
"<="                { return new Symbol(sym.MENOR_IGUAL, yycolumn, yyline, yytext()); }
">="                { return new Symbol(sym.MAYOR_IGUAL, yycolumn, yyline, yytext()); }
"!="                { return new Symbol(sym.DIFERENTE, yycolumn, yyline, yytext()); }

"&&"                { return new Symbol(sym.AND, yycolumn, yyline, yytext()); }
"||"                { return new Symbol(sym.OR, yycolumn, yyline, yytext()); }
"!"                 { return new Symbol(sym.NOT, yycolumn, yyline, yytext()); }

{caracter}          { return new Symbol(sym.CARACTER, yycolumn, yyline, yytext()); }
{entero}            { return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); }
{salto}             { return new Symbol(sym.SALTO, yycolumn, yyline, yytext()); }

{pr_console}        { return new Symbol(sym.PR_CONSOLE, yycolumn, yyline, yytext()); }
{pr_int}            { return new Symbol(sym.PR_INT, yycolumn, yyline, yytext()); }
{pr_double}         { return new Symbol(sym.PR_DOUBLE, yycolumn, yyline, yytext()); }
{pr_char}           { return new Symbol(sym.PR_CHAR, yycolumn, yyline, yytext()); }
{pr_bool}           { return new Symbol(sym.PR_BOOL, yycolumn, yyline, yytext()); }
{pr_string}         { return new Symbol(sym.PR_STRING, yycolumn, yyline, yytext()); }
{pr_main}           { return new Symbol(sym.PR_MAIN, yycolumn, yyline, yytext()); }
{pr_if}             { return new Symbol(sym.PR_IF, yycolumn, yyline, yytext()); }
{pr_switch}         { return new Symbol(sym.PR_SWITCH, yycolumn, yyline, yytext()); }
{pr_case}           { return new Symbol(sym.PR_CASE, yycolumn, yyline, yytext()); }
{pr_brake}          { return new Symbol(sym.PR_BRAKE, yycolumn, yyline, yytext()); }
{pr_default}        { return new Symbol(sym.PR_DEFAULT, yycolumn, yyline, yytext()); }
{pr_for}            { return new Symbol(sym.PR_FOR, yycolumn, yyline, yytext()); }
{pr_while}          { return new Symbol(sym.PR_WHILE, yycolumn, yyline, yytext()); }
{pr_do}             { return new Symbol(sym.PR_DO, yycolumn, yyline, yytext()); }

//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }
