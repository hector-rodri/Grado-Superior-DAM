//HÉCTOR RODRIGUEZ LOZANO
package com.example;//Utilizamos el mismo package porque es la forma que tiene java de enlazar y permitir manipular los objetos que estan dentro de este package

public class serra extends eina {//Clase serra la cual será clase hija de eina, heredará sus métodos. Para inidicar esto ponemos extends eina
    private String nom;//Nombre de la sierra

    public serra(double pes, String material) {//Llama al constructor de la clase padre eina y asigna un nombre por defecto

        super(pes, material);//Utilizamos super para llamar a los atributos de eina
        this.nom = "Serra";

    }

    public String getNom() {//Método para obtener el nombre de la herramienta, String porque nos tiene que devolver un String que es el nombre
        return this.nom;//Devuelve el nombre, en este caso devolverá el nombre assignado por defecto en el constructor si no se ha cambiado con el setNom
    }

    public void setNom(String nomIndicat) {//Método para establecer el nombre de la herramienta, void porque no devuelve nada
        this.nom = nomIndicat;

    }

    @Override//Utilizamos @Override para reemplazar la función de este método heredado
    public void utilitzar() {
        System.out.println("Tallant amb la serra.");//Print de que la sierra se está usando

    }
}
