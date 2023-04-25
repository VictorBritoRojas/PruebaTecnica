using System.Text.Json;

namespace WebVideojuegosAPI.Estructura
{
    public class ResultadoJson
    {
        public string Mensaje { set; get; }

        public int Bandera { set; get; }

        public object Resultado { set; get; }

        public void listo()
        { 
            Mensaje = "listo";
            Bandera = 1;
        }

        public void error(string mensaje = "Error")
        {
            Mensaje = mensaje;
            Bandera = -1;
        }

        public override string ToString()
        {
            return JsonSerializer.Serialize<ResultadoJson>(this);
        }
    }
}
