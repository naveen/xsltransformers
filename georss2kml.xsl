<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output indent="yes" method="xml"/>

<xsl:template match="rss/channel">
	<kml xmlns="http://earth.google.com/kml/2.0">
		<Document>
			<Style id="myicon">
			<IconStyle>				<scale>0.8</scale>				<Icon>					<href>http://server/icon.png</href>				</Icon>			</IconStyle>			</Style>

			<Folder>				<name><xsl:value-of select="title"/></name>
				<xsl:apply-templates select="item"/>
			</Folder>
		</Document>
	</kml>
</xsl:template>

<xsl:template match="item">
    <Placemark>      <name><xsl:value-of select="title"/></name>      <description>        <xsl:value-of select="description"/>        <xsl:value-of select="link" />      </description>      <Point>        <xsl:choose>          <xsl:when test="georss:where/text()">            <coordinates><xsl:value-of select="substring-after(normalize-space(georss:where/gml:Point/gml:pos), ' ')"/>,<xsl:value-of select="substring-before(normalize-space(georss:where/gml:Point/gml:pos), ' ')"/>,0</coordinates>          </xsl:when>          <xsl:otherwise>            <coordinates>0,0,0</coordinates>          </xsl:otherwise>        </xsl:choose>      </Point>      <styleUrl>#myicon</styleUrl>    </Placemark>
</xsl:template>

</xsl:stylesheet>