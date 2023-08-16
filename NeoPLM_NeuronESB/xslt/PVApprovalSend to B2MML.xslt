<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<ProcessProductDefinition>
			<DataArea>
				<Process acknowledgeCode="Always" />
				<ProductDefinition>
					<ID>
						<xsl:value-of select="ProductionVersion/ProductionVersionID"/>
					</ID>
					<HierarchyScope>
						<EquipmentID>
						</EquipmentID>
						<EquipmentElementLevel>Site</EquipmentElementLevel>
					</HierarchyScope>
					<ProductSegment>
						<MaterialSpecification>
							<MaterialDefinitionID>
								<xsl:value-of select="ProductionVersion/ItemCode"/>
							</MaterialDefinitionID>
						</MaterialSpecification>
					</ProductSegment>
				</ProductDefinition>
			</DataArea>
		</ProcessProductDefinition>
	</xsl:template>
</xsl:stylesheet>