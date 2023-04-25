$(function(){
    let tabla;

    function obtenerControles(){
        tabla = $("#tabla");
    }

    function obtenerLista(){
        let config = obtenerConfig();
        config.method = "GET";
        config.url = obtenerUrl("Consulta");
        peticion(config,function(listaTmp){
            if(listaTmp.bandera > 0) {
                $.each(listaTmp.resultado,function(it, i){
                    console.log(it);
                    console.log(i);
                    let tmp = $("<tr>");
                    tmp.append($("<th>",{scope:"row", html:"valor"}));
                    tmp.append($("<td>",{html:"valor"}));
                    tmp.append($("<td>",{html:"valor"}));
                    tmp.append($("<td>",{html:"valor"}));
                    tmp.append($("<td>",{html:"valor"}));
                    tmp.append($("<td>",{html:"valor"}));
                    tmp.append($("<td>",{html:"valor"}));
                    tmp.append($("<td>",{html:$("<span>",{class:"badge text-bg-danger",html:"Eliminar"})}));
                    tabla.find("tbody").append(tmp);
                });
            }
            console.log(listaTmp);
        });
    }
    
    obtenerControles();
    obtenerLista();
});
