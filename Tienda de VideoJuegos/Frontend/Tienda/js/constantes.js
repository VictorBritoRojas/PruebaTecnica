const listAnios = [1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,
    2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,
    2018,2019,2020,2021,2022,2023];

const listCalificacion = [1,2,3,4,5,6,7,8,9,10];

const clsCatologo = {
    id:"",
    txt:""
};

const clsVideojuego = {
    id: 0,
    titulo: "",
    descripcion: "",
    anio: 0,
    calificacion: 0,
    idConsola: 0,
    idGenero: 0
};

function newClsVideojuego(){
    let tmp = JSON.stringify(clsVideojuego);
    return JSON.parse(tmp);
}

const clsRespuesta = {
    mensaje: "",
    bandera: 0,
    resultado: {},
};

function newClsRespuesta(){
    let tmp = JSON.stringify(clsRespuesta);
    return JSON.parse(tmp);
}
