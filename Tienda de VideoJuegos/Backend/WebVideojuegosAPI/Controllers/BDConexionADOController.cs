using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ConexionBaseDatos.Conexion.SQL;
using ConexionBaseDatos.Utilidades;
using System.Data;
using Microsoft.Extensions.Configuration;
using WebVideojuegosAPI.Estructura;
using System.Collections.Generic;
using System;

namespace WebVideojuegosAPI.Controllers
{
    [ApiController]
    [Route("juegos/v1")]
    public class BDConexionADOController : Controller
    {
        #region Propiedades

        private ResultadoJson _resultado;

        private ParametrosSP parametros;

        private Ado ado;

        #endregion

        public BDConexionADOController(IConfiguration config) 
        {
            ado = new Ado(config.GetConnectionString("CadenaSQL"));
            parametros = new ParametrosSP();         
        }

        private List<Videojuegos> crearRespuesta(DataTable tbl)
        {
            List<Videojuegos> _listaVJ = new List<Videojuegos>();
            if (tbl != null)
            {
                foreach (DataRow it in tbl.Rows)
                {
                    _listaVJ.Add(new Videojuegos()
                    {
                        Id = int.Parse(it["Id"].ToString()),
                        Titulo = it["Titulo"].ToString(),
                        Descripcion = it["Descripcion"].ToString(),
                        Anio = int.Parse(it["Año"].ToString()),
                        Calificacion = int.Parse(it["Calificacion"].ToString()),
                        Consola = it["Consola"].ToString(),
                        Genero = it["Genero"].ToString()
                    });
                }
            }
            return _listaVJ;
        }

        [HttpGet]
        [Route("Consulta")]
        public JsonResult Get()
        {
            try
            {
                _resultado = new ResultadoJson();
                _resultado.listo();
                parametros.Sp = Cadenas.BaseDatos.spConsulta;

                _resultado.Resultado = crearRespuesta(ado.spDataTable(parametros));
                
                if (_resultado.Resultado == null)
                {
                    _resultado.error("Existio un error al consultar la Informacion");
                }
                
                return new JsonResult(_resultado);
            }
            catch (Exception e)
            {
                Log.MensajeLog msg = new Log.MensajeLog()
                {
                    TipoError = (int)Log.TipoError.Error,
                    Mensaje = "Error ejecutando "+ Cadenas.BaseDatos.spConsulta,
                    Error = e.Message
                };
                Log.guardarLog(msg);
                _resultado.error(msg.Mensaje);
                return new JsonResult(_resultado);
            }
        }

        [HttpGet]
        [Route("ConsultaUno")]
        public JsonResult Get(int id)
        {
            try
            {
                _resultado = new ResultadoJson();
                _resultado.listo();
                parametros.Sp = Cadenas.BaseDatos.spConsulta;
                parametros.AddParametro("id",id);

                _resultado.Resultado = crearRespuesta(ado.spDataTable(parametros));

                if (_resultado.Resultado == null)
                {
                    _resultado.error("Existio un error al consultar la Informacion");
                }

                return new JsonResult(_resultado);
            }
            catch (Exception e)
            {
                Log.MensajeLog msg = new Log.MensajeLog()
                {
                    TipoError = (int)Log.TipoError.Error,
                    Mensaje = "Error ejecutando " + Cadenas.BaseDatos.spConsulta,
                    Error = e.Message
                };
                Log.guardarLog(msg);
                _resultado.error(msg.Mensaje);
                return new JsonResult(_resultado);
            }
        }

        [HttpGet]
        [Route("Catalogo")]
        public JsonResult GetCatalogo(int opc)
        {
            try
            {
                _resultado = new ResultadoJson();
                _resultado.listo();
                List<Catalogo>  _listaC = new List<Catalogo>();
                parametros.Sp = Cadenas.BaseDatos.spCatalogo;
                parametros.AddParametro(opc);
                DataTable tbl = ado.spDataTable(parametros);
                if (tbl != null)
                {
                    foreach (DataRow it in tbl.Rows)
                    {
                        _listaC.Add(new Catalogo() {
                            id = it["id"],
                            txt = it["txt"]
                        });
                    }
                    _resultado.Resultado = _listaC;
                }
                else
                {
                    _resultado.error("Existio un error al consultar la Informacion");
                }
                return new JsonResult(_resultado);
            }
            catch (Exception e)
            {
                Log.MensajeLog msg = new Log.MensajeLog()
                {
                    TipoError = (int)Log.TipoError.Error,
                    Mensaje = "Error ejecutando " + Cadenas.BaseDatos.spCatalogo,
                    Error = e.Message
                };
                Log.guardarLog(msg);
                _resultado.error(msg.Mensaje);
                return new JsonResult(_resultado);
            }
        }

        [HttpPost]
        [Route("Agregar")]
        public JsonResult Post([FromBody] VideojuegoUpADD keyValues)
        {
            try
            {
                DataTable tbl = new DataTable();
                _resultado = new ResultadoJson();
                _resultado.listo();
                parametros.Sp = Cadenas.BaseDatos.spAgrega;
                parametros.AddParametro(Cadenas.BaseDatos.oTitulo, keyValues.Titulo);
                parametros.AddParametro(Cadenas.BaseDatos.oDesc, keyValues.Descripcion);
                parametros.AddParametro(Cadenas.BaseDatos.oAnio, keyValues.Anio);
                parametros.AddParametro(Cadenas.BaseDatos.oCalifica, keyValues.Calificacion);
                parametros.AddParametro(Cadenas.BaseDatos.oConsola, keyValues.IdConsola);
                parametros.AddParametro(Cadenas.BaseDatos.oGenero, keyValues.IdGenero);
                tbl = ado.spDataTable(parametros);
                if (tbl != null)
                {
                    foreach (DataRow it in tbl.Rows)
                    {
                        _resultado.Mensaje = it[Cadenas.BaseDatos.colMsg].ToString();
                        _resultado.Bandera = int.Parse(it[Cadenas.BaseDatos.colFlag].ToString());
                    }
                }
                else
                {
                    _resultado.error("Existio un error al agregar la Informacion");
                }
                return new JsonResult(_resultado);
            }
            catch (Exception e)
            {
                Log.MensajeLog msg = new Log.MensajeLog()
                {
                    TipoError = (int)Log.TipoError.Error,
                    Mensaje = "Error ejecutando " + Cadenas.BaseDatos.spAgrega,
                    Error = e.Message
                };
                Log.guardarLog(msg);
                _resultado.error(msg.Mensaje);
                return new JsonResult(_resultado);
            }
        }

        [HttpPut]
        [Route("Edita")]
        public JsonResult Put([FromBody] VideojuegoUpADD keyValues)
        {
            try
            {
                DataTable tbl = new DataTable();
                _resultado = new ResultadoJson();
                _resultado.listo();
                parametros.Sp = Cadenas.BaseDatos.spEdita;
                parametros.AddParametro(Cadenas.BaseDatos.oId, keyValues.Id);
                parametros.AddParametro(Cadenas.BaseDatos.oTitulo, keyValues.Titulo);
                parametros.AddParametro(Cadenas.BaseDatos.oDesc, keyValues.Descripcion);
                parametros.AddParametro(Cadenas.BaseDatos.oAnio, keyValues.Anio);
                parametros.AddParametro(Cadenas.BaseDatos.oCalifica, keyValues.Calificacion);
                parametros.AddParametro(Cadenas.BaseDatos.oConsola, keyValues.IdConsola);
                parametros.AddParametro(Cadenas.BaseDatos.oGenero, keyValues.IdGenero);
                tbl = ado.spDataTable(parametros);
                if (tbl != null)
                {
                    foreach (DataRow it in tbl.Rows)
                    {
                        _resultado.Mensaje = it[Cadenas.BaseDatos.colMsg].ToString();
                        _resultado.Bandera = int.Parse(it[Cadenas.BaseDatos.colFlag].ToString());
                    }
                }
                else
                {
                    _resultado.error("Existio un error al editar la Informacion");
                }
                return new JsonResult(_resultado);
            }
            catch (Exception e)
            {
                Log.MensajeLog msg = new Log.MensajeLog()
                {
                    TipoError = (int)Log.TipoError.Error,
                    Mensaje = "Error ejecutando " + Cadenas.BaseDatos.spAgrega,
                    Error = e.Message
                };
                Log.guardarLog(msg);
                _resultado.error(msg.Mensaje);
                return new JsonResult(_resultado);
            }
        }

        [HttpDelete]
        [Route("Elimina")]
        public JsonResult Delete(int idvj)
        {
            try
            {
                DataTable tbl = new DataTable();
                _resultado = new ResultadoJson();
                _resultado.listo();
                parametros.Sp = Cadenas.BaseDatos.spElimina;
                parametros.AddParametro(Cadenas.BaseDatos.oId, idvj);
                tbl = ado.spDataTable(parametros);
                if (tbl != null)
                {
                    foreach (DataRow it in tbl.Rows)
                    {
                        _resultado.Mensaje = it[Cadenas.BaseDatos.colMsg].ToString();
                        _resultado.Bandera = int.Parse(it[Cadenas.BaseDatos.colFlag].ToString());
                    }
                }
                else
                {
                    _resultado.error("Existio un error al eliminar la Informacion");
                }
                return new JsonResult(_resultado);
            }
            catch (Exception e)
            {
                Log.MensajeLog msg = new Log.MensajeLog()
                {
                    TipoError = (int)Log.TipoError.Error,
                    Mensaje = "Error ejecutando " + Cadenas.BaseDatos.spAgrega,
                    Error = e.Message
                };
                Log.guardarLog(msg);
                _resultado.error(msg.Mensaje);
                return new JsonResult(_resultado);
            }
        }
    }
}
