<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0720?>



  <xsl:template match="/">
    <out>
        <xsl:apply-templates/>
        <xsl:element name="e" use-attribute-sets="a"/>
    </out>
  </xsl:template>
  
  <xsl:attribute-set name="a" use-attribute-sets="b"/>
  <xsl:attribute-set name="b" use-attribute-sets="c"/>
  <xsl:attribute-set name="c" use-attribute-sets="a"/>    
  



</xsl:stylesheet>