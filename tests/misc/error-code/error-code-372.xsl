<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1400?>

  <xsl:template name="main">
    
    <out>        
          <xsl:sequence select="function-available('1234')"/>        
    </out>
  </xsl:template>
  



</xsl:stylesheet>