<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs fn"  
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:local="urn:local" extension-element-prefixes="msxsl">

  <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <ProcessOperationsPerformance xmlns="http://www.mesa.org/xml/B2MML-V0600" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" releaseID="B2MML-V0600" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <ApplicationArea>
          <Sender>
              <LogicalID>
                  <xsl:value-of select="/WMMBID02/IDOC/EDI_DC40/SNDPOR"/>
              </LogicalID>
              <ReferenceID>
                  <xsl:value-of select="/WMMBID02/IDOC/EDI_DC40/DOCNUM"/>
              </ReferenceID>
              <ConfirmationCode>Always</ConfirmationCode>
          </Sender>
          <Receiver>
              <LogicalID>ERM-NEOPLM-DEV</LogicalID>
          </Receiver>
          <CreationDateTime>
              <xsl:value-of select="concat(substring(/WMMBID02/IDOC/EDI_DC40/CREDAT,1,4),'-',substring(/WMMBID02/IDOC/EDI_DC40/CREDAT,5,2),'-',substring(/WMMBID02/IDOC/EDI_DC40/CREDAT,7,2),'T',substring(/WMMBID02/IDOC/EDI_DC40/CRETIM,1,2),':',substring(/WMMBID02/IDOC/EDI_DC40/CRETIM,3,2),':',substring(/WMMBID02/IDOC/EDI_DC40/CRETIM,5,2),'Z')"/>
          </CreationDateTime>
      </ApplicationArea>
      <DataArea>
          <Process acknowledgeCode="Always"/>
          <xsl:for-each select="/WMMBID02/IDOC/E1MBXYH/E1MBXYI">
          <OperationsPerformance>
              <ID>
                <xsl:value-of select="/WMMBID02/IDOC/EDI_DC40/DOCNUM"/>
            </ID>
              <HierarchyScope>
                  <EquipmentID>
                      <xsl:value-of select="WERKS"/>
                  </EquipmentID>
                  <EquipmentElementLevel>Site</EquipmentElementLevel>
              </HierarchyScope>
              <OperationsResponse>
                  <ID>
                      <xsl:value-of select="AUFNR"/>
                  </ID>
                  <OperationsRequestID>
                      <xsl:value-of select="AUFNR"/>
                  </OperationsRequestID>
                  <OperationsDefinitionID>TP03</OperationsDefinitionID>
                  <ResponseState>Ready</ResponseState>
                  <SegmentResponse>
                      <ID>0030</ID>
                      <HierarchyScope>
                          <EquipmentID>
                              <xsl:if test = "LGORT">
								<xsl:value-of select="LGORT"/>
							</xsl:if>
                          	<xsl:if test = "not (LGORT)">0</xsl:if>
                          </EquipmentID>
                          <EquipmentElementLevel>Unit</EquipmentElementLevel>
                      </HierarchyScope>
                      <MaterialActual>
                          <MaterialDefinitionID>
                              <xsl:value-of select="MATNR"/>
                          </MaterialDefinitionID>
                          <MaterialLotID>
                              <xsl:value-of select="CHARG"/>
                          </MaterialLotID>
                          <Quantity>
                              <QuantityString>
                                  <xsl:value-of select="ERFMG"/>
                              </QuantityString>
                              <UnitOfMeasure>
                                  <xsl:value-of select="ERFME"/>
                              </UnitOfMeasure>
                          </Quantity>
                        <xsl:if test = "POSNR">
                          <MaterialActualProperty>
                              <ID>BOMLineNumber</ID>
                              <Value>
                                  <ValueString>
                                        <xsl:value-of select="POSNR"/>                                        
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
                        </xsl:if>
                        <xsl:if test = "LGORT">
                          <MaterialActualProperty>
                              <ID>StorageEquipmentID</ID>
                              <Value>
                                  <ValueString>
                                            <xsl:value-of select="LGORT"/>
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
                        </xsl:if>
                        <xsl:if test = "SGTXT">
                          <MaterialActualProperty>
                              <ID>Container Number</ID>
                              <Value>
                                  <ValueString>
                                            <xsl:value-of select="SGTXT"/>
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
                        </xsl:if>
                          <MaterialActualProperty>
                              <ID>TransactionType</ID>
                              <Value>
                                  <ValueString>GR</ValueString>
                              </Value>
                          </MaterialActualProperty>
                          <MaterialActualProperty>
                              <ID>BatchStatus</ID>
                              <Value>
                                  <ValueString>Q</ValueString>
                              </Value>
                          </MaterialActualProperty>
                          <xsl:if test = "/WMMBID02/IDOC/FTPSSIG/USRNAME1">
                          <MaterialActualProperty>
                              <ID>PerformedBy</ID>
                              <Value>
                                  <ValueString>
                                        <xsl:value-of select="/WMMBID02/IDOC/FTPSSIG/USRNAME1"/>
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
                          </xsl:if>
                          <xsl:if test = "/WMMBID02/IDOC/FTPSSIG/USRDATE1">
                          <MaterialActualProperty>
                              <ID>PerformedByDate</ID>
                              <Value>
                                  <ValueString>
                                        <xsl:value-of select="/WMMBID02/IDOC/FTPSSIG/USRDATE1"/>
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
                          </xsl:if>
						  <xsl:if test = "/WMMBID02/IDOC/FTPSSIG/USRNAME2">
                          <MaterialActualProperty>
                              <ID>VerifiedBy</ID>
                              <Value>
                                  <ValueString>
	                                      <xsl:value-of select="/WMMBID02/IDOC/FTPSSIG/USRNAME2"/>
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
						  </xsl:if>
						  <xsl:if test = "/WMMBID02/IDOC/FTPSSIG/USRDATE2">
                          <MaterialActualProperty>
                              <ID>VerifiedByDate</ID>
                              <Value>
                                  <ValueString>
	                                      <xsl:value-of select="/WMMBID02/IDOC/FTPSSIG/USRDATE2"/>
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
						  </xsl:if>
						  <xsl:if test = "/WMMBID02/IDOC/FTPSSIG/REQTYP">
	                          <MaterialActualProperty>
	                              <ID>RequestType</ID>
	                              <Value>
	                                  <ValueString>
	                                      <xsl:value-of select="/WMMBID02/IDOC/FTPSSIG/REQTYP"/>
	                                  </ValueString>
	                              </Value>
	                          </MaterialActualProperty>
						  </xsl:if>
                          <MaterialActualProperty>
                              <ID>TransactionDate</ID>
                              <Value>
                                  <ValueString>2015-10-02T15:19:00.000Z</ValueString>
                              </Value>
                          </MaterialActualProperty>
                          <xsl:if test = "MATNR">
                          <MaterialActualProperty>
                              <ID>ERPProducedMaterialID</ID>
                              <Value>
                                  <ValueString>
                                        <xsl:value-of select="MATNR"/>
                                  </ValueString>
                              </Value>
                          </MaterialActualProperty>
                          </xsl:if>
                          <MaterialActualProperty>
                              <ID>ERPProducedMaterialLotID</ID>
                              <Value>
                                  <ValueString>2900</ValueString>
                              </Value>
                          </MaterialActualProperty>
                      </MaterialActual>
                  </SegmentResponse>
              </OperationsResponse>
          </OperationsPerformance>
          </xsl:for-each>
      </DataArea>
  </ProcessOperationsPerformance>
</xsl:template>
</xsl:stylesheet>