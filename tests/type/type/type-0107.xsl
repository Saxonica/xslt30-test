<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!-- PURPOSE: Test availability of subtypes of String. -->
<?spec xpath#id-predefined-types?>
<?spec fo#casting-to-derived-types?>
  
  <xsl:template match="/">
    <out>;
      <t><xsl:value-of select="xs:normalizedString(' x y z ')"/></t>;
      <t><xsl:value-of select="xs:language('en')"/></t>;
      <t><xsl:value-of select="xs:token('a nice cup of tea')"/></t>;      
      <t><xsl:value-of select="xs:Name('my:goodness')"/></t>;                                       
      <t><xsl:value-of select="xs:NCName('fili-buster')"/></t>;
      <t><xsl:value-of select="xs:ID('jam')"/></t>;
      <t><xsl:value-of select="xs:IDREF('honey')"/></t>;      
      <t><xsl:value-of select="xs:ENTITY('stupid')"/></t>;  
      <t><xsl:value-of select="xs:NMTOKEN('...')"/></t>;  
    </out> 
  </xsl:template>
  

</xsl:stylesheet>