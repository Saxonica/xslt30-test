<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

<!-- context position is not defined within xsl:on-completion -->

<xsl:output indent="yes"/>

<xsl:template name="main" xmlns:saxon="http://saxon.sf.net/" extension-element-prefixes="saxon">
<out>
  <xsl:iterate select="1 to 10"  xmlns:saxon="http://saxon.sf.net/" xsl:extension-element-prefixes="saxon">
    <xsl:value-of select="position()"/>
    <xsl:on-completion>
      <xsl:value-of select="position()"/>
    </xsl:on-completion>
  </xsl:iterate>
</out>
</xsl:template>


</xsl:stylesheet>