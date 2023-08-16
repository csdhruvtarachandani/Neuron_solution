<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ns="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 xs fn">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"
		omit-xml-declaration="yes" />
	<xsl:template match="/">

		<xsl:variable name="inspectionLotID">
			<xsl:for-each
				select="/ns:ProcessMaterialLot/ns:DataArea/ns:MaterialLot/ns:MaterialLotProperty">
				<xsl:if test="ns:ID='InspectionLotID'">
					<xsl:value-of select="ns:Value/ns:ValueString" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<ns0:NeoPlmLimsMaterialLot
			xmlns:ns0="http://NeoPLM.LIMS.MaterialLot">
			<xsl:if
				test="string-length(/ns:ProcessMaterialLot/ns:ApplicationArea/ns:Sender/ns:LogicalID) &gt; 0">
				<ErpSourceSystemID>
					<xsl:value-of
						select="/ns:ProcessMaterialLot/ns:ApplicationArea/ns:Sender/ns:LogicalID" />
				</ErpSourceSystemID>
			</xsl:if>
			<xsl:if
				test="string-length(/ns:ProcessMaterialLot/ns:ApplicationArea/ns:Sender/ns:LogicalID) &gt; 0">
				<LimsSourceSystemID>
					<xsl:value-of
						select="/ns:ProcessMaterialLot/ns:ApplicationArea/ns:Sender/ns:LogicalID" />
				</LimsSourceSystemID>
			</xsl:if>
			<TransactionDateTime>
				<xsl:value-of select="/ns:ProcessMaterialLot/ns:ApplicationArea/ns:CreationDateTime" />
			</TransactionDateTime>
			<TransactionID>
				<xsl:value-of
					select="/ns:ProcessMaterialLot/ns:ApplicationArea/ns:Sender/ns:ReferenceID" />
			</TransactionID>
			<NeoPLMLabHistories>
				<xsl:for-each select="/ns:ProcessMaterialLot/ns:DataArea/ns:MaterialLot">
					<xsl:for-each select="ns:MaterialLotProperty">
						<xsl:if test="ns:ID='TestInstanceID'">

							<!--***************************BEGIN
							LAB HISTORY************************-->

							<NeoPLMLabHistory>
								<PlantID>
									<xsl:value-of select="../ns:HierarchyScope/ns:EquipmentID" />
								</PlantID>
								<MaterialID>
									<xsl:value-of select="../ns:MaterialDefinitionID" />
								</MaterialID>
								<MaterialLotID>
									<xsl:value-of select="../ns:ID" />
								</MaterialLotID>
								<!-- <xsl:if test="string-length($inspectionLotID) &gt; 0">
                  <InspectionLotID>
                    <xsl:value-of select="$inspectionLotID" />
                  </InspectionLotID>
                </xsl:if>  -->
								<TestTemplateID>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='TestTemplateID'">
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:if>
									</xsl:for-each>
								</TestTemplateID>
								<SampleStatus>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='SampleStatus'">
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:if>
									</xsl:for-each>
								</SampleStatus>
								<LabSampleLastModified>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='LabSampleLastModified'">
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:if>
									</xsl:for-each>
								</LabSampleLastModified>
								<!-- <SampleAdditionalData>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='SampleAdditionalData'">
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:if>
									</xsl:for-each>
								</SampleAdditionalData>  -->
								<TestTemplateDescription>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='TestTemplateDescription'">
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:if>
									</xsl:for-each>
								</TestTemplateDescription>
								<TestTemplateType>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='TestTemplateType'">
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:if>
									</xsl:for-each>
								</TestTemplateType>
								<TestTemplateVersion>
									<xsl:for-each select="ns:MaterialLotProperty">
										<xsl:if test="ns:ID='TestTemplateVersion'">
											<xsl:value-of select="ns:Value/ns:ValueString" />
										</xsl:if>
									</xsl:for-each>
								</TestTemplateVersion>

								<!--***************************BEGIN
								LAB SAMPLE HISTORY************************-->
								<LabSampleHistories>
									<LabSampleHistory>
										<SampleID>
											<xsl:for-each select="ns:MaterialLotProperty">
												<xsl:if test="ns:ID='SampleID'">
													<xsl:value-of select="ns:Value/ns:ValueString" />
												</xsl:if>
											</xsl:for-each>
										</SampleID>
										<xsl:for-each select="ns:MaterialLotProperty">
											<xsl:if test="ns:ID='ControlPointID'">
												<ControlPointID>
													<xsl:value-of select="ns:Value/ns:ValueString" />
												</ControlPointID>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="ns:MaterialLotProperty">
											<xsl:if test="ns:ID='ControlPointDescription'">
												<ControlPointDescription>
													<xsl:value-of select="ns:Value/ns:ValueString" />
												</ControlPointDescription>
											</xsl:if>
										</xsl:for-each>

										<!--*************************BEGIN
										LAB TEST HISTORY**************-->
										<LabTestHistories>
											<LabTestHistory>
												<TestID>
													<xsl:value-of select="ns:Value/ns:ValueString" />
												</TestID>
												<xsl:for-each select="ns:MaterialLotProperty">
													<xsl:if test="ns:ID='TestInstanceDescription'">
														<TestDescription>
															<xsl:value-of
																select="ns:Value/ns:ValueString" />
														</TestDescription>
													</xsl:if>
												</xsl:for-each>
												<TestMethodID>
													<xsl:for-each select="ns:MaterialLotProperty">
														<xsl:if test="ns:ID='TestMethodID'">
															<xsl:value-of
																select="ns:Value/ns:ValueString" />
														</xsl:if>
													</xsl:for-each>
												</TestMethodID>
												<TestStatus>
													<xsl:for-each select="ns:MaterialLotProperty">
														<xsl:if test="ns:ID='TestStatus'">
															<xsl:value-of
																select="ns:Value/ns:ValueString" />
														</xsl:if>
													</xsl:for-each>
												</TestStatus>
												<xsl:for-each select="ns:MaterialLotProperty">
													<xsl:if test="ns:ID='TestMethodVersion'">
														<TestMethodVersion>
															<xsl:value-of
																select="ns:Value/ns:ValueString" />
														</TestMethodVersion>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="ns:MaterialLotProperty">
													<xsl:if test="ns:ID='TestMethodDescription'">
														<TestMethodDescription>
															<xsl:value-of
																select="ns:Value/ns:ValueString" />
														</TestMethodDescription>
													</xsl:if>
												</xsl:for-each>
												<!-- <xsl:for-each select="ns:MaterialLotProperty">
                          <xsl:if test="ns:ID='TestIsOptional'">
                            <TestIsOptional>
                              <xsl:value-of select="translate(ns:Value/ns:ValueString,&#xD;&#xA;
												'ABCDEFGHIJKLMNOPQRSTUVWXYZ',&#xD;&#xA;
												'abcdefghijklmnopqrstuvwxyz')" />
                            </TestIsOptional>
                          </xsl:if>
                        </xsl:for-each> -->


												<!--*************************BEGIN
												LAB RESULT HISTORY**************-->
												<xsl:for-each select="ns:MaterialLotProperty">
													<xsl:if test="ns:ID='TestResults'">
														<LabResultHistories>
															<LabResultHistory>
																<TestResultID>
																	<xsl:value-of
																		select="ns:MaterialLotProperty/ns:ID" />
																</TestResultID>
																<xsl:for-each
																	select="ns:MaterialLotProperty">

																	<!-- <TestResultStatus>
																		<xsl:for-each select="ns:MaterialLotProperty">
																			<xsl:if test="ns:ID='ActualTestResults'">
																				<xsl:for-each select="ns:MaterialLotProperty">
																					<xsl:if test="ns:ID='ActualResultSummary'">
																						<xsl:value-of select="translate(ns:Value/ns:ValueString,&#xD;&#xA;
																	'abcdefghijklmnopqrstuvwxyz',&#xD;&#xA;
																	'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
																	/>
																					</xsl:if>
																				</xsl:for-each>
																			</xsl:if>
																		</xsl:for-each>
																	</TestResultStatus>  -->


																	<!--*********************EXPECTED
																	RESULT
																	BUILDER****************-->
																	<!-- <xsl:variable
																	name="AcceptanceCriterionValue1">
                                    <xsl:for-each select="ns:MaterialLotProperty">
                                      <xsl:if test="ns:ID='ExpectedTestResult'">
                                        <xsl:for-each select="ns:MaterialLotProperty">
                                          <xsl:if test="ns:ID='AcceptanceCriterionValue1'">
                                            <xsl:value-of select="ns:Value/ns:ValueString" />
                                          </xsl:if>
                                        </xsl:for-each>
                                      </xsl:if>
                                    </xsl:for-each>
                                  </xsl:variable>
                                  <xsl:variable name="AcceptedCriterionOperator1">
                                    <xsl:for-each select="ns:MaterialLotProperty">
                                      <xsl:if test="ns:ID='ExpectedTestResult'">
                                        <xsl:for-each select="ns:MaterialLotProperty">
                                          <xsl:if test="ns:ID='AcceptanceCriterionOperator1'">
                                            <xsl:if test="ns:Value/ns:ValueString='GT'">&gt;</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='GE'">&gt;=</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='LT'">&lt;</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='LE'">&lt;=</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='E'">=</xsl:if>
                                          </xsl:if>
                                        </xsl:for-each>
                                      </xsl:if>
                                    </xsl:for-each>
                                  </xsl:variable>
                                  <xsl:variable name="AcceptedCriterionOperator2">
                                    <xsl:for-each select="ns:MaterialLotProperty">
                                      <xsl:if test="ns:ID='ExpectedTestResult'">
                                        <xsl:for-each select="ns:MaterialLotProperty">
                                          <xsl:if test="ns:ID='AcceptanceCriterionOperator2'">
                                            <xsl:if test="ns:Value/ns:ValueString='GT'">&gt;</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='GE'">&gt;=</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='LT'">&lt;</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='LE'">&lt;=</xsl:if>
                                            <xsl:if test="ns:Value/ns:ValueString='E'">=</xsl:if>
                                          </xsl:if>
                                        </xsl:for-each>
                                      </xsl:if>
                                    </xsl:for-each>
                                  </xsl:variable>
                                  <xsl:variable name="AcceptanceCriterionValue2">
                                    <xsl:for-each select="ns:MaterialLotProperty">
                                      <xsl:if test="ns:ID='ExpectedTestResult'">
                                        <xsl:for-each select="ns:MaterialLotProperty">
                                          <xsl:if test="ns:ID='AcceptanceCriterionValue2'">
                                            <xsl:value-of select="ns:Value/ns:ValueString" />
                                          </xsl:if>
                                        </xsl:for-each>
                                      </xsl:if>
                                    </xsl:for-each>
                                  </xsl:variable>
                                  <xsl:variable name="AcceptanceCriterionUOM">
                                    <xsl:for-each select="ns:MaterialLotProperty">
                                      <xsl:if test="ns:ID='ExpectedTestResult'">
                                        <xsl:value-of
																	select="ns:MaterialLotProperty[ns:ID='AcceptanceCriterionValue1']/ns:Value/ns:UnitOfMeasure[text()]&#xD;&#xA;
																	|&#xD;&#xA;
																	ns:MaterialLotProperty[ns:ID='AcceptanceCriterionValue2']/ns:Value/ns:UnitOfMeasure&#xD;&#xA;
																	[not(ns:MaterialLotProperty[ns:ID='AcceptanceCriterionValue1']/ns:Value/ns:UnitOfMeasure[text()])]&#xD;&#xA;
																	" />
                                      </xsl:if>
                                    </xsl:for-each>
                                  </xsl:variable> -->
																	<ExpectedResult>
																		<xsl:for-each
																			select="ns:MaterialLotProperty">
																			<xsl:if
																				test="ns:ID='ExpectedResult'">
																				<xsl:value-of
																					select="ns:Value/ns:ValueString" />
																			</xsl:if>
																		</xsl:for-each>
																	</ExpectedResult>
																	<xsl:for-each
																		select="ns:MaterialLotProperty">
																		<xsl:if
																			test="ns:ID='ActualTestResults'">
																			<EnteredResult>
																				<xsl:for-each
																					select="ns:MaterialLotProperty">
																					<xsl:if
																						test="ns:ID='EnteredResultValue'">
																						<xsl:value-of
																							select="ns:Value/ns:ValueString" />
																					</xsl:if>
																				</xsl:for-each>
																			</EnteredResult>
																			<TestResultDescription>
																				<xsl:for-each
																					select="ns:MaterialLotProperty">
																					<xsl:if
																						test="ns:ID='TestResultDescription'">
																						<xsl:value-of
																							select="ns:Value/ns:ValueString" />
																					</xsl:if>
																				</xsl:for-each>
																			</TestResultDescription>
																			<xsl:for-each
																				select="ns:MaterialLotProperty">
																				<xsl:if
																					test="ns:ID='ActualResultSummary'">
																					<TestResultStatus>
																						<xsl:value-of
																							select="ns:Value/ns:ValueString" />
																					</TestResultStatus>
																				</xsl:if>
																			</xsl:for-each>
																			<xsl:for-each
																				select="ns:MaterialLotProperty">
																				<xsl:if
																					test="ns:ID='EnteredResultOperator'">
																					<xsl:if
																						test="string-length(ns:Value/ns:ValueString) &gt; 0">
																						<!--
																						<EnteredResultOperator>
                                              <xsl:value-of select="ns:Value/ns:ValueString" />
                                            </EnteredResultOperator>  -->
																					</xsl:if>
																				</xsl:if>
																			</xsl:for-each>
																			<DisplayResult>
																				<xsl:for-each
																					select="ns:MaterialLotProperty">
																					<xsl:if
																						test="ns:ID='EnteredResultValue'">
																						<xsl:value-of
																							select="ns:Value/ns:ValueString" />
																					</xsl:if>
																				</xsl:for-each>
																			</DisplayResult>
																			<!-- <xsl:for-each
																			select="ns:MaterialLotProperty">
                                        <xsl:if test="ns:ID='DisplayedResultOperator'">
                                          <xsl:if test="string-length(ns:Value/ns:ValueString) &gt; 0">
                                            <DisplayResultOperator>
                                              <xsl:value-of select="ns:Value/ns:ValueString" />
                                            </DisplayResultOperator>
                                          </xsl:if>
                                        </xsl:if>
                                      </xsl:for-each>  -->
																			<xsl:for-each
																				select="ns:MaterialLotProperty">
																				<xsl:if
																					test="ns:ID='EnteredResultValue'">
																					<EnteredResultUOM>
																						<xsl:value-of
																							select="ns:Value/ns:UnitOfMeasure" />
																					</EnteredResultUOM>
																				</xsl:if>
																			</xsl:for-each>
																			<!--
																			<TestResultInstanceNumber>
                                        <xsl:for-each select="ns:MaterialLotProperty">
                                          <xsl:if test="ns:ID='ActualResultInstanceNumber'">
                                            <xsl:value-of select="ns:Value/ns:ValueString" />
                                          </xsl:if>
                                        </xsl:for-each>
                                      </TestResultInstanceNumber>
                                      <IsFinalResult>
                                        <xsl:for-each select="ns:MaterialLotProperty">
                                          <xsl:if test="ns:ID='IsFinalResult'">
                                            <xsl:value-of select="translate(ns:Value/ns:ValueString,&#xD;&#xA;
																			'ABCDEFGHIJKLMNOPQRSTUVWXYZ',&#xD;&#xA;
																			'abcdefghijklmnopqrstuvwxyz')"
																			/>
                                          </xsl:if>
                                        </xsl:for-each>
                                      </IsFinalResult>  -->
																			<ResultDateTime>
																				<xsl:for-each
																					select="ns:MaterialLotProperty">
																					<xsl:if
																						test="ns:ID='ActualTestResultDateTime'">
																						<xsl:value-of
																							select="ns:Value/ns:ValueString" />
																					</xsl:if>
																				</xsl:for-each>
																			</ResultDateTime>
																		</xsl:if>
																	</xsl:for-each>
																	<!-- <xsl:for-each
																	select="ns:MaterialLotProperty">
                                    <xsl:if test="ns:ID='ExpectedTestResult'">
                                      <xsl:for-each select="ns:MaterialLotProperty">
                                        <xsl:if test="ns:ID='AcceptedCriterionOperator1'">
                                          <xsl:if test="string-length(ns:Value/ns:ValueString) &gt; 0">
                                            <Operator1>
                                              <xsl:value-of select="ns:Value/ns:ValueString" />
                                            </Operator1>
                                          </xsl:if>
                                        </xsl:if>
                                      </xsl:for-each>
                                    </xsl:if>
                                  </xsl:for-each>
                                  <xsl:for-each select="ns:MaterialLotProperty">
                                    <xsl:if test="ns:ID='ExpectedTestResult'">
                                      <xsl:for-each select="ns:MaterialLotProperty">
                                        <xsl:if test="ns:ID='AcceptedCriterionOperator2'">
                                          <xsl:if test="string-length(ns:Value/ns:ValueString) &gt; 0">
                                            <Operator2>
                                              <xsl:value-of select="ns:Value/ns:ValueString" />
                                            </Operator2>
                                          </xsl:if>
                                        </xsl:if>
                                      </xsl:for-each>
                                    </xsl:if>
                                  </xsl:for-each>  -->
																</xsl:for-each>
															</LabResultHistory>
														</LabResultHistories>
													</xsl:if>
												</xsl:for-each>
											</LabTestHistory>
										</LabTestHistories>
									</LabSampleHistory>
								</LabSampleHistories>
							</NeoPLMLabHistory>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			</NeoPLMLabHistories>
		</ns0:NeoPlmLimsMaterialLot>
	</xsl:template>
</xsl:stylesheet>