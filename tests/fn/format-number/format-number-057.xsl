<?xml version="1.0"?>
<?spec xslt#format-number?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- Purpose: Test use of an illegal picture. -->


<xsl:template match="doc">
  <out>
    <xsl:value-of select="format-number(931.4857,'000.##0')"/>
  </out>
</xsl:template>

</xsl:stylesheet>
