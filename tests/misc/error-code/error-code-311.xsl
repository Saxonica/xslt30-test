<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE0990?>


  <xsl:template name="main">
    <out>
      <xsl:for-each select="1 to 5">
        <xsl:number/>
      </xsl:for-each>
    </out>
  </xsl:template>
  



</xsl:stylesheet>