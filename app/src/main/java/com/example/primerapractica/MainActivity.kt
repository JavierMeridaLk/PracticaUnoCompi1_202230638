package com.example.primerapractica

import android.graphics.Color
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import androidx.activity.ComponentActivity
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import com.example.primerapractica.src.tools.AnalizadorLexicoTexto
import com.example.primerapractica.src.tools.parser
import java.io.StringReader


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.main_layout)
        val botonTexto: Button = findViewById(R.id.buttonTexto)
        val botonCodigo: Button = findViewById(R.id.buttonCodigo)
        val contenedorCeldas: LinearLayout = findViewById(R.id.contenedorCeldas)

        botonTexto.setOnClickListener {
            agregarCeldaTexto(contenedorCeldas)
        }
        botonCodigo.setOnClickListener {
            agregarCeldaCodigo(contenedorCeldas)
        }

    }
}
fun agregarCeldaTexto(contenedor: LinearLayout) {

    val celdaLayout = LinearLayout(contenedor.context)
    celdaLayout.orientation = LinearLayout.HORIZONTAL

    //se hace el textedit para el ingreso del texto
    val editText = EditText(contenedor.context)
    editText.layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
    editText.hint = "Ingresa tu texto"

    // se crea el boton para realizar la ejecucion
    val botonEjecutar = Button(contenedor.context)
    botonEjecutar.text = "✓"
    botonEjecutar.setTextColor(Color.WHITE)
    botonEjecutar.setBackgroundColor(Color.parseColor("#9a2bcc"))

    botonEjecutar.setOnClickListener {
        val textoIngresado = editText.text.toString()
        val reader = StringReader(textoIngresado)
        val lexer = AnalizadorLexicoTexto(reader)
        val parser = parser(lexer)



        try {

            val textoProcesado = parser.analizador.textoProcesado
            val textView = TextView(contenedor.context)

            textView.text = textoProcesado.toString()

            textView.setTextColor(Color.RED)  // Establecer color de texto
            // Insertar el TextView en el contenedor para mostrar el texto procesado
            contenedor.addView(textView)

        } catch (e: Exception) {
            e.printStackTrace()
        }


        println("ejecutar")
    }

    // se inserta el edit texto y el boton de ejecutar dontro del espacio de la celda
    celdaLayout.addView(editText)
    celdaLayout.addView(botonEjecutar)

    // agregamos la celda al contenedor principal
    contenedor.addView(celdaLayout)
}
fun agregarCeldaCodigo(contenedor: LinearLayout) {

    val celdaLayout = LinearLayout(contenedor.context)
    celdaLayout.orientation = LinearLayout.HORIZONTAL

    //se hace el textedit para el ingreso del codigo
    val editText = EditText(contenedor.context)
    editText.layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
    editText.hint = "Ingresa tu codigo"

    // se crea el boton para realizar la ejecucion
    val botonEjecutar = Button(contenedor.context)
    botonEjecutar.text = "✓"
    botonEjecutar.setTextColor(Color.WHITE)
    botonEjecutar.setBackgroundColor(Color.parseColor("#8000b3"))

    botonEjecutar.setOnClickListener {
        println("ejecutar codigo")
    }

    // se inserta el edit texto y el boton de ejecutar dontro del espacio de la celda
    celdaLayout.addView(editText)
    celdaLayout.addView(botonEjecutar)

    // agregamos la celda al contenedor principal
    contenedor.addView(celdaLayout)
}

@Preview
@Composable
fun BoxConstraint(){

}