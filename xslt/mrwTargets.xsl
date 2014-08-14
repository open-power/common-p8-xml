<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwTargets.xsl $                                              -->
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
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:mrwtarg="http://w3.ibm.com/stg/power-firmware/schema/mrwtarg"
        xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwtarg"
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
  <title>ecmd Targets</title>
  </head>
  <body>
  <h1>ecmd Targets</h1>

	<table border="3">
	<tr>
		<th id="lh">ecmd<br />Common<br />Name</th>
		<th>Node</th>
		<th>Position</th>
		<th>Unit</th>
		<th>Instance Path</th>
		<th>Description</th>
	</tr>
	<xsl:for-each select="targets/target">

   <xsl:choose>
   <xsl:when test="not (@skiphtml = 'true')">

	<tr>
	<td><xsl:value-of select="ecmd-common-name"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="node"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="position"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="chip-unit"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="instance-path"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:value-of select="description"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
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
