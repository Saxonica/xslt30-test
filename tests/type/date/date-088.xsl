<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

  <?spec fo#casting-to-datetimes?>
 <!-- PURPOSE: test casting dates to GDay and friends -->

  
  <xsl:param name="gd" select="xs:gDay('---15')"/>
  <xsl:param name="gmd" select="xs:gMonthDay('--02-15')"/>  
  <xsl:param name="gm" select="xs:gMonth('--02')"/>  
  <xsl:param name="gym" select="xs:gYearMonth('2001-02')"/>   
  <xsl:param name="gy" select="xs:gYear('2001')"/>        

  <xsl:template match="/">
     <out>
     <true>
      <a><xsl:value-of select="xs:gDay(xs:date('2001-02-15')) eq $gd"/></a> 
      <a><xsl:value-of select="xs:gMonthDay(xs:date('2001-02-15')) eq $gmd"/></a> 
      <a><xsl:value-of select="xs:gMonth(xs:date('2001-02-15')) eq $gm"/></a> 
      <a><xsl:value-of select="xs:gYearMonth(xs:date('2001-02-15')) eq $gym"/></a> 
      <a><xsl:value-of select="xs:gYear(xs:date('2001-02-15')) eq $gy"/></a> 
     </true>
     <false>
      <a><xsl:value-of select="xs:gDay(xs:date('2002-03-16')) eq $gd"/></a> 
      <a><xsl:value-of select="xs:gMonthDay(xs:date('2002-03-16')) eq $gmd"/></a> 
      <a><xsl:value-of select="xs:gMonth(xs:date('2002-03-16')) eq $gm"/></a> 
      <a><xsl:value-of select="xs:gYearMonth(xs:date('2002-03-16')) eq $gym"/></a> 
      <a><xsl:value-of select="xs:gYear(xs:date('2002-03-16')) eq $gy"/></a>  
     </false>                                        
     </out>     
  </xsl:template>

</xsl:stylesheet>
