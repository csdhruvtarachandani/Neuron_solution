<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 xs fn">
    <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/"> 
        <xsl:variable name="var1_initial" select="." />
        <ConfirmBOD xmlns="http://www.mesa.org/xml/B2MML-V0600"
            xmlns:Extended="http://www.mesa.org/xml/B2MML-V0600-AllExtensions">
            <ApplicationArea>
                <Sender>
                    <xsl:for-each select="ns:ProcessProductDefinition/ns:ApplicationArea/ns:Receiver/ns:LogicalID">
                        <xsl:variable name="var2_current" select="." />
                        <LogicalID>
                            <xsl:copy-of select="@node()" />
                            <xsl:copy-of select="node()" />
                        </LogicalID>
                    </xsl:for-each>
                </Sender>
                <Receiver>
                    <xsl:for-each select="ns:ProcessProductDefinition/ns:ApplicationArea/ns:Sender/ns:LogicalID">
                        <xsl:variable name="var3_current" select="." />
                        <LogicalID>
                            <xsl:copy-of select="@node()" />
                            <xsl:copy-of select="node()" />
                        </LogicalID>
                    </xsl:for-each>
                </Receiver>
                <xsl:for-each select="ns:ProcessProductDefinition">
                    <xsl:variable name="var4_current" select="." />
                    <CreationDateTime>
                        <xsl:copy-of select="ns:ApplicationArea/ns:CreationDateTime/@node()" />
                        <xsl:copy-of select="ns:ApplicationArea/ns:CreationDateTime/node()" />
                    </CreationDateTime>
                </xsl:for-each>
            </ApplicationArea>
            <DataArea>
                <Confirm>
                    <xsl:for-each select="ns:ProcessProductDefinition">
                        <xsl:variable name="var5_current" select="." />
                        <OriginalApplicationArea>
                            <xsl:copy-of select="ns:ApplicationArea/@node()" />
                            <xsl:copy-of select="ns:ApplicationArea/node()" />
                        </OriginalApplicationArea>
                    </xsl:for-each>
                    <ResponseCriteria>
                        <ResponseExpression>
                            <xsl:attribute name="actionCode" namespace="">Accepted</xsl:attribute>
                        </ResponseExpression>
                    </ResponseCriteria>
                </Confirm>
                <BOD>
                    <xsl:for-each select="ns:ProcessProductDefinition">
                        <xsl:variable name="var6_current" select="." />
                        <OriginalApplicationArea>
                            <xsl:copy-of select="ns:ApplicationArea/@node()" />
                            <xsl:copy-of select="ns:ApplicationArea/node()" />
                        </OriginalApplicationArea>
                    </xsl:for-each>
                </BOD>
            </DataArea>
        </ConfirmBOD>
    </xsl:template>
</xsl:stylesheet>