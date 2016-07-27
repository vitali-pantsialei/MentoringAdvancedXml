<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:x="http://library.by/catalog"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl" xmlns:cs="urn:cs">

  <xsl:output method="html" indent="yes"/>

  <msxsl:script language="C#" implements-prefix="cs">
    <![CDATA[
      public string DateNow()
     {
        return(DateTime.Now.ToString());
     }
     ]]>
  </msxsl:script>

  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:text>Текущие фонды по жанрам</xsl:text>
        </title>
      </head>
      <body>
        <h2>
          <xsl:text>Текущие фонды по жанрам: </xsl:text>
          <xsl:value-of select="cs:DateNow()"/>
        </h2>
        <xsl:call-template name="CreateTable">
          <xsl:with-param name="tableName" select="'Computer'"/>
          <xsl:with-param name="ctemplate" select="/x:catalog/x:book[x:genre='Computer']"/> 
        </xsl:call-template>
        <xsl:call-template name="CreateTable">
          <xsl:with-param name="tableName" select="'Fantasy'"/>
          <xsl:with-param name="ctemplate" select="/x:catalog/x:book[x:genre='Fantasy']"/>
        </xsl:call-template>
        <xsl:call-template name="CreateTable">
          <xsl:with-param name="tableName" select="'Romance'"/>
          <xsl:with-param name="ctemplate" select="/x:catalog/x:book[x:genre='Romance']"/>
        </xsl:call-template>
        <xsl:call-template name="CreateTable">
          <xsl:with-param name="tableName" select="'Horror'"/>
          <xsl:with-param name="ctemplate" select="/x:catalog/x:book[x:genre='Horror']"/>
        </xsl:call-template>
        <xsl:call-template name="CreateTable">
          <xsl:with-param name="tableName" select="'Science Fiction'"/>
          <xsl:with-param name="ctemplate" select="/x:catalog/x:book[x:genre='Science Fiction']"/>
        </xsl:call-template>
        <hr/>
        <xsl:text>Общее количество книг: </xsl:text>
        <xsl:value-of select="count(/x:catalog/x:book)"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="CreateTable">
    <xsl:param name="tableName"/>
    <xsl:param name="ctemplate" />
    <table border="1">
      <caption>
        <xsl:value-of select="$tableName"/>
      </caption>
      <tr>
        <th>Автор</th>
        <th>Назване</th>
        <th>Дата издания</th>
        <th>Дата регистрации</th>
      </tr>
      <xsl:apply-templates select="$ctemplate" />
    </table>
    <xsl:text>Количество книг: </xsl:text>
    <xsl:value-of select="count($ctemplate)"/>
    <br/>
  </xsl:template>

  <xsl:template match="x:book[x:genre]">
    <tr>
      <td>
        <xsl:value-of select="x:author"/>
      </td>
      <td>
        <xsl:value-of select="x:title"/>
      </td>
      <td>
        <xsl:value-of select="x:publish_date"/>
      </td>
      <td>
        <xsl:value-of select="x:registration_date"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>