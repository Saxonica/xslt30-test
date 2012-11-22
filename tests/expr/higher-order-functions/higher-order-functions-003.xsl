<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local/"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <!-- inline function literal, imported used-defined function -->
    
    <xsl:import href="hof-001.xsl"/>
    
    <xsl:template name="main">
        <out><xsl:value-of select="let $f := local:f#1 return $f(4)"/></out>
    </xsl:template>
    
</xsl:stylesheet>