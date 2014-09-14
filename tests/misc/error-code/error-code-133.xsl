<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:apply-templates - duplicate params -->
<?spec xslt#errors?><?error XTSE0670?>

<xsl:template name="x"/>
  
  <xsl:template match="doc">
    <out>
      <xsl:apply-templates select="item" mode="crazy">
         <xsl:with-param name="x" select="2"/>
         <xsl:with-param name="x" select="3"/>
      </xsl:apply-templates>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>




</xsl:stylesheet>