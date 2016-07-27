using System;
using System.Xml;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Task1Schemas
{
    [TestClass]
    public class SchemaTests
    {
        [TestMethod]
        public void BookSchemaTest()
        {
            BookSchemaValidator validator = new BookSchemaValidator("http://library.by/catalog", "books.xsd", "books.xml");
            validator.Validate();
            Console.WriteLine(validator.Message);
        }
    }
}
