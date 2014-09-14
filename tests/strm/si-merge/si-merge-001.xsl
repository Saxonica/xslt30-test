<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <xsl:template name="main">
        
        <prices>
            <xsl:merge>
                <xsl:merge-source
                    name="gold"
                    streamable="yes"
                    for-each-stream="'../docs/goldPrice.xml'" 
                	select="dataset/data/datum">
                        <xsl:merge-key select="xs:date(datum[1])" order="descending"/>
                </xsl:merge-source>
                <xsl:merge-source
                    name="uranium" 
                	streamable="yes"
                    for-each-stream="'../docs/uraniumPrice.xml'" 
                	select="dataset/data/datum">
                        <xsl:merge-key select="xs:date(datum[1])" order="descending"/>
                </xsl:merge-source>
                <xsl:merge-action>
                    <xsl:if test="count(current-merge-group()) = 2">
                       <price date="{current-merge-key()}"
                              gold="{current-merge-group('gold')/datum[2]}"
                              uranium="{current-merge-group('uranium')/datum[2]}"/>
                    </xsl:if>
                </xsl:merge-action>
            </xsl:merge>
        </prices>
        
    </xsl:template>
</xsl:stylesheet>