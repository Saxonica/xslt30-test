<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs err">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>

    
    <!-- Test of xsl:stream with xsl:attribute -->
    
    <xsl:template name="s-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM/PRICE"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered with a motionless predicate -->
    
    <xsl:template name="s-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM[@CAT='P']/PRICE"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered with a positional predicate -->
    
    <xsl:template name="s-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM[position() lt 4]/PRICE"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered with a positional predicate -->
    
    <xsl:template name="s-006" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/*[position() lt 4]/PRICE"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered with a positional predicate -->
    
    <xsl:template name="s-007" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="/BOOKLIST/BOOKS/*:ITEM[position() lt 4]/PRICE"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered using data() to make it streamable -->
    
    <xsl:template name="s-008" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM/PAGES/data()[. &lt; 1000][. &gt; 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered using text() to make it streamable -->
    
    <xsl:template name="s-009" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="BOOKLIST/BOOKS/ITEM/PAGES/text()[. &lt; 1000][. &gt; 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered using number() to make it streamable -->
    
    <xsl:template name="s-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="/BOOKLIST/BOOKS/ITEM/PAGES/number()[. &lt; 1000][. &gt; 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, selecting nothing  -->
    
    <xsl:template name="s-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="ITEM/PAGES"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:attribute selecting both streamed nodes and literals -->
    
    <xsl:template name="s-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM/PAGES/number(), 31, 32"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:attribute selecting both streamed nodes and literals while also filtering -->
    
    <xsl:template name="s-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="tail(./BOOKLIST/BOOKS/ITEM/PAGES)/number(), 31, 32"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
    <!-- Test of xsl:stream with xsl:attribute of a computed value -->
    
    <xsl:template name="s-015" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="for $d in data(outermost(//DIMENSIONS))
                                return let $x := tokenize($d, '\s')!number() 
                                       return round($x[1]*$x[2]*$x[3], 3)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute of a computed value -->
    
    <xsl:template name="s-016" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:attribute name="a" select="account/transaction[position() lt 5]/(@value*2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute, filtered using copy-of() to make it streamable -->
    
    <xsl:template name="s-017" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM/PAGES/copy-of()[. &lt; 1000][. &gt; 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute applied to an attribute -->
    
    <xsl:template name="s-018" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:attribute name="a" select="account/transaction[position() lt 5]/@value"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute over attribute values, filtered -->
    
    <xsl:template name="s-019" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:attribute name="a" select="account/transaction/@value[xs:decimal(.) lt -8.00]"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- Test of xsl:stream with xsl:attribute over attribute values, computed -->
    
    <xsl:template name="s-020" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:attribute name="a" select="account/transaction[position() mod 10 = 1]/abs(@value)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute of a conditional value -->
    
    <xsl:template name="s-021" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:attribute name="a" select="account/transaction/
                (if (xs:date(@date) lt xs:date('2020-01-01')) then +@value else (@value+1))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute with a loop used to compute each item -->
    
    <xsl:template name="s-022" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="BOOKLIST/BOOKS/ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream calling xsl:attribute using //x/y -->
    <!-- Saxon makes this streamable by rewriting //X/Y as .//Y[parent::X] -->
    
    <xsl:template name="s-023" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="//ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: grounded operand, selects nothing -->
    
    <xsl:template name="s-040" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="data(//NOTHING)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: striding operand, selects nothing -->
    
    <xsl:template name="s-041" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="/BOOKLIST/BOOKS/MAGAZINE" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: crawling operand, selects nothing -->
    
    <xsl:template name="s-042" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="//MAGAZINE" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: climbing operand, selects nothing -->
    
    <xsl:template name="s-043" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="//PRICE/../@nothing" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: separator is consuming -->
    
    <xsl:template name="s-044" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="1 to 10" separator="{substring(head(//AUTHOR), 1, 1)}"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: separator is consuming (and unused) -->
    
    <xsl:template name="s-045" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="(1 to 10)[current-date() lt xs:date('1999-11-16')]" separator="{substring(head(//AUTHOR), 1, 1)}"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: complex content -->
    
    <xsl:template name="s-046" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a">
            <xsl:for-each select="/BOOKLIST/BOOKS/ITEM">
              <xsl:text>[</xsl:text>
              <xsl:value-of select="PRICE"/>
              <xsl:text>]</xsl:text>
            </xsl:for-each>
          </xsl:attribute>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: name is consuming  -->
    
    <xsl:template name="s-047" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="{translate(head(//AUTHOR), ' ', '_')}">value</xsl:attribute>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming xsl:attribute: namespace is consuming  -->
    
    <xsl:template name="s-048" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" namespace="http://{lower-case(translate(head(//AUTHOR), ' ', '_'))}.com/">value</xsl:attribute>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute/@on-empty (not empty) -->
    
    <xsl:template name="s-050" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM/PRICE" on-empty="()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute/@on-empty (empty) -->
    
    <xsl:template name="s-051" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="./BOOKLIST/BOOKS/ITEM/PRICETAG" on-empty="()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute/@on-empty, with on-empty consuming (not empty) -->
    
    <xsl:template name="s-052" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="1 to 10" on-empty="head(//@*)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute/@on-empty, with on-empty consuming (empty) -->
    
    <xsl:template name="s-053" use-when="$RUN">
      <xsl:param name="s" select="20"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="$s to 10" on-empty="head(//@*)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute/@on-empty (empty, returns a new attribute) -->
    
    <xsl:template name="s-054" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <xsl:for-each select="BOOKLIST/BOOKS">
          <out>
            <xsl:attribute name="a" select="ITEM/PRICETAG" on-empty="@OWNER"/>
          </out>
        </xsl:for-each>  
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute/@on-empty (empty, type error, returns two attributes) -->
    
    <xsl:template name="s-055" use-when="$RUN">
      <xsl:param name="n" select="2"/>
      <xsl:variable name="atts" as="attribute()*">
        <xsl:for-each select="1 to $n">
          <xsl:attribute name="n{.}" select="."/>
        </xsl:for-each>
      </xsl:variable>
      <xsl:stream href="../docs/books.xml">
        <xsl:for-each select="BOOKLIST/BOOKS">
          <out>
            <xsl:attribute name="a" select="ITEM/PRICETAG" on-empty="$atts"/>
          </out>
        </xsl:for-each>  
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with xsl:attribute/@on-empty (empty, type error, returns two attributes, recovered) -->
    
    <xsl:template name="s-056" use-when="$RUN">
      <xsl:param name="n" select="2"/>
      <xsl:variable name="atts" as="attribute()*">
        <xsl:for-each select="1 to $n">
          <xsl:attribute name="n{.}" select="."/>
        </xsl:for-each>
      </xsl:variable>
      <xsl:stream href="../docs/books.xml">
        <xsl:for-each select="BOOKLIST/BOOKS">
          <out>
            <xsl:try>
              <xsl:attribute name="a" select="ITEM/PRICETAG" on-empty="$atts"/>
              <xsl:catch errors="*:XTTE3320">
                <xsl:attribute name="fallback">OK</xsl:attribute>
              </xsl:catch>
            </xsl:try>  
          </out>
        </xsl:for-each>  
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute content cannot contain a function item - error -->
    
    <xsl:template name="s-057" use-when="$RUN">
      <xsl:param name="s" select="false#0"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a" select="1, 2, head(//text()), $s"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute content cannot contain a function item - error - recovered -->
    
    <xsl:template name="s-058" use-when="$RUN">
      <xsl:param name="s" select="false#0"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:try>
            <xsl:attribute name="a" select="1, 2, head(//text()), $s"/>
            <xsl:catch errors="*:FOTY0013">caught</xsl:catch>
          </xsl:try>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute invalid name - error -->
    
    <xsl:template name="s-059" use-when="$RUN">
      <xsl:param name="s" select="'#'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="{$s}" select="1, 2, head(//text())"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute invalid name - error - recovered -->
    
    <xsl:template name="s-060" use-when="$RUN">
      <xsl:param name="s" select="'#'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:try>
            <xsl:attribute name="{$s}" select="1, 2, head(//text())"/>
            <xsl:catch errors="*:XTDE0850">caught</xsl:catch>
          </xsl:try>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute invalid name xmlns - error -->
    
    <xsl:template name="s-061" use-when="$RUN">
      <xsl:param name="s" select="'xmlns'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="{$s}" select="1, 2, head(//text())"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute invalid name xmlns - error - recovered -->
    
    <xsl:template name="s-062" use-when="$RUN">
      <xsl:param name="s" select="'xmlns'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:try>
            <xsl:attribute name="{$s}" select="1, 2, head(//text())"/>
            <xsl:catch errors="*:XTDE0855">caught</xsl:catch>
          </xsl:try>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute prefix not declared - error -->
    
    <xsl:template name="s-063" use-when="$RUN">
      <xsl:param name="s" select="'a:b'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="{$s}" select="1, 2, head(//text())"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute prefix not declared - error - recovered -->
    
    <xsl:template name="s-064" use-when="$RUN">
      <xsl:param name="s" select="'a:b'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:try>
            <xsl:attribute name="{$s}" select="1, 2, head(//text())"/>
            <xsl:catch errors="*:XTDE0860">caught</xsl:catch>
          </xsl:try>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute disallowed namespace - error -->
    
    <xsl:template name="s-065" use-when="$RUN">
      <xsl:param name="s" select="'http://www.w3.org/2000/xmlns/'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:attribute name="a:b" namespace="{$s}" select="1, 2, head(//text())"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- xsl:attribute disallowed namespace - error - recovered -->
    
    <xsl:template name="s-066" use-when="$RUN">
      <xsl:param name="s" select="'http://www.w3.org/2000/xmlns/'"/>
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:try>
            <xsl:attribute name="a:b" namespace="{$s}" select="1, 2, head(//text())"/>
            <xsl:catch errors="*:XTDE0865">caught</xsl:catch>
          </xsl:try>
        </out>
      </xsl:stream>
    </xsl:template>
    

                                              
    
</xsl:stylesheet>