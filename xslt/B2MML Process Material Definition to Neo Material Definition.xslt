﻿<?xml version="1.0" encoding="UTF-16"?>
<!--
This file was generated by Altova MapForce 2017

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://www.mesa.org/xml/B2MML-V0600" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="ns0 xs">
	<xsl:output method="xml" encoding="UTF-16" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="var1_initial" select="."/>
		<NeoLocalMaterialSpecificationOrConsumableCollection xmlns="http://NeoPLM.com/Integration/Materials">
			<xsl:for-each select="ns0:ProcessMaterialDefinition">
				<xsl:variable name="var2_cur" select="."/>
				<MessageHeader>
					<xsl:for-each select="ns0:ApplicationArea/ns0:Sender/ns0:LogicalID">
						<xsl:variable name="var3_cur" select="."/>
						<SourceSystemID> 
							<xsl:value-of select="."/>
						</SourceSystemID>
					</xsl:for-each>
					<xsl:for-each select="ns0:ApplicationArea/ns0:Receiver/ns0:LogicalID">
						<xsl:variable name="var4_cur" select="."/>
						<DestinationSystemID>
							<xsl:value-of select="."/>
						</DestinationSystemID>
					</xsl:for-each>
					<xsl:for-each select="ns0:ApplicationArea/ns0:Sender/ns0:ReferenceID">
						<xsl:variable name="var5_cur" select="."/>
						<TransactionID>
							<xsl:value-of select="."/>
						</TransactionID>
					</xsl:for-each>
					<TransactionDateTime>
						<xsl:value-of select="ns0:ApplicationArea/ns0:CreationDateTime"/>
					</TransactionDateTime>
				</MessageHeader>
			</xsl:for-each>
			<NeoLocalMaterialSpecifications>
			<xsl:for-each select="ns0:ProcessMaterialDefinition/ns0:DataArea/ns0:MaterialDefinition">
				<xsl:variable name="var6_cur" select="."/>
				<NeoLocalMaterialSpecification>
					<xsl:for-each select="ns0:HierarchyScope">
						<xsl:variable name="var7_cur" select="."/>
						<PlantCodeID>
							<xsl:value-of select="ns0:EquipmentID"/>
						</PlantCodeID>
					</xsl:for-each>
					<MaterialID>
						<xsl:value-of select="ns0:ID"/>
					</MaterialID>
					<xsl:for-each select="ns0:Description">
						<xsl:variable name="var8_cur" select="."/>
						<Description>
							<xsl:value-of select="."/>
						</Description>
					</xsl:for-each>
					<xsl:for-each select="(./ns0:MaterialDefinitionProperty)[(ns0:ID = 'InventoryUOM')]">
						<xsl:variable name="var9_filter" select="."/>
						<xsl:if test="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
							<InventoryUnitofMeasure>
								<xsl:for-each select="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
									<xsl:variable name="var10_cur" select="."/>
									<xsl:value-of select="ns0:ValueString"/>
								</xsl:for-each>
							</InventoryUnitofMeasure>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="./ns0:MaterialDefinitionProperty">
						<xsl:if test="ns0:ID='IsDeprecated'">
							<IsDeprecated>
                  				<xsl:value-of select="./ns0:Value/ns0:ValueString" />
                			</IsDeprecated>
              			</xsl:if>
            		</xsl:for-each>
					<xsl:for-each select="(./ns0:MaterialDefinitionProperty)[(ns0:ID = 'MaterialType')]">
						<xsl:variable name="var11_filter" select="."/>
						<xsl:if test="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
							<MaterialType>
								<xsl:for-each select="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
									<xsl:variable name="var12_cur" select="."/>
									<xsl:value-of select="ns0:ValueString"/>
								</xsl:for-each>
							</MaterialType>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="(./ns0:MaterialDefinitionProperty)[(ns0:ID = 'FirstEffectiveDate')]">
						<xsl:variable name="var13_filter" select="."/>
						<xsl:if test="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
							<EffectivityStartDate>
								<xsl:for-each select="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
									<xsl:variable name="var14_cur" select="."/>
									<xsl:value-of select="ns0:ValueString"/>
								</xsl:for-each>
							</EffectivityStartDate>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="(./ns0:MaterialDefinitionProperty)[(ns0:ID = 'LastEffectiveDate')]">
						<xsl:variable name="var15_filter" select="."/>
						<xsl:if test="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
							<EffectivityEndDate>
								<xsl:for-each select="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
									<xsl:variable name="var16_cur" select="."/>
									<xsl:value-of select="ns0:ValueString"/>
								</xsl:for-each>
							</EffectivityEndDate>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="(./ns0:MaterialDefinitionProperty)[(ns0:ID = 'GlobalMaterialSpecificationID')]">
						<xsl:variable name="var17_filter" select="."/>
						<xsl:if test="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
							<NeoGlobalMaterialSpecificationID>
								<xsl:for-each select="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
									<xsl:variable name="var18_cur" select="."/>
									<xsl:value-of select="ns0:ValueString"/>
								</xsl:for-each>
							</NeoGlobalMaterialSpecificationID>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="(./ns0:MaterialDefinitionProperty)[(ns0:ID = 'GlobalMaterialSpecificationDescription')]">
						<xsl:variable name="var19_filter" select="."/>
						<xsl:if test="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
							<NeoPLMGlobalSpecificationDescription>
								<xsl:for-each select="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
									<xsl:variable name="var20_cur" select="."/>
									<xsl:value-of select="ns0:ValueString"/>
								</xsl:for-each>
							</NeoPLMGlobalSpecificationDescription>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="(./ns0:MaterialDefinitionProperty)[(ns0:ID = 'Density')]">
						<xsl:variable name="var21_filter" select="."/>
						<Parameter>
							<Name>
								<xsl:value-of select="ns0:ID"/>
							</Name>
							<xsl:for-each select="ns0:Description">
								<xsl:variable name="var22_cur" select="."/>
								<Description>
									<xsl:value-of select="."/>
								</Description>
							</xsl:for-each>
							<xsl:if test="(ns0:ID = 'Density')">
								<xsl:if test="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
									<ValueDouble>
										<xsl:for-each select="(./ns0:Value)[not((translate(ns0:ValueString/@xsi:nil, 'true ', '1') = '1'))]">
											<xsl:variable name="var23_cur" select="."/>
											<xsl:value-of select="ns0:ValueString"/>
										</xsl:for-each>
									</ValueDouble>
								</xsl:if>
							</xsl:if>
							<xsl:for-each select="ns0:Value/ns0:UnitOfMeasure">
								<xsl:variable name="var24_cur" select="."/>
								<UnitOfMeasure>
									<xsl:if test="not((translate(@xsi:nil, 'true ', '1') = '1'))">
										<xsl:value-of select="."/>
									</xsl:if>
								</UnitOfMeasure>
							</xsl:for-each>
						</Parameter>
					</xsl:for-each>
				</NeoLocalMaterialSpecification>
			</xsl:for-each>
		</NeoLocalMaterialSpecifications>
		</NeoLocalMaterialSpecificationOrConsumableCollection>
	</xsl:template>
</xsl:stylesheet>
