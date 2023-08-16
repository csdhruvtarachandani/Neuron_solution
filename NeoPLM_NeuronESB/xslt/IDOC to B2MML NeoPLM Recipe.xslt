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
						<xsl:value-of select="/ZLOIROU/IDOC/EDI_DC40/SNDPOR"/>
					</LogicalID>
					<ReferenceID>
						<xsl:value-of select="/ZLOIROU/IDOC/EDI_DC40/DOCNUM"/>
					</ReferenceID>
				</Sender>
				<Receiver>
					<LogicalID>
						<xsl:value-of select="/ZLOIROU/IDOC/EDI_DC40/RCVPOR"/>
					</LogicalID>
				</Receiver>
				<CreationDateTime>
					<xsl:value-of select="concat(substring(/ZLOIROU/IDOC/EDI_DC40/CREDAT,1,4),'-',substring(/ZLOIROU/IDOC/EDI_DC40/CREDAT,5,2),'-',substring(/ZLOIROU/IDOC/EDI_DC40/CREDAT,7,2),'T',substring(/ZLOIROU/IDOC/EDI_DC40/CRETIM,1,2),':',substring(/ZLOIROU/IDOC/EDI_DC40/CRETIM,3,2),':',substring(/ZLOIROU/IDOC/EDI_DC40/CRETIM,5,2),'Z')"/>
				</CreationDateTime>
			</ApplicationArea>
			<DataArea>
				<Process acknowledgeCode="Always" />
				<ProductDefinition>
					<ID>Recipe_<xsl:value-of select="concat((ZLOIROU/IDOC/E1MAPLL/PLNNR),'|',(ZLOIROU/IDOC/E1MAPLL/E1MAPAL/PLNAL))"/>
					</ID>
					<HierarchyScope>
						<EquipmentID>
							<xsl:value-of select="ZLOIROU/IDOC/E1MAPLL/WERKS"/>
						</EquipmentID>
						<EquipmentElementLevel>Site</EquipmentElementLevel>
					</HierarchyScope>
					<ProductSegment>
						<ID>
							<xsl:value-of select="concat((ZLOIROU/IDOC/E1MAPLL/PLNNR),'|',(ZLOIROU/IDOC/E1MAPLL/E1MAPAL/PLNAL))"/>
						</ID>
						<Description>
							<xsl:value-of select="ZLOIROU/IDOC/E1MAPLL/E1MAPAL/E1PLKOL/KTEXT "/>
						</Description>
						<Parameter>
							<ID>UnitOfMeasure</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIROU/IDOC/E1MAPLL/E1MAPAL/E1PLKOL/PLNME"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>RecipeLowerLimitQuantity</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIROU/IDOC/E1MAPLL/E1MAPAL/LOSVN"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>RecipeUpperLimitQuantity</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIROU/IDOC/E1MAPLL/E1MAPAL/LOSBS"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>RecipeOperations</ID>
							<xsl:for-each select="ZLOIROU/IDOC/E1MAPLL/E1MAPAL/E1PLKOL/E1PLFLL/E1PLPOL">
								<Parameter>
									<ID>RecipeOperation</ID>
									<Parameter>
										<ID>OperationNumber</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="VORNR"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>SuperiorOperationNumber</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PVZNR"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>PrimaryResourceHumanID</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="ZE1DESC/ARBPL"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>OperationDescription</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="ZE1DESC/LTXA1"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>PrimaryResourceSAPID</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="ARBID"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>ControlKey</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="STEUS"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>RecipeBaseQuantity</ID>
										<Value>
											<ValueString>
												<!--<xsl:value-of select="E1PLPOL[1]/BMSCH"/>-->
												<xsl:value-of select="BMSCH"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>AlternateResources</ID>
										<Parameter>
											<ID>AlternateResource</ID>
											<Parameter>
												<ID>AlternateResourceSAPID</ID>
												<Value>
													<ValueString>
														<xsl:value-of select="E1PORSL/ARBID"/>
													</ValueString>
												</Value>
											</Parameter>
											<Parameter>
												<ID>AlternateResourceHumanID</ID>
												<Value>
													<ValueString>
														<xsl:value-of select="E1PORSL/ZE2DESC/ARBPL"/>
													</ValueString>
												</Value>
											</Parameter>
										</Parameter>
									</Parameter>
									<Parameter>
										<ID>BillOfMaterialItems</ID>
										<xsl:for-each select="E1PLMZL">
											<Parameter>
												<ID>BillOfMaterialItem</ID>
												<Parameter>
													<ID>BOMItemNumber</ID>
													<Value>
														<ValueString>
															<xsl:value-of select="POSNR"/>
														</ValueString>
													</Value>
												</Parameter>
												<Parameter>
													<ID>MaterialNumber</ID>
													<Value>
														<ValueString>
															<xsl:value-of select="IDNRK"/>
														</ValueString>
													</Value>
												</Parameter>
												<Parameter>
													<ID>BillOfMaterialItemQuantity</ID>
													<Value>
														<ValueString>
															<xsl:value-of select="MENGE"/>
														</ValueString>
													</Value>
												</Parameter>
												<Parameter>
													<ID>UnitOfMeasure</ID>
													<Value>
														<ValueString>
															<xsl:value-of select="MEINS"/>
														</ValueString>
													</Value>
												</Parameter>
												<Parameter>
													<ID>BOMAlternateNumber</ID>
													<Value>
														<ValueString>
															<xsl:value-of select="STLAL"/>
														</ValueString>
													</Value>
												</Parameter>
											</Parameter>
										</xsl:for-each>
									</Parameter>
								</Parameter>
							</xsl:for-each>
						</Parameter>
						<MaterialSpecification>
							<MaterialDefinitionID>
								<xsl:value-of select="ZLOIROU/IDOC/E1MAPLL/MATNR"/>
							</MaterialDefinitionID>
						</MaterialSpecification>
					</ProductSegment>
				</ProductDefinition>
			</DataArea>
		</ProcessProductDefinition>
	</xsl:template>
</xsl:stylesheet>