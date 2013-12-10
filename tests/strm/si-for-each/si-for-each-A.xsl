<xsl:transform version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
   
  <!-- within xsl:stream, use xsl:for-each -->
   
  <xsl:template name="fe-001" use-when="$RUN">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[@value &lt; 0]">
          <xsl:copy-of select="."/>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- within xsl:stream, use xsl:for-each with numbering -->
   
  <xsl:template name="fe-002">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[@value &lt; 0]">
          <transaction nr="{position()}">
            <xsl:copy-of select="@*"/>
          </transaction>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- within xsl:stream, use xsl:for-each with positional selection -->
   
  <xsl:template name="fe-003">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[position() &lt; 5]">
          <transaction nr="{position()}">
            <xsl:copy-of select="@*"/>
          </transaction>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- xsl:for-each over atomized nodes -->
   
  <xsl:template name="fe-004">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="subsequence(data(account/transaction/@value), 5, 3)">
          <transaction nr="{position()}">
            <xsl:value-of select="."/>
          </transaction>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- crawling selection, inspection body -->
   
  <xsl:template name="fe-005" expand-text="yes">
    <out>
      <xsl:stream href="../docs/books.xml">
        <xsl:for-each select="(//*)[position()=1 to 6]">{position()}:{name()}</xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- crawling selection, inspection body -->
   
  <xsl:template name="fe-006">
    <out>
      <xsl:stream href="../docs/books.xml">
        <xsl:for-each select="//*">
          <xsl:sequence select="count(ancestor-or-self::*)"/>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- within xsl:stream, use parent axis within xsl:for-each -->
   
  <xsl:template name="fe-008">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[position() lt 5]">
          <xsl:sequence select="name(..)"/>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- within xsl:stream, use ancestor axis within xsl:for-each -->
   
  <xsl:template name="fe-009">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="subsequence(account/transaction, 1, 4)">
          <xsl:sequence select="name(ancestor::*[1])"/>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- within xsl:stream, use subsequence() within xsl:for-each/@select -->
   
  <xsl:template name="fe-010">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="subsequence(account/transaction, 1, 4)">
          <xsl:copy-of select="."/>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- within xsl:stream, select attributes within xsl:for-each/@select -->
   
  <xsl:template name="fe-011">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction/@value">
          <xsl:if test=". >= 0">
            <xsl:sequence select="string(.)"/>
          </xsl:if>  
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>
  
  <!-- within xsl:stream, iterate over ancestor axis within xsl:for-each/@select -->
   
  <xsl:template name="fe-012">
    <out xmlns="http://loan.shark.com/">
      <xsl:stream href="../docs/loans.xml">
        <xsl:for-each select="outermost(//*:extra)">
          <xsl:for-each select="ancestor::*">
            <xsl:copy>
              <xsl:copy-of select="@*"/>
            </xsl:copy>
          </xsl:for-each>  
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>       

       
</xsl:transform>
