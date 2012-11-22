<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
       
  
    <!-- within a streaming template, pattern matches multiple node kinds -->
     
    <xsl:mode streamable="yes"/>
         
    <xsl:output method="xml" indent="no" encoding="UTF-8" />
  
    <xsl:strip-space elements="*"/>
      
    <xsl:template name="main">
      <out>
        <xsl:apply-templates select="doc('mixed.xml')"/>
      </out>
    </xsl:template>
    
    <xsl:template match="coverpg|preface|titlepg"/>
    
    <xsl:template match="node()|@*">
      <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="v|@length"/>
   
    
</xsl:transform>
