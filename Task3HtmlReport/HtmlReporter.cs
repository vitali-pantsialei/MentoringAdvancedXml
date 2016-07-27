using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Xsl;

namespace Task3HtmlReport
{
    public class HtmlReporter
    {
        private XslCompiledTransform transform;
        public HtmlReporter(string xsltPath)
        {
            XsltSettings settings = new XsltSettings();
            settings.EnableScript = true;
            this.transform = new XslCompiledTransform();
            transform.Load(xsltPath, settings, null);
        }

        public void Transform(string xmlPath, string resultHtmlPath)
        {
            transform.Transform(xmlPath, resultHtmlPath);
        }
    }
}
