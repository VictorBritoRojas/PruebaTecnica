$(function(){
    let txtTitulo, txtDescripcion, cbxGenero, cbxConsola, cbxCalificacion, cbxAnio, btnEditar,btnEliminar;
    let vId;
    
    function obtenerControles(){
        txtTitulo = $("#txtTitulo");
        txtDescripcion = $("#txtDescripcion");
        cbxGenero = $("#cbxGenero");
        cbxConsola = $("#cbxConsola");
        cbxCalificacion = $("#cbxCalificacion");
        cbxAnio = $("#cbxAnio");
        btnEditar = $("#btnEditar");
        btnEliminar = $("#btnEliminar");
    }

    function asignarEventos(){
        btnEditar.on("click",function(e){
            editarRegistro();
        });

        btnEliminar.on("click",function(e){
            eliminarRegistro();
        });
    }

    function cargaCalificacion(){
        $.each(listCalificacion,function(it,i){
            cbxCalificacion.append($("<option>",{value:i,text:i}));
        });
    }

    function cargaAnio(){ 
        $.each(listAnios,function(it,i){
            cbxAnio.append($("<option>",{value:i,text:i}));
        });
    }

    function cargaGenero(){
        let config = obtenerConfig();
        config.method = "GET";
        config.url = obtenerUrl("Catalogo?opc=1");
        peticion(config,function(rst){
            if(rst.bandera>0) {
                $.each(rst.resultado,function(it,i){
                    cbxGenero.append($("<option>",{value:i.id,text:i.txt}));
                });
            }
        });
    }

    function cargaConsola(){ 
        let config = obtenerConfig();
        config.method = "GET";
        config.url = obtenerUrl("Catalogo?opc=2");
        peticion(config,function(rst){
            if(rst.bandera>0) {
                $.each(rst.resultado,function(it,i){
                    cbxConsola.append($("<option>",{value:i.id,text:i.txt}));
                });
            }
        });
    }

    function getParameterByName(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        const regex = new RegExp(`[\\?&]${name}=([^&#]*)`);
        const results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    };

    function buscarRegistro(){
        vId = getParameterByName("id");

        let config = obtenerConfig();
        config.method = "GET";
        config.url = obtenerUrl("ConsultaUno?id="+vId);

        peticion(config,function(listaTmp){
            console.log(listaTmp);
            if(listaTmp.bandera > 0) {
                $.each(listaTmp.resultado,function(it, i){
                    vId = i.id;
                    txtTitulo.val(i.titulo);
                    txtDescripcion.val(i.descripcion);
                    cbxGenero.val(i.genero);
                    cbxConsola.val(i.consola);
                    cbxCalificacion.val(i.calificacion);
                    cbxAnio.val(i.anio);
                });
            }
        });
    }

    function editarRegistro(){
        let data = newClsVideojuego();
        data.id = parseInt(vId);
        data.titulo = txtTitulo.val();
        data.descripcion = txtDescripcion.val();
        data.anio = parseInt(cbxAnio.val());
        data.calificacion = parseInt(cbxCalificacion.val());
        data.idConsola = parseInt(cbxConsola.val());
        data.idGenero = parseInt(cbxGenero.val());

        console.log(data);

        let config = obtenerConfig();
        config.method = "PUT";
        config.headers = { "Content-Type": "application/json" };
        config.url = obtenerUrl("Edita");
        config.data = JSON.stringify(data);

        console.log(config);

        peticion(config, function(rst){
            alert(rst.mensaje);
            if(rst.bandera>0) {
                txtTitulo.val("");
                txtDescripcion.val("");
                cbxAnio.val(0);
                cbxCalificacion.val(0);
                cbxConsola.val(0);
                cbxGenero.val(0);
                location.href = "index.html";
            }
        });
    }

    function eliminarRegistro(){
        let config = obtenerConfig();
        config.method = "DELETE";
        config.url = obtenerUrl("Elimina?idvj="+vId);

        peticion(config,function(rst){
            alert(rst.mensaje);
            if(rst.bandera>0) {
                txtTitulo.val("");
                txtDescripcion.val("");
                cbxAnio.val(0);
                cbxCalificacion.val(0);
                cbxConsola.val(0);
                cbxGenero.val(0);
                location.href = "index.html";
            }
        });
    }

    obtenerControles();
    asignarEventos();
    cargaCalificacion();
    cargaAnio();
    cargaGenero();
    cargaConsola();
    buscarRegistro();

})