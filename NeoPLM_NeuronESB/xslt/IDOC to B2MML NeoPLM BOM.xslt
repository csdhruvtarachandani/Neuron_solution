<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs fn"  
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:local="urn:local" extension-element-prefixes="msxsl">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<ProcessProductDefinition xmlns="http://www.mesa.org/xml/B2MML-V0600" xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" releaseID="B2MML-V0600" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
			<ApplicationArea>
				<Sender>
					<LogicalID>
						<xsl:value-of select="/ZBOMMAT/IDOC/EDI_DC40/SNDPOR"/>
					</LogicalID>
					<ReferenceID>
						<xsl:value-of select="/ZBOMMAT/IDOC/EDI_DC40/DOCNUM"/>
					</ReferenceID>
				</Sender>
				<Receiver>
					<LogicalID>
						<xsl:value-of select="/ZBOMMAT/IDOC/EDI_DC40/RCVPOR"/>
					</LogicalID>
				</Receiver>
				<CreationDateTime>
					<xsl:value-of select="concat(substring(/ZBOMMAT/IDOC/EDI_DC40/CREDAT,1,4),'-',substring(/ZBOMMAT/IDOC/EDI_DC40/CREDAT,5,2),'-',substring(/ZBOMMAT/IDOC/EDI_DC40/CREDAT,7,2),'T',substring(/ZBOMMAT/IDOC/EDI_DC40/CRETIM,1,2),':',substring(/ZBOMMAT/IDOC/EDI_DC40/CRETIM,3,2),':',substring(/ZBOMMAT/IDOC/EDI_DC40/CRETIM,5,2),'Z')"/>
				</CreationDateTime>
			</ApplicationArea>
			<DataArea>
				<Process acknowledgeCode="Always" />
				<ProductDefinition>
					<ID>BOM_<xsl:value-of select="concat((ZBOMMAT/IDOC/E1STZUM/E1MASTM/MATNR),'|',(ZBOMMAT/IDOC/E1STZUM/E1MASTM/STLAL))"/>
					</ID>
					<HierarchyScope>
						<EquipmentID>
							<xsl:value-of select="ZBOMMAT/IDOC/E1STZUM/E1MASTM/WERKS"/>
						</EquipmentID>
						<EquipmentElementLevel>Site</EquipmentElementLevel>
					</HierarchyScope>
					<ManufacturingBill>
						<ID>
							<xsl:value-of select="/ZBOMMAT/IDOC/E1STZUM/E1MASTM/STLAL"/>
						</ID>
						<Description>
							<xsl:value-of select="/ZBOMMAT/IDOC/E1STZUM/E1STKOM/STKTX"/>
						</Description>
						<MaterialDefinitionID>
							<xsl:value-of select="ZBOMMAT/IDOC/E1STZUM/E1MASTM/MATNR"/>
						</MaterialDefinitionID>
						<Quantity>
							<QuantityString>
								<xsl:value-of select="/ZBOMMAT/IDOC/E1STZUM/E1STKOM/BMENG_C"/>
							</QuantityString>
							<UnitOfMeasure>
								<xsl:value-of select="/ZBOMMAT/IDOC/E1STZUM/E1STKOM/BMEIN"/>
							</UnitOfMeasure>
						</Quantity>
						<AssemblyManufacturingBill>
							<ID>BOMUsage</ID>
							<Description>
								<xsl:value-of select="/ZBOMMAT/IDOC/E1STZUM/E1MASTM/STLAN"/>
							</Description>
						</AssemblyManufacturingBill>
						<AssemblyManufacturingBill>
							<ID>ValidFromDate</ID>
							<Description>
								<xsl:value-of select="/ZBOMMAT/IDOC/E1STZUM/E1STKOM/DATUV"/>
							</Description>
						</AssemblyManufacturingBill>
						<AssemblyManufacturingBill>
							<ID>Deprecated</ID>
							<Description>
								<xsl:value-of select="/ZBOMMAT/IDOC/E1STZUM/E1STKOM/LOEKZ"/>
							</Description>
						</AssemblyManufacturingBill>
						<AssemblyManufacturingBill>
							<ID>BIllOfMaterialItems</ID>

							<xsl:for-each select="/ZBOMMAT/IDOC/E1STZUM/E1STPOM">

								<AssemblyManufacturingBill>
									<ID>BIllOfMaterialItem</ID>
									<MaterialClassID>
										<xsl:value-of select="POSTP"/>
									</MaterialClassID>
									<MaterialDefinitionID>
										<xsl:value-of select="IDNRK"/>
									</MaterialDefinitionID>

									<AssemblyManufacturingBill>
										<ID>RecipeQuantity</ID>
										<Description>
											<xsl:value-of select="MENGE_C"/>
										</Description>
									</AssemblyManufacturingBill>
									<AssemblyManufacturingBill>
										<ID>RecipeUnitOfMeasure</ID>
										<Description>
											<xsl:value-of select="MEINS"/>
										</Description>
									</AssemblyManufacturingBill>
									<AssemblyManufacturingBill>
										<ID>AlternateGroupID</ID>
										<Description>
											<xsl:value-of select="ALPGR"/>
										</Description>
									</AssemblyManufacturingBill>
									<AssemblyManufacturingBill>
										<ID>LotSizeIndependentFlag</ID>
										<Description>
											<xsl:value-of select="FMENG"/>
										</Description>
									</AssemblyManufacturingBill>
									<AssemblyManufacturingBill>
										<ID>AlterItemUsageProbability</ID>
										<Description>
											<xsl:value-of select="EWAHR"/>
										</Description>
									</AssemblyManufacturingBill>
									<xsl:if test = "SCHGT/text()">
										<AssemblyManufacturingBill>
											<ID>IsBulkMaterial</ID>
											<Description>true</Description>
										</AssemblyManufacturingBill>
									</xsl:if>
									<AssemblyManufacturingBill>
										<ID>IsCoProduct</ID>
										<Description>
											<xsl:value-of select="KZKUP"/>
										</Description>
									</AssemblyManufacturingBill>
									<AssemblyManufacturingBill>
										<ID>BillOfMaterialItemExtension</ID>
										<AssemblyManufacturingBill>
											<ID>WeighingType</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZWAYTYP"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>WeightMaterialType</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZWMMATT"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>CompensatorFixedRatioValue</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZFXRAT"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>DefaultTolerance</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZDEFTOL"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>UpperTolerencePct</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZBOMUD"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>LowerTolerencePct</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZBOMLD"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>NumberOfBatches</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZBTCHNUM"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>LinkedBOMItemNumber</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZLKBMNM"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>BatchWeightConstant</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZBCHWC"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>PrimaryPotency</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZPRIMPT"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>PrimaryPotencyUOM</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZPRIMUOM"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>SecondaryPotency</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZALTPOT"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>SecondaryPotencyUOM</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZALTUOM"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>PrimaryPotencyUpperLimit</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESPPOTUL"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>PrimaryPotencyLowerLimit</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESPPOTLL"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>PrimaryPotencyCalculated</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESPPOTCA"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>PrimaryPotencyCalculatedUOM</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESPPOTUOM"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>SecondaryPotencyUpperLimit</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESSPOTUL"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>SecondaryPotencyLowerLimit</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESSPOTLL"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>SecondaryPotencyCalculated</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESSPOTCA"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>SecondaryPotencyCalculatedUOM</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESSPOTUOM"/>
											</Description>
										</AssemblyManufacturingBill>
										<AssemblyManufacturingBill>
											<ID>PhantomBOMMember</ID>
											<Description>
												<xsl:value-of select="ZE1MESBOM/ZZMESPHANTOM"/>
											</Description>
										</AssemblyManufacturingBill>
									</AssemblyManufacturingBill>
									<BillOfMaterialID>
										<xsl:value-of select="POSNR"/>
									</BillOfMaterialID>
								</AssemblyManufacturingBill>
							</xsl:for-each>
						</AssemblyManufacturingBill>
					</ManufacturingBill>
				</ProductDefinition>
			</DataArea>
		</ProcessProductDefinition>
	</xsl:template>
</xsl:stylesheet>