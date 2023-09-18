/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package compiladores;

import java.io.StringReader;

/**
 * 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
 *
 * @author kevyn
 */
public class Compiladores {

    /**
     * @param args the command line arguments
     */
    /*
    {
    "Titulo":"titulo pie",
    "variable1":4.5,
    "Titulo2":"titulo pie2",
    "variable2":1.5
    }
     */
    public static void main(String[] args) {

        //analizadores("src/json/", "Lexer.jflex", "Parser.jcup");
        
        analizadores("src/statpy/", "Lexer.jflex", "Parser.jcup");
        
        //analizar2("\"hola\"");
        System.out.println("//");
        String entrada = "{\n" +
                "\"Titulo\":\"titulo pie\",\n" +
                "\"variable1\":4.5,\n" +
                "\"Titulo2\":\"titulo pie2\",\n" +
                "\"variable2\":1.5\n" +
                "}";
        //System.out.println(entrada);
        
        
        Ventana miVentana = new Ventana();
        miVentana.setVisible(true);
        miVentana.setResizable(false);
        miVentana.setLocationRelativeTo(null); 
        // TODO code application logic here
    }

    public static void analizadores(String ruta, String jflexFile, String cupFile) {
        try {
            String opcionesJflex[] = {ruta + jflexFile, "-d", ruta};
            jflex.Main.generate(opcionesJflex);

            String opcionesCup[] = {"-destdir", ruta, "-parser", "Parser", ruta + cupFile};
            java_cup.Main.main(opcionesCup);

        } catch (Exception e) {
            System.out.println("No se ha podido generar los analizadores");
            System.out.println(e);
        }
    }

    // Realizar Analisis
    public static void analizar(String entrada) {
        try {
            json.Lexer lexer = new json.Lexer(new StringReader(entrada));
            json.Parser parser = new json.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }
    
    public static void analizar2(String entrada) {
        try {
            statpy.Lexer lexer = new statpy.Lexer(new StringReader(entrada));
            statpy.Parser parser = new statpy.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }

}
