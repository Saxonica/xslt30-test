<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:template name="main">
    <xsl:result-document href="merged-events.xml">
        <events>
            <xsl:merge>
                <xsl:merge-action>
                    <xsl:apply-templates select="current-group()" />
                </xsl:merge-action>
            </xsl:merge>
        </events>
    </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>