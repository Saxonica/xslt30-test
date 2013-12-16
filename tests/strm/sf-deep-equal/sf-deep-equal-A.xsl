<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>

    
    <!-- Test of xsl:stream with deep-equal() - atomized -->
    
    <xsl:template name="s-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal((./BOOKLIST/BOOKS/ITEM/PRICE/xs:decimal(.)), (4.95, 6.58, 4.95, 4.95, 16.47, 16.47))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal() - atomized -->
    
    <xsl:template name="s-003a" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal((./BOOKLIST/BOOKS/ITEM/PRICE/xs:decimal(.)), (4.95, 6.58, 4.95, 4.95, 16.47))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal() - atomized -->
    
    <xsl:template name="s-003b" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal((./BOOKLIST/BOOKS/ITEM/PRICE/xs:decimal(.)), (4.95, 6.58, 4.95, 4.95, 16.47, 16.47, 8.39))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal() - atomized -->
    
    <xsl:template name="s-003c" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal((4.95, 6.58, 4.95, 4.95, 16.47, 16.47), (./BOOKLIST/BOOKS/ITEM/PRICE/xs:decimal(.)))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal() - atomized -->
    
    <xsl:template name="s-003d" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal((4.95, 6.58, 4.95, 4.95, 16.47), (./BOOKLIST/BOOKS/ITEM/PRICE/xs:decimal(.)))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal() - atomized -->
    
    <xsl:template name="s-003e" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal((4.95, 6.58, 4.95, 4.95, 16.47, 16.47, 8.39), (./BOOKLIST/BOOKS/ITEM/PRICE/xs:decimal(.)))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal(), filtered with a motionless predicate - atomized -->
    
    <xsl:template name="s-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal(./BOOKLIST/BOOKS/ITEM[@CAT='P']/PRICE/xs:decimal(.), (6.58, 4.95, 4.95, 16.47))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal(), filtered with a positional predicate -->
    
    <xsl:template name="s-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal(./BOOKLIST/BOOKS/ITEM[position() lt 4]/PRICE/xs:decimal(.), (4.95, 6.58, 4.95))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal(), filtered with a positional predicate -->
    
    <xsl:template name="s-006" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="deep-equal(./BOOKLIST/BOOKS/*[position() lt 4]/PRICE/xs:decimal(.), (4.95, 6.58, 4.95))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal(), grounded element nodes -->
    
    <xsl:template name="s-007" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE>16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal(./BOOKLIST/BOOKS/ITEM/PRICE/copy-of(.), $expected)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-007a" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE>16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE/copy-of(.))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-007b" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE>16.48</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE/copy-of(.))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-007c" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE/copy-of(.))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-007d" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE cut="true">16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE/copy-of(.))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal(), non-grounded element nodes -->
    
    <xsl:template name="s-008" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE>16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal(./BOOKLIST/BOOKS/ITEM/PRICE, $expected)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-008a" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE>16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-008b" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE>16.48</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-008c" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="s-008d" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <PRICE>4.95</PRICE>
            <PRICE>6.58</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>4.95</PRICE>
            <PRICE>16.47</PRICE>
            <PRICE cut="true">16.47</PRICE>
          </xsl:variable>  
          <xsl:sequence select="deep-equal($expected, ./BOOKLIST/BOOKS/ITEM/PRICE)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal(), filtered using text() to make it streamable -->
    
    <xsl:template name="s-009" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:variable name="expected" as="element()*">
            <N>352</N>
            <N>430</N>
            <N>480</N>
            <N>528</N>
            <N>346</N>
            <N cut="true">384</N>
          </xsl:variable>  
          <xsl:value-of select="deep-equal(./BOOKLIST/BOOKS/ITEM/PAGES/text()[. &lt; 1000][. &gt; 0], $expected/text())"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal(), selecting nothing and returning false -->
    
    <xsl:template name="s-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="deep-equal(ITEM/PAGES, 42)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of deep-equal() selecting both streamed nodes and literals -->
    
    <xsl:template name="s-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="deep-equal((./BOOKLIST/BOOKS/ITEM/PAGES/number(), 31, 32), (352, 430, 480, 528, 346, 384, 31, 32))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with deep-equal() applied to an attribute -->
    
    <xsl:template name="s-018" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="deep-equal(account/transaction/@value, doc('../docs/big-transactions.xml')/account/transaction/@value)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming deep-equal(): grounded operand, selects nothing -->
    
    <xsl:template name="s-040" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="deep-equal(data(//NOTHING), ())" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming deep-equal(): striding operand, selects nothing -->
    
    <xsl:template name="s-041" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="deep-equal(/BOOKLIST/BOOKS/MAGAZINE, ())" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming deep-equal(): crawling operand, selects nothing -->
    
    <xsl:template name="s-042" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="deep-equal(//MAGAZINE, ())" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming deep-equal(): climbing operand, selects nothing -->
    
    <xsl:template name="s-043" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="deep-equal(//PRICE/../@nothing, ())" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
                                                
    
</xsl:stylesheet>