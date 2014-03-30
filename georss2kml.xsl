<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output indent="yes" method="xml"/>

<xsl:template match="rss/channel">
	<kml xmlns="http://earth.google.com/kml/2.0">
		<Document>
			<Style id="myicon">
			<IconStyle>

			<Folder>
				<xsl:apply-templates select="item"/>
			</Folder>
		</Document>
	</kml>
</xsl:template>

<xsl:template match="item">
    <Placemark>
</xsl:template>

</xsl:stylesheet>