<!-- fgcuteam-Mike Time + Date Content Chooser -->
  <xsl:template match="table[@class='ou-time-content-chooser']">
	  <xsl:choose>
		  <xsl:when test="$ou:action = 'pub'">
			  <xsl:variable name="var-id" select="generate-id(.)"/>
			  <script src="https://fgcucdn.fgcu.edu/_resources/js/timechooser.js"/>
				<xsl:for-each select="tbody/tr">
					<xsl:variable name="position" select="position()"/>
					  <xsl:variable name="chooser-precontent">
						   <xsl:apply-templates select="td[4]"  />
					  </xsl:variable>
					  <xsl:variable name="chooser-content" select="replace(serialize($chooser-precontent), '&quot;', '&quot;&quot;')" />
					<div id="timeDisplay{$position}"><xsl:copy-of select="$chooser-precontent"/></div>
				 </xsl:for-each>
					<script>
						$(document).ready(function () {
						<xsl:for-each select="tbody/tr">
							<xsl:variable name="chooser-date" select="ou:textual-content(td[1])" />
					  		<xsl:variable name="chooser-start-time" select="ou:textual-content(td[2])" />
							<xsl:variable name="chooser-end-time" select="ou:textual-content(td[3])" />
							<xsl:variable name="position" select="position()"/>
							displayTimeContent("<xsl:copy-of select="$chooser-date"/>", "<xsl:copy-of select="$chooser-start-time"/>", "<xsl:copy-of select="$chooser-end-time"/>", "#timeDisplay<xsl:copy-of select="$position"/>");
						</xsl:for-each>
						});
					</script>
		  </xsl:when>
		  <xsl:otherwise><strong>Time Content Chooser:</strong> Content to appear on publish</xsl:otherwise>					
	  </xsl:choose> 
  </xsl:template>