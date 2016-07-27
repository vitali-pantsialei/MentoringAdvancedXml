using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Task3HtmlReport
{
    [TestClass]
    public class HtmlReporterTest
    {
        [TestMethod]
        public void HtmlTransform()
        {
            HtmlReporter reporter = new HtmlReporter("book.xslt");
            reporter.Transform("books.xml", "result.html");
        }
    }
}
