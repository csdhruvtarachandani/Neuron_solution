<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://Pfizer.com/SAP-Manufacturing">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<ProductionVersionApprovalMessage>
			<ProductionVersion>
				<ProductionVersionNumber>
					<xsl:value-of select="ProcessProductDefinition/DataArea/ProductDefinition/ID"/>
				</ProductionVersionNumber>
				<MaterialNumber>
					<xsl:value-of select="ProcessProductDefinition/DataArea/ProductDefinition/ProductSegment/MaterialSpecification/MaterialDefinitionID"/>
				</MaterialNumber>
				<SAPPlant></SAPPlant>
			</ProductionVersion>
		</ProductionVersionApprovalMessage>
	</xsl:template>
</xsl:stylesheet>