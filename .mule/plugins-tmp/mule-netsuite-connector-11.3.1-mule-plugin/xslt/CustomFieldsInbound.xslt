<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="ns0 ns01 ns02 ns03 ns04 ns05 ns06">
    <xsl:output method="xml" omit-xml-declaration="yes" />
    <xsl:preserve-space elements="*" ></xsl:preserve-space>

    <xsl:template match="@* | node() | text()" priority="10">
        <xsl:copy >
            <xsl:apply-templates select="@* | node() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//*[local-name() = 'customFieldList']/*[local-name() = 'customField']" priority="11">
        <xsl:variable name="separator" select="'__'"/>
        <xsl:variable name="typeValue" select="./@*[local-name()='type']" />
        <xsl:variable name="scriptId" select="./@*[local-name()='scriptId']"/>
        <xsl:variable name="internalId" select="./@*[local-name()='internalId']"/>
        <xsl:element name="{concat(substring-after($typeValue, ':'),$separator,$scriptId, $separator, $internalId)}">
            <xsl:apply-templates select="@* | node() | text()" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>