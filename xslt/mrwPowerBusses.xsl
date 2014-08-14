<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwPowerBusses.xml $                                          -->
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
    xmlns:mrwpb="http://w3.ibm.com/stg/power-firmware/schema/mrwpb"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwpb"
    xmlns:ex="http://exslt.org/dates-and-times" 
    extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>PowerBus Connections</title>
            </head>
            <body>
                <h1>PowerBus Connections</h1>
                <br/>
                <br/>
                <xsl:for-each select="mrwpb:power-busses/mrwpb:power-bus">

                <xsl:choose>
                <xsl:when test="not (@skiphtml = 'true')">

                    <table border="3" cellpadding="5">
                        <tr>
                            <th></th>
                            <th>Endpoint</th>
                            <th>Endpoint</th>
                        </tr>
                        <tr>
                            <td>
                                <b>Port</b>
                            </td>
                            <xsl:for-each select="mrwpb:endpoint/mrwpb:port">
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>Chip Target</b>
                            </td>
                            <xsl:for-each select="mrwpb:endpoint/mrwpb:target">
                                <td>n<xsl:value-of select="mrwpb:node"/>p<xsl:value-of select="mrwpb:position"/></td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>Location Code</b>
                            </td>
                            <xsl:for-each select="mrwpb:endpoint/mrwpb:location-code">
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>Instance Path</b>
                            </td>
                            <xsl:for-each select="mrwpb:endpoint/mrwpb:instance-path">
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>RX Upstream MSB Swap</b>
                            </td>
                            <xsl:for-each select="mrwpb:rx-msb-lsb-swap">
                                <td colspan = "2">
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>TX Downstream MSB Swap</b>
                            </td>
                            <xsl:for-each select="mrwpb:tx-msb-lsb-swap">
                                <td colspan = "2">
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>Downstream TX_LANE_INVERT</b>
                            </td>
                            <xsl:for-each select="mrwpb:downstream-n-p-lane-swap-mask">
                                <td colspan = "2">
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>Upstream TX_LANE_INVERT</b>
                            </td>
                            <xsl:for-each select="mrwpb:upstream-n-p-lane-swap-mask">
                                <td colspan = "2">
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>Bus Width</b>
                            </td>
                            <xsl:for-each select="mrwpb:bus-width">
                                <td colspan = "2">
                                    <xsl:value-of select="."/>B
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>
                                <b>Node Config</b>
                            </td>
                            <xsl:for-each select="mrwpb:node-config">
                                <td colspan = "2">
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>

                        <!--  leave out for now 
                        <tr>
                            <td>
                            </td>
                            <td colspan="2">
                                <center>
                                    <table>
                                        <tr>
                                            <th><b><center>Bus Path</center></b></th>
                                        </tr>
                                        <xsl:for-each select="mrwpb:bus-path/mrwpb:path-segment">
                                            <tr>
                                                <td>
                                                    <xsl:value-of select="."/>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </table>
                                </center>
                            </td>
                        </tr>
                        -->
                    </table>
                    <br/>
                    <br/>

                </xsl:when>
                </xsl:choose>
                </xsl:for-each>
                <br/><br/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
