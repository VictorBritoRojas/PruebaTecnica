const configAjax = {
    method: "POST",
    async: true,
    timeout: 0,
    url: "",
    data: {}
};

function obtenerConfig(){
    let tmp = JSON.stringify(configAjax);
    return JSON.parse(tmp);
}

function obtenerUrl(val){
    return `https://localhost:44334/juegos/v1/${val}`;
}

function peticion(configuracion, callback) {
    let respuesta;
    $.ajax(configuracion).done(function(res) {
        console.log(res);
        if(typeof res !== 'object'){
            respuesta = newClsRespuesta();
            respuesta.mensaje = "Existio un error inetntelo mas tarde";
            respuesta.bandera = -1;
            callback(respuesta);
        }
        else {
            respuesta = res;
            callback(respuesta);
        }
        }).fail(function(res){
            console.log(res);
            respuesta = newClsRespuesta();
            respuesta.mensaje = "Existio un error inetntelo mas tarde";
            respuesta.bandera = -1;
            callback(respuesta);
         });
}