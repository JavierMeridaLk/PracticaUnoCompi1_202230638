package com.example.primerapractica.src.basic;

public class Analizador {

    private StringBuilder textoProcesado;

    public Analizador() {
        textoProcesado = new StringBuilder();
    }

    public void agregar(String text) {
        textoProcesado.append(text);
    }

    public String getTextoProcesado() {
        System.out.println(textoProcesado.toString());
        return textoProcesado.toString();
    }

}
