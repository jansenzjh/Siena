using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


static class ShareHelper
{
    public static string FillSpace(string text, string connector = "")
    {
        if (text.Contains(" "))
        {
            text = System.Text.RegularExpressions.Regex.Replace(text, @" ", connector);
        }
        return text;
    }

    public static string ReplaceAllString(this string text, string oldString, string newString)
    {
        if (text.Contains(oldString))
        {
            text = System.Text.RegularExpressions.Regex.Replace(text, oldString, newString);
        }
        return text;
    }

    public static string RemoveAllNextLineCharacters(this string text)
    {
        return text.ReplaceAllString("\n", "").ReplaceAllString("\r", "").TrimStart().TrimEnd();
    }
    
}

