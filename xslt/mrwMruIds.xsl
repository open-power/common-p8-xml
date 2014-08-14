<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwMruIds.xml $                                               -->
<!--                                                                        -->
<!-- OpenPOWER HostBoot Project                                             -->
<!--                                                                        -->
<!-- Contributors Listed Below - COPYRIGHT 2014                             -->
<!-- [+] International Business Machines Corp.                              -->
<!--                                                                        -->
<!--                                                                        -->
<!-- Licensed under the Apache License, Version 2.0 (the "License");        -->
<!-- you may not use this file except in compliance with the License.       -->
<!-- You may obtain a copy of the License at                                -->
<!--                                                                        -->
<!--     http://www.apache.org/licenses/LICENSE-2.0                         -->
<!--                                                                        -->
<!-- Unless required by applicable law or agreed to in writing, software    -->
<!-- distributed under the License is distributed on an "AS IS" BASIS,      -->
<!-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or        -->
<!-- implied. See the License for the specific language governing           -->
<!-- permissions and limitations under the License.                         -->
<!--                                                                        -->
<!-- IBM_PROLOG_END_TAG                                                     -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:mrwmruid="http://w3.ibm.com/stg/power-firmware/schema/mrwmruid"
        xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwmruid"
        xmlns:ex="http://exslt.org/dates-and-times"
        extension-element-prefixes="ex"
        >

<!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
<xsl:param name="system"/>

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
  <head>
  <style type="text/css">
    #lh {line-height:0.75;}
  </style>
  <title>MRU IDs</title>
  </head>
  <body>
  <h1>MRU IDs</h1>

	<table border="3">
	<tr>
		<th id="lh">MRU ID</th>
		<th>MRU ID Value</th>
		<th>Instance Path</th>
		<th>Location Code</th>
		<th>HW ID</th>
		<th>HW Type</th>
		<th>MRU Type</th>
		<th>MRU Instance#</th>
		<th>Parent MRU</th>
		<th>ecmd Target</th>
	</tr>
	<xsl:for-each select="mru-ids/mru-id">

   <xsl:choose>
   <xsl:when test="not (@skiphtml = 'true')">

	<tr>
	<td><xsl:value-of select="mrid"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="mrid-value"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="instance-path"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="location-code"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="hardware-id"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td>
	<xsl:if test="part-type != ''">
		Part: <xsl:value-of select="part-type"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	</xsl:if>
	<xsl:if test="card-type != ''">
		Card: <xsl:value-of select="card-type"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	</xsl:if>
	<xsl:if test="unit-type != ''">
		Unit: <xsl:value-of select="unit-type"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	</xsl:if>
	<xsl:if test="chiplet-type != ''">
		Chiplet: <xsl:value-of select="chiplet-type"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	</xsl:if>
	</td>
	<td><xsl:value-of select="mru-type"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="mru-instance-num"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="parent-mru"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="ecmd-target"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	</tr>

    </xsl:when>
    </xsl:choose>

	</xsl:for-each>
	</table>
    <br/><br/>

  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

