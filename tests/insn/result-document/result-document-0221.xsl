<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test with xsl:result-document and  @doctype-public and @doctype-system present, @method is xml. -->

   <t:template match="/">
  	   <t:result-document method="xml"
                         doctype-public="-//BOAG//DTD Websites V1.3//EN"
                         doctype-system="out.dtd">
      	  <out>hello</out>
      </t:result-document>
   </t:template>
</t:transform>
