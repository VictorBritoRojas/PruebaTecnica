$(function(){
    let txtTitulo, txtDescripcion, cbxGenero, cbxConsola, cbxCalificacion, cbxAnio, btnAgregar;
    
    function obtenerControles(){
        txtTitulo = $("#txtTitulo");
        txtDescripcion = $("#txtDescripcion");
        cbxGenero = $("#cbxGenero");
        cbxConsola = $("#cbxConsola");
        cbxCalificacion = $("#cbxCalificacion");
        cbxAnio = $("#cbxAnio");
        btnAgregar = $("#btnAgregar");
    }

    function asignarEventos(){
        btnAgregar.on("click",function(e){
            guardarJuego();
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

    function guardarJuego(){
        console.log("entro en el metodo");
        let data = newClsVideojuego();
        data.titulo = txtTitulo.val();
        data.descripcion = txtDescripcion.val();
        data.anio = cbxAnio.val();
        data.calificacion = cbxCalificacion.val();
        data.idConsola = cbxConsola.val();
        data.idGenero = cbxGenero.val();

        console.log(data);

        let config = obtenerConfig();
        config.method = "POST";
        config.headers = { "Content-Type": "application/json" };
        config.url = obtenerUrl("Agregar");
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
                window.Location.href = "index.html";
            }
        });
    }

    obtenerControles();
    asignarEventos();
    cargaCalificacion();
    cargaAnio();
    cargaGenero();
    cargaConsola();
});
