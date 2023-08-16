<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="ns0 xs fn">
	<xsl:output method="xml"
                encoding="UTF-8"
                byte-order-mark="no"
                indent="yes"
                omit-xml-declaration="yes" />
	<xsl:template match="/">
		<ns0:NeoPlmErpMaterialLot xmlns:ns0="http://neoplm.erp.materiallot">
			<SourceSystemID>
				<xsl:value-of select="/*[local-name()='ProcessMaterialLot']/*[local-name()='ApplicationArea']/*[local-name()='Sender']/*[local-name()='LogicalID']" />
				<!-- <xsl:value-of select="/*[local-name()='ProcessMaterialLot' and namespace-uri()='http://www.mesa.org/xml/B2MML-V0600']/ApplicationArea/Sender/LogicalID" /> -->
			</SourceSystemID>
			<TransactionDateTime>
				<xsl:value-of select="/*[local-name()='ProcessMaterialLot']/*[local-name()='ApplicationArea']/*[local-name()='CreationDateTime']" />
			</TransactionDateTime>
			<TransactionID>
				<xsl:value-of select="/*[local-name()='ProcessMaterialLot']/*[local-name()='ApplicationArea']/*[local-name()='Sender']/*[local-name()='ReferenceID']" />
			</TransactionID>
			<xsl:if test="/*[local-name()='ProcessMaterialLot']/*[local-name()='ApplicationArea']/*[local-name()='Sender']/*[local-name()='ComponentID']">
				<ReferencedLotHandlerOption>
					<xsl:value-of select="/*[local-name()='ProcessMaterialLot']/*[local-name()='ApplicationArea']/*[local-name()='Sender']/*[local-name()='ComponentID']" />
				</ReferencedLotHandlerOption>
			</xsl:if>
			<MaterialLots>
				<xsl:for-each select="/*[local-name()='ProcessMaterialLot']/*[local-name()='DataArea']/*[local-name()='MaterialLot']">
					<MaterialLot>
						<!-- <xsl:for-each select="/*[local-name()='MaterialLotProperty' and namespace-uri()='http://www.mesa.org/xml/B2MML-V0600']"> -->
						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='SourceLastUpdateTime'">
								<LastUpdateDateTime>
									<xsl:value-of select="ns:Value/ns:ValueString" />
								</LastUpdateDateTime>
							</xsl:if>
						</xsl:for-each>
						<PlantID>
							<xsl:value-of select="ns:HierarchyScope/ns:EquipmentID" />
						</PlantID>
						<MaterialID>
							<xsl:value-of select="ns:MaterialDefinitionID" />
						</MaterialID>
						<MaterialLotID>
							<xsl:value-of select="ns:ID" />
						</MaterialLotID>
						<StatusCode>
							<xsl:value-of select="ns:Status" />
						</StatusCode>

						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='UsageDecisionText'">
								<StatusDescription>
									<xsl:value-of select="ns:Value/ns:ValueString" />
								</StatusDescription>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='RevaluationDateUtc'">
								<RevaluationDateUtc>
									<xsl:value-of select="ns:Value/ns:ValueString" />
								</RevaluationDateUtc>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='MaterialLotPotency'">
								<Potency>
									<xsl:choose>
										<xsl:when test="ns:Value/ns:ValueString = ''">0</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:otherwise>
									</xsl:choose>
								</Potency>
								<PotencyUOM>
									<xsl:value-of select="ns:Value/ns:UnitOfMeasure" />
								</PotencyUOM>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='SupplierID'">
								<SupplierID>
									<xsl:value-of select="ns:Value/ns:ValueString" />
								</SupplierID>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='SupplierName'">
								<SupplierName>
									<xsl:value-of select="ns:Value/ns:ValueString" />
								</SupplierName>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='SupplierLotID'">
								<SupplierLotID>
									<xsl:value-of select="ns:Value/ns:ValueString" />
								</SupplierLotID>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="ns:MaterialLotProperty">
							<xsl:if test="ns:ID='ReferencedMaterialLots'">
								<!-- ****************BEGIN REFERENCED LOTS******************** -->
								<ReferencedLots>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='MaterialLot'">
											<!-- ****************BEGIN SINGLE LOT******************** -->
											<ReferencedLot>
												<!-- ****************LOT VALUES******************** -->
												<xsl:for-each select="./ns:MaterialLotProperty">
													<xsl:if test="ns:ID='SourceSystemID'">
														<SourceSystemID>
															<xsl:value-of select="ns:Value/ns:ValueString" />
														</SourceSystemID>
													</xsl:if>
													<xsl:if test="ns:ID='PlantID'">
														<PlantID>
															<xsl:value-of select="ns:Value/ns:ValueString" />
														</PlantID>
													</xsl:if>
													<xsl:if test="ns:ID='MaterialID'">
														<MaterialID>
															<xsl:value-of select="ns:Value/ns:ValueString" />
														</MaterialID>
													</xsl:if>
													<xsl:if test="ns:ID='MaterialLotID'">
														<MaterialLotID>
															<xsl:value-of select="ns:Value/ns:ValueString" />
														</MaterialLotID>
													</xsl:if>
												</xsl:for-each>
											</ReferencedLot>
											<!-- ****************END SINGLE LOT******************** -->
										</xsl:if>
									</xsl:for-each>
								</ReferencedLots>
								<!-- ****************END REFERENCED LOTS******************** -->
							</xsl:if>
						</xsl:for-each>
						<Enrichment>
							<FacilityUID />
							<MaterialMasterUID />
							<MaterialLotUID />
							<EngineeringUnitUID />
							<StatusUID />
						</Enrichment>
					</MaterialLot>
				</xsl:for-each>
			</MaterialLots>
		</ns0:NeoPlmErpMaterialLot>
	</xsl:template>
</xsl:stylesheet>