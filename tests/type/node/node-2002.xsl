<?xml version="1.0" ?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs"
version="2.0">
<!--  Test "NodeOrder" operators - "<<"; sibling nodes
-->
<?spec fo#func-node-before?>
<xsl:template match="/">
<xsl:variable name="item1" select="//node[@val='01']"/>
<xsl:variable name="item2" select="//node[@val='02']"/>
<xsl:variable name="item3" select="//node[@val='03']"/>
<xsl:variable name="item1d" select="//node[@val='01']"/>
<out>
<xsl:text>nodes: </xsl:text><xsl:value-of select="$item2/@val"/>
<xsl:text> </xsl:text><xsl:value-of select="$item3/@val"/><xsl:text>: </xsl:text>
<xsl:value-of select="$item2 &lt;&lt; $item3"/><xsl:text>; </xsl:text>

<xsl:text>nodes: </xsl:text><xsl:value-of select="$item3/@val"/>
<xsl:text> </xsl:text><xsl:value-of select="$item2/@val"/><xsl:text>: </xsl:text>
<xsl:value-of select="$item3 &lt;&lt; $item2"/><xsl:text>; </xsl:text>

<xsl:text>nodes: </xsl:text><xsl:value-of select="$item1/@val"/>
<xsl:text> </xsl:text><xsl:value-of select="$item1d/@val"/><xsl:text>: </xsl:text>
<xsl:value-of select="$item1 &lt;&lt; $item1d"/><xsl:text>; </xsl:text>

<xsl:text>nodes: </xsl:text><xsl:value-of select="$item1/@val"/>
<xsl:text> </xsl:text><xsl:value-of select="$item1/@val"/><xsl:text>: </xsl:text>
<xsl:value-of select="$item1 &lt;&lt; $item1"/><xsl:text>; </xsl:text>
</out>
</xsl:template>
</xsl:stylesheet>
