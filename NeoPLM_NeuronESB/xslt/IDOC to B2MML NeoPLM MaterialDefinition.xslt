<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 xs fn" xmlns:msxsl="urn:schemas-microsoft-com:xslt" extension-element-prefixes="msxsl">

    <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <ProcessMaterialDefinition xmlns="http://www.mesa.org/xml/B2MML-V0600" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" releaseID="B2MML-V0600" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
            <ApplicationArea>
                <Sender> 
                    <LogicalID>
                        <xsl:value-of select="/ZMATMAS2/IDOC/EDI_DC40/SNDPOR" />
                    </LogicalID>
                    <ReferenceID>
                        <xsl:value-of select="/ZMATMAS2/IDOC/EDI_DC40/DOCNUM" />
                    </ReferenceID>
                    <ConfirmationCode>Never</ConfirmationCode>
                </Sender>
                <Receiver>
                    <LogicalID>
                        <xsl:value-of select="/ZMATMAS2/IDOC/EDI_DC40/RCVPOR" />
                    </LogicalID>
                </Receiver>
                <CreationDateTime>
                    <xsl:value-of select="concat(substring(/ZMATMAS2/IDOC/EDI_DC40/CREDAT,1,4),'-',substring(/ZMATMAS2/IDOC/EDI_DC40/CREDAT,5,2),'-',substring(/ZMATMAS2/IDOC/EDI_DC40/CREDAT,7,2),'T',substring(/ZMATMAS2/IDOC/EDI_DC40/CRETIM,1,2),':',substring(/ZMATMAS2/IDOC/EDI_DC40/CRETIM,3,2),':',substring(/ZMATMAS2/IDOC/EDI_DC40/CRETIM,5,2),'Z')" />
                </CreationDateTime>
            </ApplicationArea>
            <DataArea>
                <Process acknowledgeCode="Always" />
                <xsl:for-each select="/ZMATMAS2/IDOC/E1MARAM">
                    <MaterialDefinition>
                        <ID>
                            <xsl:value-of select="MATNR" />
                        </ID>
                        <Description languageID="EN">
                            <xsl:value-of select="E1MAKTM/MAKTX" />
                        </Description>
                        <HierarchyScope>
                            <EquipmentID>
                                <xsl:value-of select="E1MARCM/WERKS" />
                            </EquipmentID>
                            <EquipmentElementLevel>WorkCell</EquipmentElementLevel>
                        </HierarchyScope>
						<MaterialDefinitionProperty>
                            <ID>IsDeprecated</ID>
                            <Description>Material Deprecated</Description>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="LVORM" />
                                </ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                        <MaterialDefinitionProperty>
                            <ID>MaterialType</ID>
                            <Description>Item Raw Material</Description>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="MTART" />
                                </ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                        <MaterialDefinitionProperty>
                            <ID>InventoryUOM</ID>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="MEINS" />
                                </ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                        <MaterialDefinitionProperty>
                            <ID>FirstEffectiveDate</ID>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="concat(substring(ERSDA,1,4),'-',substring(ERSDA,5,2),'-',substring(ERSDA,7,2),'T','00:00:00Z')" />
                                </ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                        <MaterialDefinitionProperty>
                            <ID>LastEffectiveDate</ID>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="concat(substring(LAEDA,1,4),'-',substring(LAEDA,5,2),'-',substring(LAEDA,7,2),'T','00:00:00Z')" />
                                </ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                        <MaterialDefinitionProperty>
                            <ID>GlobalMaterialSpecificationID</ID>
                            <Value>
                                <ValueString>GS30000</ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                        <MaterialDefinitionProperty>
                            <ID>GlobalMaterialSpecificationDescription</ID>
                            <Value>
                                <ValueString>This is a GS Description</ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                        <MaterialDefinitionProperty>
                            <ID>Density</ID>
                            <Value>
                                <ValueString>1.1</ValueString>
                            </Value>
                        </MaterialDefinitionProperty>
                    </MaterialDefinition>
                </xsl:for-each>
            </DataArea>
        </ProcessMaterialDefinition>
    </xsl:template>
</xsl:stylesheet>