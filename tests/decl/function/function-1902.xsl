<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" 
    xmlns:op="http://www.w3.org/2005/xpath-operators" 
    xmlns:map="http://www.w3.org/2005/xpath-functions/map" 
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="op math fn map xs">

    <!-- 
      Tests that all functions listed in the F+O specification are implemented (or claim to be available!) in XSLT 2.0
  
      This test uses function-1902.xml, which is generated by function-1902-generate.xsl, which in turn takes the spec 
      of F&O 1.0 itself as input (in <xt30-base>/specs) 
      
      Note: since this is only about XSLT 2.0 functions which are in the F&O 1.0 spec, it is unlikely that this needs 
      to be updated regularly, as that spec has been a stable REC for some years now.
    -->
  
    <xsl:output indent="yes" />

    <xsl:template match="/">
        <out>
            <xsl:apply-templates />
        </out>
    </xsl:template>
    
    <xsl:template match="text()" />
    
    <xsl:template match="function">
        <!-- function-available must return false for op: function and true for fn: functions -->
        <xsl:choose>
            <xsl:when test="if(@name/starts-with(., 'op')) then function-available(@name, @arity) else not(function-available(@name, @arity))">
                <correctly-missing-function name="{@name}" arity="{@arity}"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message expand-text="yes">*** This function should NOT be available in XSLT 2.0 processors: name={@name} arity={@arity}</xsl:message>
                <incorrectly-available-function name="{@name}" arity="{@arity}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
