<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:cycml="http://www.opencyc.org/xml/cycML/" xmlns:pv="http://www.opencyc.org/xml/proofView/">

  <xsl:variable name="header">
    <head>
      <link rel="stylesheet" href="ProofView.css" type="text/css"/>
      <script type="text/javascript">
<![CDATA[
    function toggleSubentryDisplay(id)
    {
    var tg = window.event.srcElement;
    var subentriesElt = document.getElementById(id);
        if (subentriesElt.className=="subentries hidden")
        {
            subentriesElt.className = "subentries shown";
            tg.className = "toggle open";
            }
        else {
            subentriesElt.className = "subentries hidden";
            tg.className = "toggle closed";
            }
    }
]]>
      </script>  
    </head>  
  </xsl:variable>

  <!-- Root -->
  <xsl:template match="/pv:proof-view">
    <html>
      <xsl:copy-of select="$header"/>
      <body class="showcycl">
        <!-- Display the sub-entries of the root entry -->
        <xsl:apply-templates select="pv:proof-view-entry[@object-type='root']/pv:sub-entries"/>
      </body>
    </html>
  </xsl:template>

  <!-- query sentence and answer -->
  <xsl:template match="pv:proof-view-entry[@object-type='query-sentence']">
    <div class="query">
      <div class="pf-paraphrase">
        <xsl:value-of select="cycml:paraphrase" disable-output-escaping="yes"/>
      </div>   
      <xsl:call-template name="entryRest"/>
    </div>
    <xsl:for-each select="pv:sub-entries/pv:proof-view-entry">
      <div class="answer">
        <span class="pf-label">Answer: </span>
        <div class="pf-paraphrase">
          <xsl:value-of select="cycml:paraphrase" disable-output-escaping="yes"/>
        </div>   
        <xsl:call-template name="entryRest"/>
      </div>
    </xsl:for-each>
  </xsl:template>

  <!-- Section root -->
  <xsl:template match="pv:proof-view-entry[@object-type='section-root']">
    <div class="section">
      <xsl:call-template name="entryLabel"/>
      <xsl:apply-templates select="pv:sub-entries"/>
    </div>
  </xsl:template>

  <!-- Default proof-view entry -->
  <xsl:template match="pv:proof-view-entry">
    <div class="entry" id="entry{@id}">
      <xsl:call-template name="entryLabel"/>
      <xsl:call-template name="entryFirstLine"/>
      <xsl:call-template name="entryRest"/>
      <xsl:variable name="display">
        <xsl:choose>
          <xsl:when test="@expand-initially='true'">shown</xsl:when>
          <xsl:otherwise>hidden</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <div class="subentries {$display}" id="subentries{@id}">
        <xsl:apply-templates select="pv:sub-entries"/>
      </div>
    </div>
  </xsl:template>
  
  <!-- Display the label of an entry. -->
  <xsl:template name="entryLabel">
      <div class="pf-label">
        <xsl:value-of select="@label" disable-output-escaping="yes"/>
      </div>
  </xsl:template>
  
  <!-- Display the first line of a proof-view entry. -->
  <xsl:template name="entryFirstLine">
    <div class="paraphrase container">
      <xsl:if test="pv:sub-entries">
        <xsl:variable name="state">
          <xsl:choose>
            <xsl:when test="@expand-initially='true'">open</xsl:when>
            <xsl:otherwise>closed</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <div class="toggle {$state}" onclick="toggleSubentryDisplay('subentries{@id}');"/>
      </xsl:if>
      <div class="pf-paraphrase">
        <xsl:value-of select="cycml:paraphrase" disable-output-escaping="yes"/>
      </div>   
    </div>    
  </xsl:template>
  
  <!-- Display the rest of a proof-view entry. -->
  <xsl:template name="entryRest">
    <div class="pf-object">
      <xsl:value-of select="pv:cycl"/>
    </div> 
  </xsl:template>
</xsl:stylesheet>


