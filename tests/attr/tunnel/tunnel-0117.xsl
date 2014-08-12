<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<!-- Purpose: Simple test with a non-tunnel param (tunnel="false") specified within xsl:apply-templates
  		but template param has tunnel="true" -->

   <t:template match="/">
		    <out>
         <t:apply-templates select="doc">
			         <t:with-param name="par1" select="'foo'"/>
			         <t:with-param name="par2" select="'bar'" tunnel="false"/>
		       </t:apply-templates>
      </out>
	  </t:template>

   <t:template match="doc">
		    <t:param name="par1" select="'xyz'" tunnel="true"/>
		    <t:param name="par2" select="'zyx'" tunnel="true"/>
		    <t:value-of select="$par1"/> and <t:value-of select="$par2"/>
	  </t:template>
</t:transform>
