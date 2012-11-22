<xsl:stylesheet version="1.1"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<?spec xpath#axes?>
<!-- test following axis from an attribute. Bug report from Kurt Devlin -->

<xsl:variable name="allpubs"
    select="//pubtag[@list='yes']/@pub[
        not(.=following::pubtag[@list='yes']/@pub)]" />

<xsl:template match="/">
<out>
	<xsl:for-each select="$allpubs">
		<xsl:value-of select="." /><br />;
	</xsl:for-each>
</out>	
</xsl:template>
</xsl:stylesheet>