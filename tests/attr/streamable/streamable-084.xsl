<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
       
  
  <!-- within a streaming template, use if/then/else for conditional processing -->
  <!-- action depends on down-content, condition does not -->
  
   
  <xsl:mode name="s" streamable="yes"/>
  <xsl:strip-space elements="*"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
    
  <xsl:template name="main" match="/">
    <out>
      <xsl:apply-templates select="doc('loans.xml')" mode="s"/>
    </out>
  </xsl:template>
  
  <xsl:template match="Property" mode="s">
    <Property>
      <xsl:sequence select="if (lang('en')) then Address else if (lang('de')) then PropertyPurchase else ()"/>
    </Property>
  </xsl:template>
  
  <xsl:template match="text()" mode="#all"/>
       
</xsl:transform>
