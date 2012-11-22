<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE1555?>

  <xsl:import-schema namespace="http://err1555b.com/">
    <xs:schema targetNamespace="http://err1555b.com/">
      <xs:element name="e">
        <xs:complexType>
         <xs:sequence maxOccurs="unbounded">
          <xs:element name="f" form="qualified">
            <xs:complexType>
              <xs:sequence/>
              <xs:attribute name="id" type="xs:int" use="optional"/>
              <xs:attribute name="idref" type="xs:int" use="optional"/>
            </xs:complexType>
          </xs:element>
         </xs:sequence> 
        </xs:complexType>
        <xs:unique name="u1" xmlns:b="http://err1555b.com/">
          <xs:selector xpath="b:f"/>
          <xs:field xpath="@id"/>
        </xs:unique>
      </xs:element>
    </xs:schema>
  </xsl:import-schema>


  <xsl:template name="main">
    <xsl:result-document validation="strict">
      <e xmlns="http://err1555b.com/"><f id="456"/><f id="456"/></e>
    </xsl:result-document>
  </xsl:template>
  




</xsl:stylesheet>