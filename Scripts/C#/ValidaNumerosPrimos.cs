using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace Prueba_tecnica
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Valida Numeros Primos");
            string numero = string.Empty, noEs = "No es numero primo", siEs = "Es numero primo";
            int primo = 0;
            while (true)
            {
                numero = Console.ReadLine();
                if (int.TryParse(numero, out primo))
                {
                    if (primo == 2 || primo == 3)
                    {
                        Console.WriteLine(siEs);
                        continue;
                    }
                    if ((primo % 2) == 0 || (primo % 3) == 0)
                    {
                        Console.WriteLine(noEs);
                    }
                    else
                    {
                        Console.WriteLine(siEs);
                    }
                }
                else
                {
                    Console.WriteLine(noEs);
                }
            }
        }
    }
}
