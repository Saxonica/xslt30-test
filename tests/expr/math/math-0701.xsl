<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?spec fo#func-numeric-subtract?>
<!-- PURPOSE:  Test of '-' operator. -->
<xsl:template match="doc">
 <out>
  <xsl:value-of select="3-1"/>
 </out>
</xsl:template>
 
</xsl:stylesheet>
