<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 xs fn">
  <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" />
  <xsl:template match="/">
    <ns0:NeoPlmErpGoodsIssueReversal xmlns:ns0="http://NeoPLM.NeoPlmErpGoodsIssueReversal">
      <SourceSystemID>
        <xsl:value-of select="ns:ProcessOperationsPerformance/ns:ApplicationArea/ns:Sender/ns:LogicalID" />
      </SourceSystemID>
      <TransactionDateTime>
        <xsl:value-of select="ns:ProcessOperationsPerformance/ns:ApplicationArea/ns:CreationDateTime" />
      </TransactionDateTime>
      <TransactionID>
        <xsl:value-of select="ns:ProcessOperationsPerformance/ns:ApplicationArea/ns:Sender/ns:ReferenceID" />
      </TransactionID>

      <GoodsIssueReversals>
        <!--*****************BEGIN GOODS ISSUES LOOP*********************-->
        <xsl:for-each select="ns:ProcessOperationsPerformance/ns:DataArea/ns:OperationsPerformance">

          <!--**************BEGIN SINGLE GOODS ISSUE*********************-->
          <GoodsIssueReversal>

      			<PlantID>
        			<xsl:value-of select="ns:HierarchyScope/ns:EquipmentID" />
      			</PlantID>

            <SourceTransactionID>
              <xsl:value-of select="ns:ID" />
            </SourceTransactionID>

            <!--***********Loop through and find the Transaction DateTime*************-->
            <xsl:for-each select="ns:OperationsResponse/ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
              <xsl:if test="ns:ID='TransactionDate'">
                <MESTransactionDateTime>
                  <xsl:value-of select="./ns:Value/ns:ValueString" />
                </MESTransactionDateTime>
              </xsl:if>
            </xsl:for-each>

            <!--************BEGIN Operations Response Loop***************-->
            <xsl:for-each select="ns:OperationsResponse">
              <MESOrderID>
                <xsl:value-of select="ns:ID" />
              </MESOrderID>
              <ERPOrderID>
                <xsl:value-of select="ns:OperationsRequestID" />
              </ERPOrderID>

              <!--*******Loop through and find the ERP Order Material ID****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='ERPProducedMaterialID'">
                  <ERPOrderMaterialID>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </ERPOrderMaterialID>
                </xsl:if>
              </xsl:for-each>

              <!--*******Loop through and find the ERP Order Material LOT ID****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='ERPProducedMaterialLotID'">
                  <ERPBatchID>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </ERPBatchID>
                </xsl:if>
              </xsl:for-each>

              <ERPProductionVersionID>
                <xsl:value-of select="ns:OperationsDefinitionID" />
              </ERPProductionVersionID>
              <ERPOperationID>
                <xsl:value-of select="ns:SegmentResponse/ns:ID" />
              </ERPOperationID>
              <xsl:if test="string-length(ns:SegmentResponse/ns:HierarchyScope/ns:EquipmentID)!=0">
                <ERPResourceID>
                  <xsl:value-of select="ns:SegmentResponse/ns:HierarchyScope/ns:EquipmentID" />
                </ERPResourceID>
              </xsl:if>
              <!--***********Loop through and find the BOM*************-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='BOMLineNumber'">
                  <BOMLineNumber>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </BOMLineNumber>
                </xsl:if>
              </xsl:for-each>

              <MaterialID>
                <xsl:value-of select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialDefinitionID" />
              </MaterialID>
              <xsl:if test="string-length(ns:SegmentResponse/ns:MaterialActual/ns:MaterialLotID)!=0">
                <MaterialLotID>
                  <xsl:value-of select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialLotID" />
                </MaterialLotID>
              </xsl:if>
              <!--***********Loop through and find the Container Number*************-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='ContainerNumber'">
                  <ContainerNumber>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </ContainerNumber>
                </xsl:if>
              </xsl:for-each>

              <!--*******Loop through and find the Storage Equipment ID****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='StorageEquipmentID'">
                  <StorageEquipmentID>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </StorageEquipmentID>
                </xsl:if>
              </xsl:for-each>

              <TransactionType>GIR</TransactionType>

              <!--*******Loop through and find the Batch Status****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='BatchStatus'">
                  <BatchStatus>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </BatchStatus>
                </xsl:if>
              </xsl:for-each>

              <Quantity>
                <xsl:value-of select="ns:SegmentResponse/ns:MaterialActual/ns:Quantity/ns:QuantityString" />
              </Quantity>
              <QuantityUOM>
                <xsl:value-of select="ns:SegmentResponse/ns:MaterialActual/ns:Quantity/ns:UnitOfMeasure" />
              </QuantityUOM>

              <!--*******Loop through and find the Performed By****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='PerformedBy'">
                  <PerformedBy>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </PerformedBy>
                </xsl:if>
              </xsl:for-each>

              <!--*******Loop through and find the Performed Date****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='PerformedByDate'">
                  <PerformedByDate>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </PerformedByDate>
                </xsl:if>
              </xsl:for-each>

              <!--*******Loop through and find the Verified By****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='VerifiedBy'">
                  <VerifiedBy>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </VerifiedBy>
                </xsl:if>
              </xsl:for-each>

              <!--*******Loop through and find the Verified Date****-->
              <xsl:for-each select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty">
                <xsl:if test="ns:ID='VerifiedByDate'">
                  <VerifiedByDate>
                    <xsl:value-of select="./ns:Value/ns:ValueString" />
                  </VerifiedByDate>
                </xsl:if>
              </xsl:for-each>

            </xsl:for-each>
            <!--*************END Operations Response Loop***************-->

          </GoodsIssueReversal>
          <!--***************END SINGLE GOODS ISSUE********************-->

        </xsl:for-each>
        <!--*****************END GOODS ISSUES LOOP*********************-->
      </GoodsIssueReversals>
    </ns0:NeoPlmErpGoodsIssueReversal>
  </xsl:template>
</xsl:stylesheet>