<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 xs fn">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<NeoPlmBillOfMaterial>
			<SourceSystemID>
				<xsl:value-of select="/ns:ProcessProductDefinition/ns:ApplicationArea/ns:Sender/ns:LogicalID" />
			</SourceSystemID>
			<TransactionDateTime>
				<xsl:value-of select="/ns:ProcessProductDefinition/ns:ApplicationArea/ns:CreationDateTime" />
			</TransactionDateTime>
			<TransactionID>
				<xsl:value-of select="/ns:ProcessProductDefinition/ns:ApplicationArea/ns:Sender/ns:ReferenceID" />
			</TransactionID>
			<DestinationSystemID>
				<xsl:value-of select="/ns:ProcessProductDefinition/ns:ApplicationArea/ns:Receiver/ns:LogicalID" />
			</DestinationSystemID>
			<BillOfMaterial>
				<MaterialNumber>
					<xsl:value-of select="/ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ManufacturingBill/ns:MaterialDefinitionID" />
				</MaterialNumber>
				<PlantID>
					<xsl:value-of select="/ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:HierarchyScope/ns:EquipmentID" />
				</PlantID>
				<BOMAlternateNumber>
					<xsl:value-of select="/ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ManufacturingBill/ns:ID" />
				</BOMAlternateNumber>
				<ReferenceQuantity>
					<xsl:value-of select="/ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ManufacturingBill/ns:Quantity/ns:QuantityString" />
				</ReferenceQuantity>
				<QuantityUOM>
					<xsl:value-of select="/ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ManufacturingBill/ns:Quantity/ns:UnitOfMeasure" />
				</QuantityUOM>
				<BOMDescription>
					<xsl:value-of select="/ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ManufacturingBill/ns:Description" />
				</BOMDescription>
				<xsl:for-each select="/ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ManufacturingBill/ns:AssemblyManufacturingBill">
					<xsl:if test="ns:ID='BOMUsage'">
						<BOMUsage>
							<xsl:value-of select="ns:Description" />
						</BOMUsage>
					</xsl:if>
					<xsl:if test="ns:ID='ValidFromDate'">
						<ValidFromDate>
							<xsl:value-of select="ns:Description" />
						</ValidFromDate>
					</xsl:if>
					<xsl:if test="ns:ID='Deprecated'">
						<Deprecated>
							<xsl:value-of select="ns:Description" />
						</Deprecated>
					</xsl:if>
					<xsl:if test="ns:ID='BIllOfMaterialItems'">
						<BillOfMaterialItems>
							<xsl:for-each select="ns:AssemblyManufacturingBill">
								<xsl:if test="ns:ID='BIllOfMaterialItem'">
									<BillOfMaterialItem>
										<BOMItemNumber>
											<xsl:value-of select="ns:BillOfMaterialID" />
										</BOMItemNumber>
										<MaterialNumber>
											<xsl:value-of select="ns:MaterialDefinitionID" />
										</MaterialNumber>
										<BOMItemCategory>
											<xsl:value-of select="ns:MaterialClassID" />
										</BOMItemCategory>
										<LocalMaterialSpecificationUID></LocalMaterialSpecificationUID>
										<QuantityEngineeringUnitUID></QuantityEngineeringUnitUID>
										<MaterialReferenceType></MaterialReferenceType>
										<xsl:for-each select="ns:AssemblyManufacturingBill">
											<xsl:if test="ns:ID='RecipeQuantity'">
												<RecipeQuantity>
													<xsl:value-of select="ns:Description" />
												</RecipeQuantity>
											</xsl:if>
											<xsl:if test="ns:ID='RecipeUnitOfMeasure'">
												<UnitOfMeasure>
													<xsl:value-of select="ns:Description" />
												</UnitOfMeasure>
											</xsl:if>
											<xsl:if test="ns:ID='AlternateGroupID'">
												<AlternateGroupID>
													<xsl:value-of select="ns:Description" />
												</AlternateGroupID>
											</xsl:if>
											<xsl:if test="ns:ID='LotSizeIndependentFlag'">
												<LotSizeIndependentFlag>
													<xsl:value-of select="ns:Description" />
												</LotSizeIndependentFlag>
											</xsl:if>
											<xsl:if test="ns:ID='AlterItemUsageProbability'">
												<AlterItemUsageProbability>
													<xsl:value-of select="ns:Description" />
												</AlterItemUsageProbability>
											</xsl:if>
											<xsl:if test="ns:ID='IsBulkMaterial'">
												<IsBulkMaterial>
													<xsl:value-of select="ns:Description" />
												</IsBulkMaterial>
											</xsl:if>
											<xsl:if test="ns:ID='IsCoProduct'">
												<IsCoProduct>
													<xsl:value-of select="ns:Description" />
												</IsCoProduct>
											</xsl:if>
											<xsl:if test="ns:ID='BillOfMaterialItemExtension'">
												<BOMExtension>
													<xsl:for-each select="ns:AssemblyManufacturingBill">
														<xsl:if test="ns:ID='WeighingType'">
															<WeighingType>
																<xsl:value-of select="ns:Description" />
															</WeighingType>
														</xsl:if>
														<xsl:if test="ns:ID='WeightMaterialType'">
															<WeightMaterialType>
																<xsl:value-of select="ns:Description" />
															</WeightMaterialType>
														</xsl:if>
														<xsl:if test="ns:ID='CompensatorFixedRatioValue'">
															<CompensatorFixedRatioValue>
																<xsl:value-of select="ns:Description" />
															</CompensatorFixedRatioValue>
														</xsl:if>
														<xsl:if test="ns:ID='DefaultTolerance'">
															<DefaultTolerance>
																<xsl:value-of select="ns:Description" />
															</DefaultTolerance>
														</xsl:if>
														<xsl:if test="ns:ID='UpperTolerencePct'">
															<UpperTolerencePct>
																<xsl:value-of select="ns:Description" />
															</UpperTolerencePct>
														</xsl:if>
														<xsl:if test="ns:ID='LowerTolerencePct'">
															<LowerTolerencePct>
																<xsl:value-of select="ns:Description" />
															</LowerTolerencePct>
														</xsl:if>
														<xsl:if test="ns:ID='NumberOfBatches'">
															<NumberOfBatches>
																<xsl:value-of select="ns:Description" />
															</NumberOfBatches>
														</xsl:if>
														<xsl:if test="ns:ID='LinkedBOMItemNumber'">
															<LinkedBOMItemNumber>
																<xsl:value-of select="ns:Description" />
															</LinkedBOMItemNumber>
														</xsl:if>
														<xsl:if test="ns:ID='BatchWeightConstant'">
															<BatchWeightConstant>
																<xsl:value-of select="ns:Description" />
															</BatchWeightConstant>
														</xsl:if>
														<xsl:if test="ns:ID='PrimaryPotency'">
															<PrimaryPotency>
																<xsl:value-of select="ns:Description" />
															</PrimaryPotency>
														</xsl:if>
														<xsl:if test="ns:ID='PrimaryPotencyUOM'">
															<PrimaryPotencyUOM>
																<xsl:value-of select="ns:Description" />
															</PrimaryPotencyUOM>
														</xsl:if>
														<xsl:if test="ns:ID='SecondaryPotency'">
															<SecondaryPotency>
																<xsl:value-of select="ns:Description" />
															</SecondaryPotency>
														</xsl:if>
														<xsl:if test="ns:ID='SecondaryPotencyUOM'">
															<SecondaryPotencyUOM>
																<xsl:value-of select="ns:Description" />
															</SecondaryPotencyUOM>
														</xsl:if>
														<xsl:if test="ns:ID='PrimaryPotencyUpperLimit'">
															<PrimaryPotencyUpperLimit>
																<xsl:value-of select="ns:Description" />
															</PrimaryPotencyUpperLimit>
														</xsl:if>
														<xsl:if test="ns:ID='PrimaryPotencyLowerLimit'">
															<PrimaryPotencyLowerLimit>
																<xsl:value-of select="ns:Description" />
															</PrimaryPotencyLowerLimit>
														</xsl:if>
														<xsl:if test="ns:ID='PrimaryPotencyCalculated'">
															<PrimaryPotencyCalculated>
																<xsl:value-of select="ns:Description" />
															</PrimaryPotencyCalculated>
														</xsl:if>
														<xsl:if test="ns:ID='PrimaryPotencyCalculatedUOM'">
															<PrimaryPotencyCalculatedUOM>
																<xsl:value-of select="ns:Description" />
															</PrimaryPotencyCalculatedUOM>
														</xsl:if>
														<xsl:if test="ns:ID='SecondaryPotencyUpperLimit'">
															<SecondaryPotencyUpperLimit>
																<xsl:value-of select="ns:Description" />
															</SecondaryPotencyUpperLimit>
														</xsl:if>
														<xsl:if test="ns:ID='SecondaryPotencyLowerLimit'">
															<SecondaryPotencyLowerLimit>
																<xsl:value-of select="ns:Description" />
															</SecondaryPotencyLowerLimit>
														</xsl:if>
														<xsl:if test="ns:ID='SecondaryPotencyCalculated'">
															<SecondaryPotencyCalculated>
																<xsl:value-of select="ns:Description" />
															</SecondaryPotencyCalculated>
														</xsl:if>
														<xsl:if test="ns:ID='SecondaryPotencyCalculatedUOM'">
															<SecondaryPotencyCalculatedUOM>
																<xsl:value-of select="ns:Description" />
															</SecondaryPotencyCalculatedUOM>
														</xsl:if>
														<xsl:if test="ns:ID='PhantomBOMMember'">
															<PhantomBOMMember>
																<xsl:value-of select="ns:Description" />
															</PhantomBOMMember>
														</xsl:if>
													</xsl:for-each>
												</BOMExtension>
											</xsl:if>
										</xsl:for-each>
									</BillOfMaterialItem>
								</xsl:if>
							</xsl:for-each>
						</BillOfMaterialItems>
					</xsl:if>
				</xsl:for-each>
			</BillOfMaterial>
		</NeoPlmBillOfMaterial>
	</xsl:template>
</xsl:stylesheet>