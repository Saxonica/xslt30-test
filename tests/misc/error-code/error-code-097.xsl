<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:include - target is not a stylesheet -->
<?spec xslt#errors?><?error ?>


  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  
<xsl:include href="stdxmlfile.xml"/>

</xsl:stylesheet>