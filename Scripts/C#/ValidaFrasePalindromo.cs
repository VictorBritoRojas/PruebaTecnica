using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace Prueba_tecnica
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Valida Palabras Palindromas");
            string palabra = string.Empty, noEs = "No es palindromo", siEs = "Es palindromo";
            char[] normal = null, inverso = null;
            while (true)
            {
                palabra = Console.ReadLine();
                palabra = palabra.ToLower().Replace(" ", "").Replace("á", "a").Replace("é", "e").Replace("í", "i").Replace("ó", "o").Replace("ú", "u").Replace(".", "");
                normal = palabra.ToCharArray();
                inverso = normal.Reverse().ToArray();
                string tmp1 = string.Empty, tmp2 = string.Empty;
                foreach (char c in normal) { tmp1 += c.ToString(); }

                foreach (char c in inverso) { tmp2 += c.ToString(); }
                if (tmp1 == tmp2)
                {
                    Console.WriteLine(siEs);
                }
                else
                {
                    Console.WriteLine(noEs);
                }
            }
        }
    }
}
