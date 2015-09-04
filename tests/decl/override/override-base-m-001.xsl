<xsl:package 
  name="http://www.w3.org/xslt30tests/override-base-m-001"
  package-version="1.0.0"
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:p="http://www.w3.org/xslt30tests/override-base-m-001"
  exclude-result-prefixes="xs p">
  
  <xsl:mode/>
  
  <xsl:mode name="m1" visibility="private"/>
  
  <xsl:mode name="m2" visibility="final"/>
  
  <xsl:template match="a" mode="m2">
    <A><xsl:apply-templates/></A>
  </xsl:template>
  
  <xsl:template match="b" mode="m2">
    <B><xsl:apply-templates/></B>
  </xsl:template>
  
  <xsl:mode name="m3" visibility="public"/>
  
  <xsl:template match="a" mode="m3">
    <A><xsl:apply-templates/></A>
  </xsl:template>
  
  <xsl:template match="b" mode="m3">
    <B><xsl:apply-templates/></B>
  </xsl:template>
  
  
  
</xsl:package>   