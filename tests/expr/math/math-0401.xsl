<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?spec fo#func-sum?>
<!-- PURPOSE:  Test of sum(). -->
<xsl:template match="doc">
  <out>
    <xsl:value-of select="sum(n)"/>
  </out>
</xsl:template>
 
</xsl:stylesheet>
