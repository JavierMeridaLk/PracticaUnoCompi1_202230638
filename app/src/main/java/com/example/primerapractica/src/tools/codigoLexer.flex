package com.example.primerapractica.src.tools;
import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.Symbol;
%%

%{

%}

%cup
%public
%class AnalizadorLexicoCodigo
%unicode
%line
%column
%standalone

%{

%}

/* Definición de patrones */
ENTERO = [0-9]+
DECIMAL = [0-9]+\.[0-9]+
ESPACIO = [ \r\t\n]+
IDENTIFICADOR = [a-zA-Z]([a-zA-Z0-9_]*)
LISTA = {ENTERO}\.


%%

<YYINITIAL> {
        // Ignorar espacios
        {ESPACIO}                     { /* Ignorar */ }
        "print"                       { return new Symbol(sym.PRINT, yyline, yycolumn, yytext()); }
        "format"                      { return new Symbol(sym.FORMAT, yyline, yycolumn, yytext()); }
        "plot"                        { return new Symbol(sym.PLOT, yyline, yycolumn, yytext()); }
        {ENTERO}                      { return new Symbol(sym.ENTERO, yyline, yycolumn, yytext()); }
        {DECIMAL}                     { return new Symbol(sym.DECIMAL, yyline, yycolumn, yytext()); }
        {IDENTIFICADOR}               { return new Symbol(sym.IDENTIFICADOR, yyline, yycolumn, yytext()); }
        "*"                           { return new Symbol(sym.MULTIPLICACION, yyline, yycolumn, yytext()); }
        "+"                           { return new Symbol(sym.SUMA, yyline, yycolumn, yytext()); }
        "-"                           { return new Symbol(sym.RESTA, yyline, yycolumn, yytext()); }
        "/"                           { return new Symbol(sym.DIVISION, yyline, yycolumn, yytext()); }
        "^"                           { return new Symbol(sym.POTENCIA, yyline, yycolumn, yytext()); }
        "("                           { return new Symbol(sym.PARENTESIS_ABIERTO, yyline, yycolumn, yytext()); }
        ")"                           { return new Symbol(sym.PARENTESIS_CERRADO, yyline, yycolumn, yytext()); }
        "\""                          { return new Symbol(sym.COMILLAS, yyline, yycolumn, yytext()); }
        "reportes.operadores"         { return new Symbol(sym.REPORTE_OPERADORES, yyline, yycolumn, yytext()); }
        "reportes.errores"            { return new Symbol(sym.REPORTE_ERRORES, yyline, yycolumn, yytext()); }
        .                             { return new Symbol(sym.ERROR, yyline, yycolumn, yytext()); }
}