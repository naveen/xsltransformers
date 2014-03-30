<!--
	xml2xml

	takes any well-formed XML document and returns a properly
	indented version
	
	if possible, elements are also normalized. for instance,
	"<b></b>" becomes just "<b/>"
-->
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes" /> <!-- here's the trick -->

<xsl:template match="*">
   <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
   </xsl:copy>
</xsl:template>

<xsl:template match="comment()|processing-instruction()">
   <xsl:copy />
</xsl:template>

</xsl:stylesheet>
