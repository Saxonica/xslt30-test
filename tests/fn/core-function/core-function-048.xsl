<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?spec fo#func-substring-before?>
  <!-- Purpose: Test of 'substring-before' function with a param reference 
       as its second argument.-->

<xsl:param name="param1">cut this</xsl:param>

<xsl:template match="doc">
 <out>
   <xsl:value-of select="substring-before('substring-before with paramcutthis',$param1)"/>
 </out>
</xsl:template>
</xsl:stylesheet>