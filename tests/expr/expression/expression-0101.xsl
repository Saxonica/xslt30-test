<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">


  <!-- PURPOSE: Test of lang() function -->
<?spec fo#func-lang?>

<xsl:template match="doc">
    <out>
      <xsl:value-of select="para[@id='1' and lang('en')]"/>
    </out>
</xsl:template>
 
</xsl:stylesheet>
