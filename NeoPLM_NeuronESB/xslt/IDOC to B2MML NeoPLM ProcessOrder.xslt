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
						<xsl:value-of select="ZLOIPRO2/IDOC/EDI_DC40/SNDPOR"/>
					</LogicalID>
					<ReferenceID>
						<xsl:value-of select="ZLOIPRO2/IDOC/EDI_DC40/DOCNUM"/>
					</ReferenceID>
				</Sender>
				<Receiver>
					<LogicalID>
						<xsl:value-of select="ZLOIPRO2/IDOC/EDI_DC40/RCVPOR"/>
					</LogicalID>
				</Receiver>
				<CreationDateTime>
					<xsl:value-of select="concat(substring(ZLOIPRO2/IDOC/EDI_DC40/CREDAT,1,4),'-',substring(ZLOIPRO2/IDOC/EDI_DC40/CREDAT,5,2),'-',substring(ZLOIPRO2/IDOC/EDI_DC40/CREDAT,7,2),'T',substring(ZLOIPRO2/IDOC/EDI_DC40/CRETIM,1,2),':',substring(ZLOIPRO2/IDOC/EDI_DC40/CRETIM,3,2),':',substring(ZLOIPRO2/IDOC/EDI_DC40/CRETIM,5,2),'Z')"/>
				</CreationDateTime>
			</ApplicationArea>
			<DataArea>
				<Process acknowledgeCode="Always" />
				<ProductDefinition>
					<ID>
						<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/AUFNR"/>
					</ID>
					<HierarchyScope>
						<EquipmentID>
							<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/WERKS"/>
						</EquipmentID>
						<EquipmentElementLevel>Site</EquipmentElementLevel>
					</HierarchyScope>
					<ProductSegment>
						<ID>
							<!-- <xsl:value-of select="concat((ZLOIPRO2/IDOC/E1MAPLL/PLNNR),'|',(ZLOIPRO2/IDOC/E1MAPLL/E1MAPAL/PLNAL))"/> -->
						</ID>
						<Parameter>
							<ID>OrderType</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/AUART"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>ProductionVersion</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/E1AFPOL/VERID"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>Batch</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/E1AFPOL/ZE1AFPO/CHARG"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>PlannedQuantity</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/GAMNG"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>PlannedQuantityUOM</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/GMEIN"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>ERPStartDate</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/GSTRS"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>ERPStartTime</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/GSUZS"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>ERPEndDate</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/GLTRS"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>ERPEndTime</ID>
							<Value>
								<ValueString>
									<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/GLUZS"/>
								</ValueString>
							</Value>
						</Parameter>
						<Parameter>
							<ID>OrderOperations</ID>
							<xsl:for-each select="ZLOIPRO2/IDOC/E1AFKOL/E1AFFLL/E1AFVOL">
								<Parameter>
									<ID>OrderOperation</ID>
									<Parameter>
										<ID>OperationNumber</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="VORNR"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>ParentOperationNumber</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PVZNR"/>
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
										<ID>SelectedResource</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="ZE1CRHD2/ARBPL"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>AccountingQuantity</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="MGVRG"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>AccountingQuantityUOM</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="MEINH"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>ScheduledOrderStepStartDate</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="SSAVD"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>ScheduledOrderStepStartTime</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="SSAVZ"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>ScheduledOrderStepFinishDate</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="SSEDD"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>ScheduledOrderStepFinishTime</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="SSEDZ"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>OperationDescription</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="LTXA1"/>
											</ValueString>
										</Value>
									</Parameter>
									<Parameter>
										<ID>BillOfMaterialItems</ID>
										<xsl:for-each select="ZE1RESBL">
											<Parameter>
												<ID>BillOfMaterialItem</ID>
												<xsl:if test="POSNR">
													<Parameter>
														<ID>BOMItemNumber</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="POSNR"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="MATNR">
													<Parameter>
														<ID>MaterialNumber</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="MATNR"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="BDMNG">
													<Parameter>
														<ID>Quantity</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="BDMNG"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="MEINS">
													<Parameter>
														<ID>QuantityUOM</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="MEINS"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="RSNUM">
													<Parameter>
														<ID>ReservationNumber</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="RSNUM"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="RSPOS">
													<Parameter>
														<ID>ReservationLine</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="RSPOS"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="ALPGR">
													<Parameter>
														<ID>AlternateItemGroup</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="ALPGR"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="CHARG">
													<Parameter>
														<ID>AllocatedBatch</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="CHARG"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
												<xsl:if test="ZZMESPHANTOM">
													<Parameter>
														<ID>PhantomFlag</ID>
														<Value>
															<ValueString>
																<xsl:value-of select="ZZMESPHANTOM"/>
															</ValueString>
														</Value>
													</Parameter>
												</xsl:if>
											</Parameter>
										</xsl:for-each>
									</Parameter>
								</Parameter>
							</xsl:for-each>
						</Parameter>
						<MaterialSpecification>
							<MaterialDefinitionID>
								<xsl:value-of select="ZLOIPRO2/IDOC/E1AFKOL/MATNR"/>
							</MaterialDefinitionID>
						</MaterialSpecification>
					</ProductSegment>
				</ProductDefinition>
			</DataArea>
		</ProcessProductDefinition>
	</xsl:template>
</xsl:stylesheet>