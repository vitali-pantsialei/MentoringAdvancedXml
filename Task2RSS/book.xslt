<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:x="http://library.by/catalog"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl" xmlns:cs="urn:cs">

  <xsl:output method="xml" indent="yes"/>

  <msxsl:script language="C#" implements-prefix="cs">
    <![CDATA[
      public string DateNow()
     {
        return(DateTime.Now.ToString());
     }
     ]]>
  </msxsl:script>

  <xsl:template match="/">
    <rss version="2.0">
      <channel>
        <title>
          <xsl:text>Books catlog</xsl:text>
        </title>
        <link>
          <xsl:value-of select="namespace-uri(/*)"/>
        </link>
        <description>
          <xsl:text>List of books</xsl:text>
        </description>
        <language>
          <xsl:text>en-us</xsl:text>
        </language>
        <pubDate>
          <xsl:value-of select="cs:DateNow()"/>
        </pubDate>
        <xsl:apply-templates select="node()" />
      </channel>
    </rss>
  </xsl:template>

  <xsl:template match="x:book">
    <item>
      <title>
        <xsl:value-of select="x:title"/>
      </title>
      <link>
        <xsl:choose>
          <xsl:when test="x:isbn and (x:genre = 'Computer')">
            <xsl:value-of select="concat(concat('http://my.safaribooksonline.com/', x:isbn), '/')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="x:isbn"/>
          </xsl:otherwise>
        </xsl:choose>
      </link>
      <description>
        <xsl:value-of select="x:description"/>
      </description>
      <pubDate>
        <xsl:value-of select="x:registration_date"/>
      </pubDate>
      <guid>
        <xsl:value-of select="./@id"/>
      </guid>
    </item>
  </xsl:template>
</xsl:stylesheet>
