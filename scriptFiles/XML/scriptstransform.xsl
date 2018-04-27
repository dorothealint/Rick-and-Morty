<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    
    <xsl:variable name="documents" select="collection('episodes')"/>
    
    <xsl:template match="/">
        <html>
            <h2>Table of Contents</h2>
            <xsl:apply-templates select="$documents/*" mode="toc"/>
            <xsl:apply-templates select="$documents/*"/>
        </html>
    </xsl:template>
    <xsl:template match="document" mode="toc">
        <div id="NP{descendant::pubDate}">
            <button class="button" id="opt0">
                <xsl:apply-templates select="descendant::titleStmt/title[1]" mode="toc"/>
            </button>
        </div>
    </xsl:template>
    <xsl:template match="document">
        <div class="main" id="aboutopt0" style="background-color: black;">
            <xsl:apply-templates select="descendant::body"/>
        </div>
    </xsl:template>
    <xsl:template match="titleStmt">
        <xsl:apply-templates select="descendant::teiHeader/fileDesc/sourceDesc/bibl/title"/>
        <xsl:apply-templates select="descendant::teiHeader/fileDesc/titleStmt/author"/>
        <xsl:apply-templates select="descendant::teiHeader/fileDesc/titleStmt/editor"/>
        <xsl:apply-templates select="descendant::teiHeader/fileDesc/sourceDesc/bibl/date"/>
    </xsl:template>
    <xsl:template match="teiHeader/fileDesc/sourceDesc/bibl/title">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="teiHeader/fileDesc/titleStmt/author">
        <p>Author(s): <xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="teiHeader/fileDesc/titleStmt/editor">
        <p>Transcriber/Editor(s): <xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="teiHeader/fileDesc/sourceDesc/bibl/date">
        <p>Date Aired: <xsl:apply-templates/></p>
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