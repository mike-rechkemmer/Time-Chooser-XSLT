<!-- fgcuteam-Mike Time + Date Content Chooser -->
  <xsl:template match="table[@class='ou-time-content-chooser']">
	  <xsl:choose>
		  <xsl:when test="$ou:action = 'pub'">
			  <xsl:variable name="var-id" select="generate-id(.)"/>
				<xsl:for-each select="tbody/tr">
                    <xsl:variable name="chooser-date" select="ou:textual-content(td[1])" />
                    <xsl:variable name="chooser-start-time" select="ou:textual-content(td[2])" />
                    <xsl:variable name="chooser-end-time" select="ou:textual-content(td[3])" />
                    <xsl:variable name="chooser-precontent">
                        <xsl:apply-templates select="td[4]"  />
                    </xsl:variable>
                    <xsl:variable name="chooser-content" select="replace(serialize($chooser-precontent), '&quot;', '&quot;&quot;')" />
					<!-- C# Method of Calling Time, only works on publish -->
                    <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>									 									
                        Response.Write(OUC.WnlDisplayMethods.displayTimeContent(@"<xsl:value-of select="$chooser-date"/>", @"<xsl:value-of select="$chooser-start-time"/>",@"<xsl:value-of select="$chooser-end-time"/>", System.Web.HttpUtility.HtmlDecode(@"<xsl:apply-templates select="$chooser-content"/>")));
                    <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
                    <!-- We use a variable with @ for the content to avoid a one-liner string break by new line character or by quote, etc in the C# string variable. 
                    Also decode the serilize from the XSL replace(serialize(... -->
				 </xsl:for-each>
		  </xsl:when>
		  <xsl:otherwise><strong>Time Content Chooser:</strong> Content to appear on publish</xsl:otherwise>					
	  </xsl:choose> 
  </xsl:template>