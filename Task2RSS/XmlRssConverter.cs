using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Xsl;

namespace Task2RSS
{
    public class XmlRssConverter
    {
        private XslCompiledTransform transform;
        public XmlRssConverter(string xsltPath)
        {
            XsltSettings settings = new XsltSettings();
            settings.EnableScript = true;
            this.transform = new XslCompiledTransform();
            transform.Load(xsltPath, settings, null);
        }

        public void Transform(string xmlPath, string resultRssPath)
        {
            transform.Transform(xmlPath, resultRssPath);
        }
    }
}
