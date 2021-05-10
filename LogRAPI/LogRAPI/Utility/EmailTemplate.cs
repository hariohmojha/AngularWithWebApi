using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserManagementAPI.Utility
{
    public class EmailTemplate
    {

        public static StringBuilder Userblocked()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <!DOCTYPE html >");
            sb.Append(" <html lang = 'en' >");
            sb.Append("<meta charset = 'UTF-8'>");
            sb.Append("< title > Page Title </ title >");
            sb.Append("< meta name = 'viewport' content = 'width=device-width,initial-scale=1' >");
            sb.Append("< link rel = 'stylesheet' href = '' >");
            sb.Append("<body>< div class=''>");
            sb.Append("<h1>This is a Heading</h1>");
            sb.Append("< p>This is a paragraph.</p>");
            sb.Append("< p>This is another paragraph.</p>");
            sb.Append("</div> </body></html>");
            return sb;




        }
    }
}
