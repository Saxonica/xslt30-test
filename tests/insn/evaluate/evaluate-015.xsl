<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:saxon="http://saxon.sf.net/"
 version="3.0">
 
 <!-- Basic test of saxon:evaluate-node() -->
 <!-- Formerly saxon013 -->
 <!-- rewritten Nov 2009 to use xsl:evaluate -->
 
<xsl:output indent="yes"/> 
 
<xsl:template match="doc">
<out><xsl:apply-templates/></out>
</xsl:template>

<xsl:template match="exp">
  <ans><xsl:evaluate xpath="string(.)" base-uri="{base-uri(.)}" namespace-context="." context-item="."/></ans>
</xsl:template>

</xsl:transform>