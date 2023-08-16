<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 xs fn"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" extension-element-prefixes="msxsl">

  <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes" />

  <xsl:template match="/">
    <ProcessMaterialLot releaseID="B2MML-V0600"
      xmlns:Extended="http://www.mesa.org/xml/B2MML-V0600-AllExtensions"
      xmlns="http://www.mesa.org/xml/B2MML-V0600">

      <ApplicationArea>
        <Sender>
          <LogicalID>
            <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='SOURCESYSTEMTXID']" />
          </LogicalID>
          <ReferenceID>
            <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='SOURCESYSTEMTXID']" />
          </ReferenceID>
          <ConfirmationCode>Always</ConfirmationCode>
        </Sender>
        <Receiver>
          <LogicalID>Neo PLM</LogicalID>
        </Receiver>
        <CreationDateTime>
          <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LASTMODIFIEDINEXTERNALSYSTEM']" />
        </CreationDateTime>
      </ApplicationArea>

      <DataArea>
        <Process acknowledgeCode="Always" />
        <MaterialLot>
          <ID>
            <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='BATCHNAME']" />
          </ID>
          <HierarchyScope>
            <EquipmentID>
              <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='SAPPLANTCODE']" />
              <!-- <xsl:variable name="fullValue" select= "/*[local-name()='Lims']/*[local-name()='LABTESTINGTEMPLATEID']" />
              <xsl:variable name="extractedValue" select="substring-before(substring-after($fullValue, '_'), ':') "/>
              <xsl:value-of select="$extractedValue"/> -->
            </EquipmentID>
            <EquipmentElementLevel>Site</EquipmentElementLevel>
          </HierarchyScope>
          <MaterialDefinitionID>
            <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='SAPMATERIALNAME']" />
            <!-- <xsl:variable name="fullValue" select= "/*[local-name()='Lims']/*[local-name()='LABTESTINGTEMPLATEID']" />
            <xsl:variable name="extractedValue" select="substring-before($fullValue, '_')"/>
            <xsl:value-of select="$extractedValue"/> -->
          </MaterialDefinitionID>
          <MaterialLotProperty>
            <ID>TestInstanceID</ID>
            <Value>
              <ValueString>
                <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='TASKSOURCESYSTEMTXID']" />
              </ValueString>
            </Value>
            <MaterialLotProperty>
              <ID>TestInstanceDescription</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LABTESTDESCRIPTION']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>LabSampleLastModified</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LABSAMPLELASTMODIFIED']" />
                  <!-- <xsl:value-of select="concat((Lims/SAMPLESTATUS),' | ',(Lims/DATECOMPLETED))" /> -->
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestTemplateVersion</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LABTESTINGTEMPLATEID']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestTemplateDescription</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='DESCRIPTION']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestTemplateType</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='MATERIALTYPE']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>SampleStatus</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='SAMPLESTATUS']" />
                  <!-- <xsl:value-of select="concat((Lims/SAMPLESTATUS),' | ',(Lims/DATECOMPLETED))" /> -->
                </ValueString>
              </Value>
            </MaterialLotProperty>
			<MaterialLotProperty>
              <ID>SampleID</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='SAMPLEID']" />
                  <!-- <xsl:value-of select="concat((Lims/SAMPLESTATUS),' | ',(Lims/DATECOMPLETED))" /> -->
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>ControlPointID</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='CONTROLPOINT']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>ControlPointDescription</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LABSAMPLEDESCRIPTION']" /> 
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestTemplateID</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LABTESTINGTEMPLATEID']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestMethodVersion</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='STANDARDTESTPROCEDURE']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestMethodDescription</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LABTESTDESCRIPTION']" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestStatus</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="concat(/*[local-name()='Lims']/*[local-name()='TASKCONDITION'],' | ',/*[local-name()='Lims']/*[local-name()='TASKSTATUS'])" />
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestMethodID</ID>
              <Value>
                <ValueString>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='STANDARDTESTPROCEDURE']" />
                  <!-- <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='LABTESTDESCRIPTION']" /> -->
                </ValueString>
              </Value>
            </MaterialLotProperty>
            <MaterialLotProperty>
              <ID>TestResults</ID>
              <MaterialLotProperty>
                <ID>
                  <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTSOURCESYSTEMTXID']" />
                </ID>
                <MaterialLotProperty>
                  <ID>ActualTestResults</ID>
                  <MaterialLotProperty>
                    <ID>EnteredResultValue</ID>
                    <Value>
                      <ValueString>
                        <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTFORMATTEDVALUE']" />
                        <!-- <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTTEXTVALUE']" /> -->
                      </ValueString>
                      <UnitOfMeasure>
                        <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTENGINEERINGUNITLABEL']" />
                      </UnitOfMeasure>
                    </Value>
                  </MaterialLotProperty>
                  <MaterialLotProperty>
                    <ID>ActualResultSummary</ID>
                    <Value>
                      <ValueString>
                        <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTSTATUS']" />
                      </ValueString>
                    </Value>
                  </MaterialLotProperty>
                  <MaterialLotProperty>
                    <ID>ExpectedResult</ID>
                    <Value>
                      <ValueString>
                        <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='SPECIFICATIONTEXT']" />
                      </ValueString>
                    </Value>
                  </MaterialLotProperty>
                  <MaterialLotProperty>
                    <ID>TestResultDescription</ID>
                    <Value>
                      <ValueString>
                        <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTNAME']" />
                      </ValueString>
                    </Value>
                  </MaterialLotProperty>
                  <MaterialLotProperty>
                    <ID>ActualTestResultDateTime</ID>
                    <Value>
                      <ValueString>
                        <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTLASTMODIFIED']" />
                        <!-- <xsl:value-of select="/*[local-name()='Lims']/*[local-name()='RESULTENTEREDON']" /> -->
                      </ValueString>
                    </Value>
                  </MaterialLotProperty>
                </MaterialLotProperty>
              </MaterialLotProperty>
            </MaterialLotProperty>
          </MaterialLotProperty>
        </MaterialLot>
      </DataArea>
    </ProcessMaterialLot>
  </xsl:template>
</xsl:stylesheet>