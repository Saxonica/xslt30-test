<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0580?>



  <xsl:template name="main">
    <out>
        <xsl:apply-templates/>
    </out>
  </xsl:template>
  
  <xsl:function name="my:f">
    <xsl:param name="p"/>
    <xsl:param name="p"/> 
    <xsl:value-of select="$p"/>
  </xsl:function>   
  


</xsl:stylesheet>