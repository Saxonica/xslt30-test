<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns="http://www.w3.org/1999/xhtml" xmlns:t="http://www.w3.org/1999/XSL/Transform"
   version="3.0">

   <t:output method="html" indent="no"/>

   <!-- Purpose: Serializing a map fails with HTML output method -->

   <t:template name="t:initial-template">
      <t:variable name="maps" as="map(*)*">
         <t:for-each select="1 to 5">
            <t:map>
               <t:map-entry key="'index'">
                  <t:sequence select="."/>
               </t:map-entry>
               <t:map-entry key="'value'">
                  <t:sequence select=".*."/>
               </t:map-entry>
            </t:map>
         </t:for-each>
      </t:variable>
      <html>
         <head>
            <title>This isn't going to work</title>
         </head>
         <body>
            <t:sequence select="$maps"/>
         </body>
      </html>
   </t:template>
</t:transform>
