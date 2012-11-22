<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.1"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">

  <xsl:output indent="yes"/>
  <xsl:strip-space elements="chapter"/>

  <!-- demonstrate use of local functions against the context node -->
  
  <xsl:mode name="s" streamable="yes"/>
  
  <xsl:template name="main">
    <xsl:apply-templates select="doc('ot2.xml')" mode="s"/>
  </xsl:template>
  
  <xsl:template match="*" mode="s">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="s"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="chapter" mode="s">
    <xsl:element name="CC{local-name()}" namespace="{namespace-uri(.)}">
      <xsl:attribute name="id" select="generate-id()"/>
      <xsl:apply-templates mode="s"/>
    </xsl:element>
  </xsl:template>  
  
  <xsl:template match="/" mode="s">
    <xsl:copy>
      <xsl:apply-templates mode="s"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="v" mode="s"/>
  
</xsl:stylesheet>