<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs fn"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:local="urn:local" extension-element-prefixes="msxsl">
    <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <ProcessProductDefinition xmlns="http://www.mesa.org/xml/B2MML-V0600"
            xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" releaseID="B2MML-V0600"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema">
            <ApplicationArea>
                <Sender>
                    <LogicalID>
                        <xsl:value-of select="/ZMKAL/IDOC/EDI_DC40/SNDPOR"/>
                    </LogicalID>
                    <ReferenceID>
                        <xsl:value-of select="/ZMKAL/IDOC/EDI_DC40/DOCNUM"/>
                    </ReferenceID>
                </Sender>
                <Receiver>
                    <LogicalID>
                        <xsl:value-of select="/ZMKAL/IDOC/EDI_DC40/RCVPOR"/>
                    </LogicalID>
                </Receiver>
                <CreationDateTime>
                    <xsl:value-of select="concat(substring(/ZMKAL/IDOC/EDI_DC40/CREDAT,1,4),'-',substring(/ZMKAL/IDOC/EDI_DC40/CREDAT,5,2),'-',substring(/ZMKAL/IDOC/EDI_DC40/CREDAT,7,2),'T',substring(/ZMKAL/IDOC/EDI_DC40/CRETIM,1,2),':',substring(/ZMKAL/IDOC/EDI_DC40/CRETIM,3,2),':',substring(/ZMKAL/IDOC/EDI_DC40/CRETIM,5,2),'Z')"/>
                </CreationDateTime>
            </ApplicationArea>
            <DataArea>
                <Process acknowledgeCode="Always" />
                <ProductDefinition>
                    <ID>
                        <xsl:value-of select="ZMKAL/IDOC/Z1MKAL/VERID"/>
                    </ID>
                    <Description>
                        <xsl:value-of select="ZMKAL/IDOC/Z1MKAL/TEXT1"/>
                    </Description>
                    <HierarchyScope>
                        <EquipmentID>
                            <xsl:value-of select="ZMKAL/IDOC/Z1MKAL/WERKS"/>
                        </EquipmentID>
                        <EquipmentElementLevel>Site</EquipmentElementLevel>
                    </HierarchyScope>
                    <BillOfMaterialsID>
                        <xsl:value-of select="concat(ZMKAL/IDOC/Z1MKAL/MATNR, '|', ZMKAL/IDOC/Z1MKAL/STLAL)"/>
                    </BillOfMaterialsID>
                    <BillOfResourcesID>
                        <xsl:value-of select="concat(ZMKAL/IDOC/Z1MKAL/PLNNR, '|', ZMKAL/IDOC/Z1MKAL/ALNAL)"/>
                    </BillOfResourcesID>
                    <ProductSegment>
						<ID>Dummy</ID>
                        <Parameter>
                            <ID>MinProductionQuantity</ID>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="ZMKAL/IDOC/Z1MKAL/BSTMI"/>
                                </ValueString>
                            </Value>
                        </Parameter>
                        <Parameter>
                            <ID>MaxProductionQuantity</ID>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="ZMKAL/IDOC/Z1MKAL/BSTMA"/>    
                                </ValueString>
                            </Value>
                        </Parameter>
                        <Parameter>
                            <ID>LongText</ID>
                            <Value>
                                <ValueString>
                                    <xsl:value-of select="ZMKAL/IDOC/Z1MKAL/ZPVTEXT"/>
                                </ValueString>
                            </Value>
                        </Parameter>
                        <MaterialSpecification>
                            <MaterialDefinitionID>
                                <xsl:value-of select="ZMKAL/IDOC/Z1MKAL/MATNR"/>
                            </MaterialDefinitionID>
                        </MaterialSpecification>
                    </ProductSegment>
                </ProductDefinition>
            </DataArea>
        </ProcessProductDefinition>
    </xsl:template>
</xsl:stylesheet>