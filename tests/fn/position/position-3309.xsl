<?xml version="1.0" encoding="ISO-8859-1"?>
<?spec fo#func-position?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- FileName: position66 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 2.4 -->
    <!-- Purpose: Test of zero in positional indexing. -->

<xsl:template match="doc">
  <out>
  <xsl:for-each select="a[0]">
    <xsl:value-of select="."/>
  </xsl:for-each>
  </out>
</xsl:template>

</xsl:stylesheet>