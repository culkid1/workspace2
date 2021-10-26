<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" />
    <xsl:preserve-space elements="*" ></xsl:preserve-space>

    <xsl:variable name="separator" select="'__'"/>

    <xsl:namespace-alias stylesheet-prefix="platformCore" result-prefix="urn:core_2020_2.platform.webservices.netsuite.com" />

    <xsl:template match="@* | node() | text()" priority="10">
        <xsl:copy>
            <xsl:apply-templates select="@* | node() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//*[local-name()='customFieldList']/*" priority="11">
        <xsl:variable name="typeValue" select="substring-before(local-name(.),$separator)"/>
        <xsl:variable name="scriptId" select="substring-before(substring-after(local-name(.),$separator),$separator)"/>
        <xsl:variable name="internalId" select="substring-after(substring-after(local-name(.),$separator),$separator)"/>
        <xsl:element name="customField" namespace="urn:core_2020_2.platform.webservices.netsuite.com"
                     xml:space="default"
                     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                     xmlns:platformCore="urn:core_2020_2.platform.webservices.netsuite.com" >
                    <xsl:attribute name="xsi:type"><xsl:value-of select="concat('platformCore:',$typeValue)"/></xsl:attribute>
                    <xsl:attribute name="scriptId"><xsl:value-of select="$scriptId" /></xsl:attribute>
                    <xsl:attribute name="internalId">
                        <xsl:value-of select="$internalId" /></xsl:attribute>
                <xsl:apply-templates select="@* | ./* | text()" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>