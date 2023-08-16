<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ns="http://www.mesa.org/xml/B2MML-V0600"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs fn"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:local="urn:local" extension-element-prefixes="msxsl">

	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
    <!-- Start creating the ZPROCMES IDOC -->
    <ZPROCMES>
      <IDOC BEGIN="1">
        <!-- Create EDI_DC40 segment -->
        <EDI_DC40 SEGMENT="1">
          <TABNAM>EDI_DC40</TABNAM>
          <MANDT>400</MANDT>
          <DIRECT>2</DIRECT>
          <IDOCTYP>ZPROCMES</IDOCTYP>
          <MESTYP>ZPROCMES</MESTYP>
          <SNDPOR>SAP_PI</SNDPOR>
          <SNDPRT>LS</SNDPRT>
          <SNDPRN>IE14_MES</SNDPRN>
          <RCVPOR>SAPP01</RCVPOR>
          <RCVPRT>LS</RCVPRT>
          <RCVPRN>ALE400</RCVPRN>
          <CREDAT>01010001</CREDAT>
          <CRETIM>010101</CRETIM>
        </EDI_DC40>
		<ZRCOMHAPI SEGMENT="1">
          <PROC_MESS_ID_TMP>
			  <xsl:value-of select="ns:ProcessOperationsPerformance/ns:DataArea/ns:OperationsPerformance/ns:ID"/>
		  </PROC_MESS_ID_TMP>
          <PLANT>
			  <xsl:value-of select="ns:ProcessOperationsPerformance/ns:DataArea/ns:OperationsPerformance/ns:HierarchyScope/ns:EquipmentID"/>
		  </PLANT>
          <!-- Loop through all OperationsResponse elements -->
          <xsl:for-each select="ns:ProcessOperationsPerformance/ns:DataArea/ns:OperationsPerformance/ns:OperationsResponse">
            <!-- Create ZRCOMEAPI segment for each OperationsResponse -->
            <ZRCOMEAPI SEGMENT="1">
              <PROC_MESS_ID_TMP>
				  <xsl:value-of select="../ns:ID"/>
			  </PROC_MESS_ID_TMP>
              <NAME_CHAR>
                <xsl:choose>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_PROCESS_ORDER'">
                    <xsl:text>PPPI_PROCESS_ORDER</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_PHASE'">
                    <xsl:text>PPPI_PHASE</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_CONFIRMATION_SHORT_TEXT'">
                    <xsl:text>PPPI_CONFIRMATION_SHORT_TEXT</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_YIELD_TO_CONFIRM'">
                    <xsl:text>PPPI_YIELD_TO_CONFIRM</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_UNIT_OF_MEASURE'">
                    <xsl:text>PPPI_UNIT_OF_MEASURE</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_STATUS_CONFIRMED'">
                    <xsl:text>PPPI_STATUS_CONFIRMED</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_CLEAR_RESERVATIONS'">
                    <xsl:text>PPPI_CLEAR_RESERVATIONS</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_START_DATE'">
                    <xsl:text>PPPI_START_DATE</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_START_TIME'">
                    <xsl:text>PPPI_START_TIME</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_EVENT_DATE'">
                    <xsl:text>PPPI_EVENT_DATE</xsl:text>
                  </xsl:when>
                  <xsl:when test="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:ID = 'PPPI_EVENT_TIME'">
                    <xsl:text>PPPI_EVENT_TIME</xsl:text>
                  </xsl:when>
                </xsl:choose>
              </NAME_CHAR>
              <!-- Map the ValueString to CHAR_VALUE -->
              <CHAR_VALUE>
                <xsl:value-of select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:Value/ns:ValueString"/>
              </CHAR_VALUE>
              <!-- Map the UnitOfMeasure to DATA_TYPE -->
              <DATA_TYPE>
                <xsl:value-of select="ns:SegmentResponse/ns:MaterialActual/ns:MaterialActualProperty/ns:Quantity/ns:UnitOfMeasure"/>
              </DATA_TYPE>
            </ZRCOMEAPI>
          </xsl:for-each>
        </ZRCOMHAPI>
      </IDOC>
    </ZPROCMES>
  </xsl:template>

</xsl:stylesheet>