<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="ns0 xs fn"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:local="urn:local"
    extension-element-prefixes="msxsl">

	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"
        omit-xml-declaration="yes" />
	<xsl:template match="/">
		<ProcessOperationsPerformance xmlns="http://www.mesa.org/xml/B2MML-V0600"
            xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" releaseID="B2MML-V0600"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema">
			<ApplicationArea>
				<Sender>
					<LogicalID>Dummy <!-- <xsl:value-of
                        select="OrderStepCompletions/MessageHeader/SourceSystemID" /> -->
					</LogicalID>
					<ReferenceID>Dummy <!-- <xsl:value-of
                        select="OrderStepCompletions/MessageHeader/TransactionID"
                        /> -->
					</ReferenceID>
				</Sender>
				<Receiver>
					<LogicalID>Dummy <!-- <xsl:value-of
                        select="OrderStepCompletions/MessageHeader/DestinationSystemID" /> -->
					</LogicalID>
				</Receiver>
				<CreationDateTime>2022-06-17T06:15:54Z <!-- <xsl:value-of
                    select="OrderStepCompletions/MessageHeader/TransactionDateTime" /> -->
				</CreationDateTime>
			</ApplicationArea>
			<DataArea>
				<Process acknowledgeCode="Always" />
				<xsl:for-each select="OrderStepCompletion">
					<OperationsPerformance>
						<ID>
							<xsl:value-of select="ID" />
						</ID>
						<HierarchyScope>
							<EquipmentID>
								<xsl:value-of select="Plant" />
							</EquipmentID>
							<EquipmentElementLevel>WorkCell</EquipmentElementLevel>
						</HierarchyScope>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_EVENT_DATE</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_EVENT_DATE" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>DATE</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_EVENT_TIME</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_EVENT_TIME" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>TIME</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_PROCESS_ORDER</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_PROCESS_ORDER" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>CHAR</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_PHASE</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_PHASE" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>CHAR</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_STATUS_CONFIRMED</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_STATUS_CONFIRMED" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>CHAR</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_CLEAR_RESERVATIONS</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_CLEAR_RESERVATIONS" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>CHAR</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_CONFIRMATION_SHORT_TEXT</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_CONFIRMATION_SHORT_TEXT" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>CHAR</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_YIELD_TO_CONFIRM</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_YIELD_TO_CONFIRM" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>NUM</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_UNIT_OF_MEASURE</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_UNIT_OF_MEASURE" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>CHAR</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_START_DATE</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_START_DATE" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>DATE</UnitOfMeasure>
										</Quantity>
									</MaterialActualProperty>
								</MaterialActual>
							</SegmentResponse>
						</OperationsResponse>

						<OperationsResponse>
							<ID>
								<xsl:value-of select="ID" />
							</ID>
							<SegmentResponse>
								<MaterialActual>
									<MaterialActualProperty>
										<ID>PPPI_START_TIME</ID>
										<Value>
											<ValueString>
												<xsl:value-of select="PPPI_START_TIME" />
											</ValueString>
										</Value>
										<Quantity>
											<QuantityString />
											<UnitOfMeasure>TIME</UnitOfMeasure>
										</Quantity>
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