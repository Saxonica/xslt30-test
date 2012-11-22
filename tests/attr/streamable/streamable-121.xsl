<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:g="http://www.w3.org/xsl-tests/grouped-transactions-e"
    xmlns="http://www.w3.org/xsl-tests/grouped-transactions-e"
    exclude-result-prefixes="g xs"
    version="2.1">
       
  
  <!-- within a streaming template, downwards-selecting predicate in match pattern -->
   
  <xsl:import-schema namespace="http://www.w3.org/xsl-tests/grouped-transactions-e" schema-location="grouped-transactions-e.xsd"/>

  <xsl:mode name="s" streamable="yes"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
   
  <xsl:template name="main" match="/">
    <out>
      <xsl:apply-templates select="doc('grouped-transactions-e.xml')" mode="s"/>
    </out>
  </xsl:template>
  
  <xsl:template match="g:account/g:transaction[date ge xs:date('2006-02-21')]" mode="s">
    <max date="{date}"><xsl:value-of select="format-number(max(value), '0.00')"/></max>
  </xsl:template>
  
  <xsl:template match="g:transaction" mode="s"/>
  
  <xsl:template match="text()" mode="s"/>
  
    
</xsl:transform>
