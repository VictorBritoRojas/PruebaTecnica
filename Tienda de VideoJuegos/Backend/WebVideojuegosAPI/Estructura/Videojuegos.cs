using System.Text.Json.Serialization;

namespace WebVideojuegosAPI.Estructura
{
    public class Videojuegos
    {
		public int Id { set; get; }

        public string Titulo { set; get; }

        public string Descripcion { set; get; }

        public int Anio { set; get; }

        public int Calificacion { set; get; }

        public string Consola { set; get; }

        public string Genero { set; get; }

    }

    public class VideojuegoUpADD
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

        [JsonPropertyName("idGenero")]
        public int IdGenero { set; get; }

    }
}
