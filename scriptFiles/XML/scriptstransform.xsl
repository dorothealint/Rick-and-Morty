<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    
    <xsl:variable name="transcripts" select="collection('episodes')"/>
    
    <xsl:template match="/">
        <html>
            <h2>Rick and Morty Transcripts</h2>
          <xsl:apply-templates select="$transcripts//teiHeader" mode="toc"/>

            <xsl:apply-templates select="$transcripts/*"/>
            
        </html>
    </xsl:template>
    <xsl:template match="teiHeader" mode="toc">
        <div id="EN{tokenize(base-uri(), '/')[last()]}">
            <button class="button" id="opt{substring-before(tokenize(base-uri(), '/')[last()], '.')}">
                <xsl:apply-templates select="descendant::fileDesc/sourceDesc/bibl/title" mode="toc"/>
            </button>
        </div>
    </xsl:template>
    <xsl:template match="TEI">
        <div class="main" id="aboutopt{substring-before(tokenize(base-uri(), '/')[last()], '.')}">
            <xsl:apply-templates select="descendant::teiHeader"/>
            <xsl:apply-templates select="descendant::text"/>
        </div>
    </xsl:template>
   
    <xsl:template match="teiHeader">
        <h2>
            <xsl:apply-templates select="fileDesc/sourceDesc/bibl/title"/>
        </h2>
        <h3>Author(s): <xsl:apply-templates select="fileDesc/titleStmt/author"/></h3>
        <h3>Transcriber/Editor(s): <xsl:apply-templates select="fileDesc/titleStmt/editor"/></h3>
        <h3>Date Aired: <xsl:apply-templates select="fileDesc/sourceDesc/bibl/date/@when"/></h3>
        <h3>Reference Name(s): <xsl:apply-templates select="parent::TEI/text/body/trailer/name"/></h3>
        <h3>Reference Date(s): <xsl:apply-templates select="parent::TEI/text/body/trailer/date"/></h3>
    </xsl:template>
    <xsl:template match="stage">
        <p span="stage">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="sp">
        <p span="sp">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="speaker">
        <span class="speaker">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="p">
        <span class="speech">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>