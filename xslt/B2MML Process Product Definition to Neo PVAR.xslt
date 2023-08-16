<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs fn"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:local="urn:local" extension-element-prefixes="msxsl">

	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<NeoPlmProductionVersionApprovalRequest>
			<SourceSystemID>
				<xsl:value-of select="ns:ProcessProductDefinition/ns:ApplicationArea/ns:Sender/ns:LogicalID"/>
			</SourceSystemID>
			<TransactionDateTime>
				<xsl:value-of select="ns:ProcessProductDefinition/ns:ApplicationArea/ns:CreationDateTime"/>
			</TransactionDateTime>
			<TransactionID>
				<xsl:value-of select="ns:ProcessProductDefinition/ns:ApplicationArea/ns:Sender/ns:ReferenceID"/>
			</TransactionID>
			<DestinationSystemID>
				<xsl:value-of select="ns:ProcessProductDefinition/ns:ApplicationArea/ns:Receiver/ns:LogicalID"/>
			</DestinationSystemID>
			<ProductionVersion>
				<ProductionVersionID>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ID"/>
				</ProductionVersionID>
				<Description>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:Description"/>
				</Description>
				<MaterialNumber>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:MaterialSpecification/ns:MaterialDefinitionID"/>
				</MaterialNumber>
				<BillOfMaterialID>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:BillOfMaterialsID"/>
				</BillOfMaterialID>
				<RecipeID>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:BillOfResourcesID"/>
				</RecipeID>
				<PlantID>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:HierarchyScope/ns:EquipmentID"/>
				</PlantID>
				<SiteFacilityUID></SiteFacilityUID>
				<ERPPlantCodeUID></ERPPlantCodeUID>
				<LocalMaterialSpecificationUID></LocalMaterialSpecificationUID>

				<xsl:for-each select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:Parameter">
					<xsl:if test="ns:ID='MinProductionQuantity'">
						<MinProductionQuantity>
							<xsl:value-of select="ns:Value/ns:ValueString"/>
						</MinProductionQuantity>
					</xsl:if>
					<xsl:if test="ns:ID='MaxProductionQuantity'">
						<MaxProductionQuantity>
							<xsl:value-of select="ns:Value/ns:ValueString"/>
						</MaxProductionQuantity>
					</xsl:if>
					<xsl:if test="ns:ID='LongText'">
						<LongText>
							<xsl:value-of select="ns:Value/ns:ValueString"/>
						</LongText>
					</xsl:if>
				</xsl:for-each>

			</ProductionVersion>
		</NeoPlmProductionVersionApprovalRequest>
	</xsl:template>
</xsl:stylesheet>