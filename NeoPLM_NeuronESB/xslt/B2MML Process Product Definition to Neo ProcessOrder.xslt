<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs fn"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:local="urn:local" extension-element-prefixes="msxsl">

    <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <NeoPlmProcessOrder>
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

            <Order>
                <OrderNumber>
                    <xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ID"/>
                </OrderNumber>
                <PlantID>
                    <xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:HierarchyScope/ns:EquipmentID"/>
                </PlantID>
                <MaterialNumber>
                    <xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:MaterialSpecification/ns:MaterialDefinitionID"/>
                </MaterialNumber>

				<SiteFacilityUID></SiteFacilityUID>
				<ERPPlantCodeUID></ERPPlantCodeUID>
				<LocalMaterialSpecificationUID></LocalMaterialSpecificationUID>
				<MaterialLotUID></MaterialLotUID>
				<QuantityEngineeringUnitUID></QuantityEngineeringUnitUID>
				
                <xsl:for-each select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:Parameter">

                    <xsl:if test="ns:ID='OrderType'">
                        <OrderType>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </OrderType>
                    </xsl:if>
                    <xsl:if test="ns:ID='ProductionVersion'">
                        <ProductionVersion>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </ProductionVersion>
                    </xsl:if>
                    <xsl:if test="ns:ID='Batch'">
                        <Batch>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </Batch>
                    </xsl:if>
                    <xsl:if test="ns:ID='PlannedQuantity'">
                        <PlannedQuantity>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </PlannedQuantity>
                    </xsl:if>
                    <xsl:if test="ns:ID='PlannedQuantityUOM'">
                        <PlannedQuantityUOM>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </PlannedQuantityUOM>
                    </xsl:if>
                    <xsl:if test="ns:ID='ERPStartDate'">
                        <ERPStartDate>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </ERPStartDate>
                    </xsl:if>
                    <xsl:if test="ns:ID='ERPStartTime'">
                        <ERPStartTime>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </ERPStartTime>
                    </xsl:if>
                    <xsl:if test="ns:ID='ERPEndDate'">
                        <ERPEndDate>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </ERPEndDate>
                    </xsl:if>
                    <xsl:if test="ns:ID='ERPEndTime'">
                        <ERPEndTime>
                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                        </ERPEndTime>
                    </xsl:if>
					
                    <xsl:if test="ns:ID='OrderOperations'">
                        <OrderOperations>
                            <xsl:for-each select="ns:Parameter">
                                <xsl:if test="ns:ID='OrderOperation'">
                                    <OrderOperation>
                                        <xsl:for-each select="ns:Parameter">
                                            <xsl:if test="ns:ID='OperationNumber'">
                                                <OperationNumber>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </OperationNumber>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='ParentOperationNumber'">
                                                <ParentOperationNumber>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </ParentOperationNumber>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='ControlKey'">
                                                <ControlKey>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </ControlKey>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='SelectedResource'">
                                                <SelectedResource>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </SelectedResource>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='AccountingQuantity'">
                                                <AccountingQuantity>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </AccountingQuantity>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='AccountingQuantityUOM'">
                                                <AccountingQuantityUOM>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </AccountingQuantityUOM>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='ScheduledOrderStepStartDate'">
                                                <ScheduledOrderStepStartDate>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </ScheduledOrderStepStartDate>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='ScheduledOrderStepStartTime'">
                                                <ScheduledOrderStepStartTime>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </ScheduledOrderStepStartTime>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='ScheduledOrderStepFinishDate'">
                                                <ScheduledOrderStepFinishDate>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </ScheduledOrderStepFinishDate>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='ScheduledOrderStepFinishTime'">
                                                <ScheduledOrderStepFinishTime>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </ScheduledOrderStepFinishTime>
                                            </xsl:if>
                                            <xsl:if test="ns:ID='OperationDescription'">
                                                <OperationDescription>
                                                    <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                </OperationDescription>
                                            </xsl:if>

                                            <xsl:if test="ns:ID='BillOfMaterialItems'">
                                                <BillOfMaterialItems>
                                                    <xsl:for-each select="ns:Parameter">
                                                        <xsl:if test="ns:ID='BillOfMaterialItem'">
                                                            <BillOfMaterialItem>
                                                                <xsl:for-each select="ns:Parameter">
                                                                    <xsl:if test="ns:ID='BOMItemNumber'">
                                                                        <BOMItemNumber>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </BOMItemNumber>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='MaterialNumber'">
                                                                        <MaterialNumber>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </MaterialNumber>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='Quantity'">
                                                                        <Quantity>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </Quantity>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='QuantityUOM'">
                                                                        <QuantityUOM>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </QuantityUOM>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='ReservationNumber'">
                                                                        <ReservationNumber>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </ReservationNumber>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='ReservationLine'">
                                                                        <ReservationLine>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </ReservationLine>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='AlternateItemGroup'">
                                                                        <AlternateItemGroup>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </AlternateItemGroup>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='AllocatedBatch'">
                                                                        <AllocatedBatch>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </AllocatedBatch>
                                                                    </xsl:if>
                                                                    <xsl:if test="ns:ID='PhantomFlag'">
                                                                        <PhantomFlag>
                                                                            <xsl:value-of select="ns:Value/ns:ValueString"/>
                                                                        </PhantomFlag>
                                                                    </xsl:if>
                                                                </xsl:for-each>
                                                            </BillOfMaterialItem>
                                                        </xsl:if>
                                                    </xsl:for-each>
                                                </BillOfMaterialItems>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </OrderOperation>
                                </xsl:if>
                            </xsl:for-each>
                        </OrderOperations>
                    </xsl:if>
                </xsl:for-each>
            </Order>
        </NeoPlmProcessOrder>
    </xsl:template>
</xsl:stylesheet>