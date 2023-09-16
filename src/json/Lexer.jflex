// ------------  Paquete e importaciones ------------
package json; 

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

decimal = [0-9]+(\.[0-9])?
caracter = [A-Za-z0-9\s]+


%%
// ------------  Reglas Lexicas -------------------

"{"     { return new Symbol(sym.ABRIR_LL, yycolumn, yyline, yytext()); }
"}"     { return new Symbol(sym.CERRAR_LL, yycolumn, yyline, yytext()); }
","     { return new Symbol(sym.COMA, yycolumn, yyline, yytext()); }
":"     { return new Symbol(sym.DOS_PUNTOS, yycolumn, yyline, yytext()); }
"."     { return new Symbol(sym.PUNTO, yycolumn, yyline, yytext()); }
"\""    { return new Symbol(sym.COMILLAS, yycolumn, yyline, yytext()); }
"\n"    { return new Symbol(sym.SALTO, yycolumn, yyline, yytext()); }

{decimal} { return new Symbol(sym.DECIMAL, yycolumn, yyline, yytext()); }
{caracter} { return new Symbol(sym.CARACTER, yycolumn, yyline, yytext()); }



//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }
