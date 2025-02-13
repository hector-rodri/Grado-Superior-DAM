

const nom = document.getElementById("nom").value.trim();
const email = document.getElementById("email").value.trim();
const assumpte = document.getElementById("assumpte").value.trim();
const missatge = document.getElementById("descripcio").value.trim();
const boton = document.getElementById("boton");


document.getElementById("formulariContacte").addEventListener("submit", function(event) {

    event.preventDefault();

    
    let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    let errors = [];

    if (nom === "") {
        errors.push("El nom és obligatori.");
    }

    if (email === "" || !emailRegex.test(email)) {
        errors.push("Introdueix un correu electrònic vàlid.");
    }

    if (assumpte === "") {
        errors.push("L'assumpte és obligatori.");
    }

    if (missatge === "") {
        errors.push("El missatge no pot estar buit.");
    }

    if (errors.length > 0) {
        missatgeValidacio.innerHTML = errors.join("<br>");
        missatgeValidacio.style.color = "red";
    } else {
        missatgeValidacio.innerHTML = "El formulari s'ha enviat correctament.";
        missatgeValidacio.style.color = "green";

        // Opcional: Pots afegir un timeout per eliminar el missatge després d'uns segons
        setTimeout(() => {
            missatgeValidacio.innerHTML = "";
        }, 5000);

        // Reset del formulari després de l'enviament correcte
        document.getElementById("formulariContacte").reset();
    }
});