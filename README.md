# PruebaTecnica
Repositorio que almacena las pruebas tecnicas realizadas

## Contenido
- Tienda de Videojuegos
- Scripts son pruebas tecnicas que solo ocuparon algunas lineas de codigo

## Tienda de Videojuegos

Dentro de la Carpeta existen las carpetas Backend, Base de Datos y Frontend

#### Base de datos
Dentro de esta carpeta se encuentra un script que crea la base de datos a usar. Solo es ejecutar el script y se podra usar la BD sin problemas archivo **ScriptBaseDatos.sql**

#### Backend
Dentro de esta carpeta se encuentra el api que se usara.
El proyecto fue desarrollado en **Visual Studio Community 2022**, **Net Core 3.1**

En caso de que la cadena de conexion se quiera cambiar, se debe de realizar el cambio en el archivo **appsettings.json**

Una vez dentro del archivo hay que modificar el valor de **CadenaSQL** y especificar la cadena de conexion correcta
``"ConnectionStrings": {
    "CadenaSQL": "Data Source=localhost;Initial Catalog=PTVideojuegos;Integrated Security=True"
  }``

Antes de se pueden realizar pruebas a la API usando postman. Para esto en la carpeta existe un archivo llamado **Tienda de Videojuegos.postman_collection.json**, este archivo si es cargado a postman se mostraran las peticiones que se pueden realizar a la API


#### Frontend
El front fue desarrollado con **JQuery**, **Bootstrap**, **javascript**
No hay la nesesidad de descargar nado, todo se encuantra dentro de las carpetas.

Para cambiar la url que indica donde esta la API hay que modificar el archivo de **Tienda>js>constantes.js**

Dentro hay que cambier el valor en el metodo obtenerUrl()

``function obtenerUrl(val){ return 'https://localhost:44334/juegos/v1/${val}'; }``

Solo si es que la url es diferente a la especificada

#### Listo
Una vez ya verificado que todo esta correctamente primero se debe de ejecutar la api, esperar a que se levante y despues ejecutar en el frontend el archivo **index.html** para poder ver el la pagina web.

## Scripts
Carpeta que tiene un par de scripts 

### C#
- ValidaFrasePalindromo
- ValidaNumerosPrimos
