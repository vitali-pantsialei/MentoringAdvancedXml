using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Schema;

namespace Task1Schemas
{
    public class BookSchemaValidator
    {
        private string message;
        public string Message { get { return this.message; } }
        private XmlReader reader;

        public BookSchemaValidator(string targetNamespace, string xsdPath, string xmlPath)
        {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.Schemas.Add(targetNamespace, xsdPath);

            settings.ValidationEventHandler +=
                delegate(object sender, ValidationEventArgs e)
                {
                    this.message += String.Format("[{0}:{1}] {2}", e.Exception.LineNumber, e.Exception.LinePosition, e.Message);
                };

            settings.ValidationFlags = settings.ValidationFlags | System.Xml.Schema.XmlSchemaValidationFlags.ReportValidationWarnings;
            settings.ValidationType = ValidationType.Schema;
            this.reader = XmlReader.Create(xmlPath, settings);
        }

        public bool Validate()
        {
            this.message = "";
            while (reader.Read()) ;
            if (String.IsNullOrEmpty(this.message))
                return true;
            else
                return false;
        }
    }
}
