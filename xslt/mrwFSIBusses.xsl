<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwFSIBusses.xsl $                                            -->
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
    xmlns:mrwfsi="http://w3.ibm.com/stg/power-firmware/schema/mrwfsi"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwfsi"
    xmlns:ex="http://exslt.org/dates-and-times"
    extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>FSI Connections</title>
            </head>
            <body>
                <h1>FSI Connections</h1>
                <br/>
                <br/>
                <table border="3" cellpadding="5">
                    <tr>
                        <th>Master</th>
                        <th>Target</th>
                        <th>Type</th>
                        <th>Engine</th>
                        <th>Link</th>
                        <th>Slave</th>
                        <th>Port</th>
                        <th>Target</th>
                    </tr>
                    <xsl:for-each select="mrwfsi:fsi-busses/mrwfsi:fsi-bus">
                    <tr>
                        <td><xsl:value-of select="mrwfsi:master/mrwfsi:instance-path"/></td>

                        <xsl:choose> <!-- master may not have a target if an FSP -->
                        <xsl:when test="mrwfsi:master/mrwfsi:target">
                            <td>n<xsl:value-of select="mrwfsi:master/mrwfsi:target/mrwfsi:node"/>:p<xsl:value-of select="mrwfsi:master/mrwfsi:target/mrwfsi:position"/></td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td>na</td>
                        </xsl:otherwise>
                        </xsl:choose>
                        <td><xsl:value-of select="mrwfsi:master/mrwfsi:type"/></td>
                        <td><xsl:value-of select="mrwfsi:master/mrwfsi:engine"/></td>
                        <td><xsl:value-of select="mrwfsi:master/mrwfsi:link"/></td>
                        <td><xsl:value-of select="mrwfsi:slave/mrwfsi:instance-path"/></td>
                        <td><xsl:value-of select="mrwfsi:slave/mrwfsi:port"/></td>
                        <xsl:choose> <!-- slave may not have a target if a DPSS -->
                        <xsl:when test="mrwfsi:slave/mrwfsi:target">
                            <td>n<xsl:value-of select="mrwfsi:slave/mrwfsi:target/mrwfsi:node"/>:p<xsl:value-of select="mrwfsi:slave/mrwfsi:target/mrwfsi:position"/></td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td>na</td>
                        </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                    </xsl:for-each>
                </table>
                <br/><br/>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
