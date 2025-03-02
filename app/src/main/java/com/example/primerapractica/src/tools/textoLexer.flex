package com.example.primerapractica.src.tools;
import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.Symbol;
%%

%{

%}

%cup
%public
%class AnalizadorLexicoTexto
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
TEXT        = [^\r\n]+

%%

<YYINITIAL> {
        // Ignorar espacios
        {ESPACIO}                     { /* Ignorar */ }
        {TEXT}                        { return new Symbol(sym.TEXT, yytext()); }
        {ENTERO}                      { return new Symbol(sym.ENTERO, yyline, yycolumn, yytext()); }
        {DECIMAL}                     { return new Symbol(sym.PARRAFO, yyline, yycolumn, yytext()); }
        "###### "                      { return new Symbol(sym.HEADER6, yyline, yycolumn, yytext()); }
        "##### "                       { return new Symbol(sym.HEADER5, yyline, yycolumn, yytext()); }
        "#### "                        { return new Symbol(sym.HEADER4, yyline, yycolumn, yytext()); }
        "### "                         { return new Symbol(sym.HEADER3, yyline, yycolumn, yytext()); }
        "## "                          { return new Symbol(sym.HEADER2, yyline, yycolumn, yytext()); }
        "# "                           { return new Symbol(sym.HEADER1, yyline, yycolumn, yytext()); }
        "***"                         { return new Symbol(sym.NEGRITAITALICA, yyline, yycolumn, yytext()); }
        "**"                          { return new Symbol(sym.NEGRITA, yyline, yycolumn, yytext()); }
        "*"                           { return new Symbol(sym.ITALICA, yyline, yycolumn, yytext()); }
        "+"                           { return new Symbol(sym.LISTA, yyline, yycolumn, yytext()); }
        "."                           { return new Symbol(sym.PUNTO, yyline, yycolumn, yytext()); }
        .                             { return new Symbol(sym.PARRAFO, yyline, yycolumn, yytext()); }
}