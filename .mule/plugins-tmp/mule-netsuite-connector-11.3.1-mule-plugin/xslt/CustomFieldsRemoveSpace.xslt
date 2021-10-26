<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"  />
    <xsl:template match="@* | node()" priority="10">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*">
        <xsl:copy />
    </xsl:template>
</xsl:stylesheet>