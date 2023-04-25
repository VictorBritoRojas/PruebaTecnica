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
                    let tmp = $("<tr>",{id:i.id});
                    tmp.append($("<td>",{html:$("<a>",{html:i.id,href:"editar.html?id="+i.id})}));
                    tmp.append($("<td>",{html:i.titulo}));
                    tmp.append($("<td>",{html:i.descripcion}));
                    tmp.append($("<td>",{html:i.anio}));
                    tmp.append($("<td>",{html:i.calificacion}));
                    tmp.append($("<td>",{html:i.consola}));
                    tmp.append($("<td>",{html:i.genero}));
                    tabla.find("#cuerpo").append(tmp);
                });
            }
        });
    }

    obtenerControles();
    obtenerLista();
});
