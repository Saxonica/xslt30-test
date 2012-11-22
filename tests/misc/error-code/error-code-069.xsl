<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: Undeclared key -->
<?spec xslt#errors?><?error XTDE1260?>

  <xsl:template match="doc">
    <out>
      <xsl:value-of select="key('nonkey', '12')"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>