<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:variable name="coll" select="collection('episodes')/*"/> 

    <xsl:template match="/">
        <html>
            <head>
                <title>Transcripts</title>
            </head>
            <body>
                <xsl:apply-templates select="$coll//body" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="body">
        <br/>
        <h2>
            <xsl:apply-templates select="//teiHeader/descendant::titleStmt/title"/>
        </h2>
        <p>
            <xsl:apply-templates select="descendant::body"/>
        </p>
    </xsl:template>
    <xsl:template match="speaker">
        <strong> <xsl:apply-templates/> </strong>
    </xsl:template>
    <xsl:template match="sp">
        <div class="sp"> <xsl:apply-templates/> </div>
    </xsl:template>
    <xsl:template match="stage">
        <div class="stage"> <xsl:apply-templates/> </div>
    </xsl:template>
</xsl:stylesheet>