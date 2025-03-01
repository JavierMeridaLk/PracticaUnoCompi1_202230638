package com.example.primerapractica.src.tools;
import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.Symbol;
%%

%{
    private List<Token> tokensTexto = new ArrayList<>();
    private List<Token> tokensCodigo = new ArrayList<>();
    private List<Token> tokensError = new ArrayList<>();
%}

%cup
%public
%class AnalizadorLexico
%unicode
%line
%column
%standalone

%{
    public List<Token> getTokensTexto() {
        return tokensTexto;
    }

    public void setTokensTexto(List<Token> tokensTexto) {
        this.tokensTexto = tokensTexto;
    }

    public List<Token> getTokensCodigo() {
        return tokensCodigo;
    }

    public void setTokensCodigo(List<Token> tokensCodigo) {
        this.tokensCodigo = tokensCodigo;
    }

    public List<Token> getTokensError() {
        return tokensError;
    }

    public void setTokensError(List<Token> tokensError) {
        this.tokensError = tokensError;
    }
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
        "######"                      { return new Symbol(sym.HEADER6, yyline, yycolumn, yytext()); }
        "#####"                       { return new Symbol(sym.HEADER5, yyline, yycolumn, yytext()); }
        "####"                        { return new Symbol(sym.HEADER4, yyline, yycolumn, yytext()); }
        "###"                         { return new Symbol(sym.HEADER3, yyline, yycolumn, yytext()); }
        "##"                          { return new Symbol(sym.HEADER2, yyline, yycolumn, yytext()); }
        "#"                           { return new Symbol(sym.HEADER1, yyline, yycolumn, yytext()); }
        "***"                         { return new Symbol(sym.NEGRITAITALICA, yyline, yycolumn, yytext()); }
        "**"                          { return new Symbol(sym.NEGRITA, yyline, yycolumn, yytext()); }
        "*"                           { return new Symbol(sym.ASTERISCO, yyline, yycolumn, yytext()); }
        "+"                           { return new Symbol(sym.SUMA, yyline, yycolumn, yytext()); }
        "-"                           { return new Symbol(sym.RESTA, yyline, yycolumn, yytext()); }
        "/"                           { return new Symbol(sym.DIVISION, yyline, yycolumn, yytext()); }
        "^"                           { return new Symbol(sym.POTENCIA, yyline, yycolumn, yytext()); }
        "("                           { return new Symbol(sym.PARENTESIS_ABIERTO, yyline, yycolumn, yytext()); }
        ")"                           { return new Symbol(sym.PARENTESIS_CERRADO, yyline, yycolumn, yytext()); }
        "\""                          { return new Symbol(sym.COMILLAS, yyline, yycolumn, yytext()); }
        "reportes.operadores"         { return new Symbol(sym.REPORTE_OPERADORES, yyline, yycolumn, yytext()); }
        "reportes.errores"            { return new Symbol(sym.REPORTE_ERRORES, yyline, yycolumn, yytext()); }
        {LISTA}                       { return new Symbol(sym.LISTA, yyline, yycolumn, yytext()); }
        .                             { return new Symbol(sym.ERROR, yyline, yycolumn, yytext()); }
}