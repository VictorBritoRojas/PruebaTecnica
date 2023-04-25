using System.Text.Json.Serialization;

namespace WebVideojuegosAPI.Estructura
{
    public class Videojuegos
    {
        [JsonPropertyName("id")]
		public int Id { set; get; }

        [JsonPropertyName("titulo")]
        public string Titulo { set; get; }

        [JsonPropertyName("descripcion")]
        public string Descripcion { set; get; }

        [JsonPropertyName("anio")]
        public int Anio { set; get; }

        [JsonPropertyName("calificacion")]
        public int Calificacion { set; get; }

        [JsonPropertyName("idConsola")]
        public int IdConsola { set; get; }

        public string Consola { set; get; }

        [JsonPropertyName("idGenero")]
        public int IdGenero { set; get; }

        public string Genero { set; get; }

    }
}
