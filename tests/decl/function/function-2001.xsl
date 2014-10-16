<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" 
    xmlns:op="http://www.w3.org/2005/xpath-operators" 
    xmlns:map="http://www.w3.org/2005/xpath-functions/map" 
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="op math fn map xs">

    <!-- 
      Tests that all functions listed in the XSLT 3.0 specification are implemented (or claim to be available!)
  
      This test uses function-2001.xml, which is generated by function-2001-generate.xsl, which in turn takes the spec 
      of XSLT 3.0 itself as input (in <xt30-base>/specs) 
      
      Note: at the time of this writing, the XSLT 3.0 spec is in LCWD status, new functions or changes in signatures are therefore
      not likely, but can still happen, also, the structure of the XHTML may change. On subsequent changes of the spec, the generator
      should be run again. 
    -->
  
    <xsl:mode on-no-match="shallow-skip" />
  
    <xsl:output indent="yes" />

    <xsl:template match="/">
        <out>
            <xsl:apply-templates />
        </out>
    </xsl:template>
  
   
    <xsl:template match="function">
      <!-- function-available must return false for op: function and true for fn:, map:, math: functions -->
        <xsl:if test="not(function-available(@name, @arity))">
            <missing-function name="{@name}" arity="{@arity}"/>
            <xsl:message expand-text="yes">*** Missing function name={@name} arity={@arity}</xsl:message>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
