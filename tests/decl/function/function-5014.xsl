<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:sf="http://streamable-functions"
    version="3.0">
    
    <xsl:mode streamable="yes" />
    
    <xsl:template match="/">
        <xsl:copy-of select="doc/sf:filter(section[1])/sf:filter(section)[sf:filter(self::section)]/p[2]" />
    </xsl:template>
    
    <xsl:function name="sf:filter" streamability="filter"  as="node()">
        <xsl:param name="node" as="node()"/>
        <xsl:sequence select="$node[local-name() = 'section']" />
    </xsl:function>
</xsl:stylesheet>