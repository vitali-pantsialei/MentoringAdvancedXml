using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Task2RSS
{
    [TestClass]
    public class RSSTests
    {
        [TestMethod]
        public void XmlToRssTransformationTest()
        {
            XmlRssConverter converter = new XmlRssConverter("book.xslt");
            converter.Transform("books.xml", "result.xml");
        }
    }
}
