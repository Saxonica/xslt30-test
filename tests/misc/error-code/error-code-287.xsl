<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0840?>



  <xsl:template name="main">
    <my:out>
        <xsl:attribute name="a" select="2">five</xsl:attribute>
    </my:out>
  </xsl:template>
  



</xsl:stylesheet>