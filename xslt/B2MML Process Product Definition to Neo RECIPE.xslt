<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs fn"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:local="urn:local" extension-element-prefixes="msxsl">

	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<NeoPlmRecipe>
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
			<Recipe>
				<RecipeID>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:ID"/>
				</RecipeID>
				<RecipeDescription>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:Description"/>
				</RecipeDescription>
				<PlantID>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:HierarchyScope/ns:EquipmentID"/>
				</PlantID>
				<MaterialNumber>
					<xsl:value-of select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:MaterialSpecification/ns:MaterialDefinitionID"/>
				</MaterialNumber>
				<QuantityEngineeringUnitUID></QuantityEngineeringUnitUID>

				<xsl:for-each select="ns:ProcessProductDefinition/ns:DataArea/ns:ProductDefinition/ns:ProductSegment/ns:Parameter">
					<xsl:if test="ns:ID='UnitOfMeasure'">
						<UnitOfMeasure>
							<xsl:value-of select="ns:Value/ns:ValueString"/>
						</UnitOfMeasure>
					</xsl:if>
					<xsl:if test="ns:ID='RecipeLowerLimitQuantity'">
						<RecipeLowerLimitQuantity>
							<xsl:value-of select="ns:Value/ns:ValueString"/>
						</RecipeLowerLimitQuantity>
					</xsl:if>
					<xsl:if test="ns:ID='RecipeUpperLimitQuantity'">
						<RecipeUpperLimitQuantity>
							<xsl:value-of select="ns:Value/ns:ValueString"/>
						</RecipeUpperLimitQuantity>
					</xsl:if>
					<xsl:if test="ns:ID='RecipeOperations'">
						<RecipeOperations>
							<xsl:for-each select="ns:Parameter">
								<xsl:if test="ns:ID='RecipeOperation'">
									<RecipeOperation>
										<xsl:for-each select="ns:Parameter">
											<xsl:if test="ns:ID='OperationNumber'">
												<OperationNumber>
													<xsl:value-of select="ns:Value/ns:ValueString"/>
												</OperationNumber>
											</xsl:if>
											<xsl:if test="ns:ID='SuperiorOperationNumber'">
												<SuperiorOperationNumber>
													<xsl:value-of select="ns:Value/ns:ValueString"/>
												</SuperiorOperationNumber>
											</xsl:if>
											<xsl:if test="ns:ID='PrimaryResourceHumanID'">
												<PrimaryResourceHumanID>
													<xsl:value-of select="ns:Value/ns:ValueString"/>
												</PrimaryResourceHumanID>
											</xsl:if>
											<xsl:if test="ns:ID='OperationDescription'">
												<OperationDescription>
													<xsl:value-of select="ns:Value/ns:ValueString"/>
												</OperationDescription>
											</xsl:if>
											<xsl:if test="ns:ID='PrimaryResourceSAPID'">
												<PrimaryResourceSAPID>
													<xsl:value-of select="ns:Value/ns:ValueString"/>
												</PrimaryResourceSAPID>
											</xsl:if>
											<xsl:if test="ns:ID='ControlKey'">
												<ControlKey>
													<xsl:value-of select="ns:Value/ns:ValueString"/>
												</ControlKey>
											</xsl:if>
											<xsl:if test="ns:ID='RecipeBaseQuantity'">
												<RecipeBaseQuantity>
													<xsl:value-of select="ns:Value/ns:ValueString"/>
												</RecipeBaseQuantity>
											</xsl:if>
											<xsl:if test="ns:ID='AlternateResources'">
												<AlternateResources>
													<xsl:for-each select="ns:Parameter">
														<xsl:if test="ns:ID='AlternateResource'">
															<AlternateResource>
																<xsl:for-each select="ns:Parameter">
																	<xsl:if test="ns:ID='AlternateResourceSAPID'">
																		<AlternateResourceSAPID>
																			<xsl:value-of select="ns:Value/ns:ValueString"/>
																		</AlternateResourceSAPID>
																	</xsl:if>
																	<xsl:if test="ns:ID='AlternateResourceHumanID'">
																		<AlternateResourceHumanID>
																			<xsl:value-of select="ns:Value/ns:ValueString"/>
																		</AlternateResourceHumanID>
																	</xsl:if>
																</xsl:for-each>
															</AlternateResource>
														</xsl:if>
													</xsl:for-each>
												</AlternateResources>
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
																	<xsl:if test="ns:ID='BillOfMaterialItemQuantity'">
																		<BillOfMaterialItemQuantity>
																			<xsl:value-of select="ns:Value/ns:ValueString"/>
																		</BillOfMaterialItemQuantity>
																	</xsl:if>
																	<xsl:if test="ns:ID='UnitOfMeasure'">
																		<UnitOfMeasure>
																			<xsl:value-of select="ns:Value/ns:ValueString"/>
																		</UnitOfMeasure>
																	</xsl:if>
																	<xsl:if test="ns:ID='BOMAlternateNumber'">
																		<BOMAlternateNumber>
																			<xsl:value-of select="ns:Value/ns:ValueString"/>
																		</BOMAlternateNumber>
																	</xsl:if>
																</xsl:for-each>
															</BillOfMaterialItem>
														</xsl:if>
													</xsl:for-each>
												</BillOfMaterialItems>
											</xsl:if>
										</xsl:for-each>
									</RecipeOperation>
								</xsl:if>
							</xsl:for-each>
						</RecipeOperations>
					</xsl:if>
				</xsl:for-each>
			</Recipe>
		</NeoPlmRecipe>
	</xsl:template>
</xsl:stylesheet>