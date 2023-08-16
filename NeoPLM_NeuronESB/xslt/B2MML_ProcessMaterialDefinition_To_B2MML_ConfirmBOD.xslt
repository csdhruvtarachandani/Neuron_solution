<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:variable name="var1_initial" select="." />
		<ConfirmBOD xmlns="http://www.mesa.org/xml/B2MML-V0600" xmlns:Extended="http://www.mesa.org/xml/B2MML-V0600-AllExtensions">
			<ApplicationArea>
				<Sender>
					<xsl:for-each select="ns0:ProcessMaterialDefinition/ns0:ApplicationArea/ns0:Receiver/ns0:LogicalID">
						<xsl:variable name="var2_cur" select="." />
						<LogicalID>
							<xsl:copy-of select="@node()" />
							<xsl:copy-of select="node()" />
						</LogicalID>
					</xsl:for-each>
				</Sender>
				<Receiver>
					<xsl:for-each select="ns0:ProcessMaterialDefinition/ns0:ApplicationArea/ns0:Sender/ns0:LogicalID">
						<xsl:variable name="var3_cur" select="." />
						<LogicalID>
							<xsl:copy-of select="@node()" />
							<xsl:copy-of select="node()" />
						</LogicalID>
					</xsl:for-each>
				</Receiver>
				<xsl:for-each select="ns0:ProcessMaterialDefinition">
					<xsl:variable name="var4_cur" select="." />
					<CreationDateTime>
						<xsl:copy-of select="ns0:ApplicationArea/ns0:CreationDateTime/@node()" />
						<xsl:copy-of select="ns0:ApplicationArea/ns0:CreationDateTime/node()" />
					</CreationDateTime>
				</xsl:for-each>
			</ApplicationArea>
			<DataArea>
				<Confirm>
					<xsl:for-each select="ns0:ProcessMaterialDefinition">
						<xsl:variable name="var5_cur" select="." />
						<OriginalApplicationArea>
							<xsl:copy-of select="ns0:ApplicationArea/@node()" />
							<xsl:copy-of select="ns0:ApplicationArea/node()" />
						</OriginalApplicationArea>
					</xsl:for-each>
					<ResponseCriteria>
						<ResponseExpression>
							<xsl:attribute name="actionCode" namespace="">Accepted</xsl:attribute>
						</ResponseExpression>
					</ResponseCriteria>
				</Confirm>
				<BOD>
					<xsl:for-each select="ns0:ProcessMaterialDefinition">
						<xsl:variable name="var6_cur" select="." />
						<OriginalApplicationArea>
							<xsl:copy-of select="ns0:ApplicationArea/@node()" />
							<xsl:copy-of select="ns0:ApplicationArea/node()" />
						</OriginalApplicationArea>
					</xsl:for-each>
				</BOD>
			</DataArea>
		</ConfirmBOD>
	</xsl:template>
</xsl:stylesheet>