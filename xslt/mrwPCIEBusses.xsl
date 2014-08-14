<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwPCIEBusses.xsl $                                           -->
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
    xmlns:mrwpcie="http://w3.ibm.com/stg/power-firmware/schema/mrwpcie"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwpcie"
    xmlns:ex="http://exslt.org/dates-and-times"
    extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>PCIE Connections</title>
            </head>
            <body>
                <h1>PCIE Connections</h1>
                <br/>
                <br/>

                <!-- The summary table, which will point to individual places down below -->
                <table border="3" cellpadding="9">
                <tr>
                    <th>Source</th>
                    <th>IOP</th>
                    <th>Width</th>
                    <th>Switch</th>
                    <th>Endpoint</th>
                    <th>Details</th>
                </tr>
                <xsl:for-each select="mrwpcie:pcie-busses/mrwpcie:pcie-bus">
                    <xsl:variable name="label" select="0"></xsl:variable>
                    <tr>
                        <td><xsl:value-of select="mrwpcie:source/mrwpcie:instance-path"/></td>
                        <td><xsl:value-of select="mrwpcie:source/mrwpcie:iop"/></td>
                        <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:width"/></td>
                        <xsl:choose>
                        <xsl:when test="mrwpcie:switch">
                            <td><xsl:value-of select="mrwpcie:switch/mrwpcie:instance-path"/> (Station: <xsl:value-of select="mrwpcie:switch/mrwpcie:station"/> Port: <xsl:value-of select="mrwpcie:switch/mrwpcie:port"/>)</td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td>None</td>
                        </xsl:otherwise>
                        </xsl:choose>

                        <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:instance-path"/></td>
                        <!-- Use the entry-num element to link to the detailed table below -->
                        <td><xsl:text disable-output-escaping="yes">&lt;a href="#dev</xsl:text><xsl:value-of select="mrwpcie:entry-num"></xsl:value-of><xsl:text disable-output-escaping="yes">"&gt;</xsl:text>Details<xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text></td>
                    </tr>
                </xsl:for-each>
                </table>
                 <br/><br/><br/><br/>


                 <!-- The detailed tables -->

                <xsl:for-each select="mrwpcie:pcie-busses/mrwpcie:pcie-bus">
                    <xsl:text disable-output-escaping="yes">&lt;a name="dev</xsl:text><xsl:value-of select="mrwpcie:entry-num"/><xsl:text disable-output-escaping="yes">"&gt;&lt;/a&gt;</xsl:text>
                    <table border="3" cellpadding="5" width="1000">
                        <tr>
                            <td colspan="2"><b><center>Source</center></b></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Processor</b>
                            </td>
                            <td>n<xsl:value-of select="mrwpcie:source/mrwpcie:target/mrwpcie:node"/>:p<xsl:value-of select="mrwpcie:source/mrwpcie:target/mrwpcie:position"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Instance Path</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:source/mrwpcie:instance-path"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>IOP</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:source/mrwpcie:iop"/></td>
                        </tr>

                        <xsl:choose> <!-- Might not be there -->
                        <xsl:when test="mrwpcie:source/mrwpcie:lane-mask">
                        <tr>
                            <td>
                                <b>Lane Mask</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:source/mrwpcie:lane-mask"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>

                        <xsl:choose> <!-- Might not be there -->
                        <xsl:when test="mrwpcie:source/mrwpcie:dsmp-capable">
                        <tr>
                            <td>
                                <b>DSMP Capable</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:source/mrwpcie:dsmp-capable"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>

                        <xsl:choose> <!-- Might not be there -->
                        <xsl:when test="mrwpcie:source/mrwpcie:lane-swap-bits">
                        <tr>
                            <td>
                                <b>Lane Swap Bits</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:source/mrwpcie:lane-swap-bits"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>

                        <xsl:choose> <!-- Might not be there -->
                        <xsl:when test="mrwpcie:source/mrwpcie:lane-reversal-bits">
                        <tr>
                            <td>
                                <b>Lane Reversal Bits</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:source/mrwpcie:lane-reversal-bits"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>

                        <!-- if a x16 link, then also print the bifurcation settings -->
                        <xsl:choose>
                        <xsl:when test="mrwpcie:source/mrwpcie:bifurcation-settings">
                        <tr>
                            <td>
                                <b>Lane Swap Bits if Bifurcated</b>
                            </td>
                            <td>
                                Lanes <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[1]/mrwpcie:lane-mask"/> =
                                <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[1]/mrwpcie:lane-swap-bits"/>,
                                Lanes <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[2]/mrwpcie:lane-mask"/> =
                                <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[2]/mrwpcie:lane-swap-bits"/>
                            </td>
                       </tr>
                        <tr>
                            <td>
                                <b>Lane Reversal Bits if Bifurcated</b>
                            </td>
                            <td>
                                Lanes <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[1]/mrwpcie:lane-mask"/> =
                                <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[1]/mrwpcie:lane-reversal-bits"/>,
                                Lanes <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[2]/mrwpcie:lane-mask"/> =
                                <xsl:value-of select="mrwpcie:source/mrwpcie:bifurcation-settings/mrwpcie:bifurcation-setting[2]/mrwpcie:lane-reversal-bits"/>
                            </td>
                       </tr>

                        </xsl:when>
                        </xsl:choose>



                        <xsl:choose> <!-- Only print Switch section if present in the XML -->
                        <xsl:when test="mrwpcie:switch">
                        <tr>
                            <td colspan="2"><b><center>Switch</center></b></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Part </b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:switch/mrwpcie:part-id"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Station </b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:switch/mrwpcie:station"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Port </b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:switch/mrwpcie:port"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Upstream Station </b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:switch/mrwpcie:upstream-station"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Upstream Port </b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:switch/mrwpcie:upstream-port"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Instance Path</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:switch/mrwpcie:instance-path"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>
                        <tr>
                            <td colspan="2"><b><center>Endpoint</center></b></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Card</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:card-id"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Part </b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:part-id"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Instance Path</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:instance-path"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Width</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:width"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Slot Index</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:slot-index"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Card Size</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:card-size"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Gen</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:gen"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Hot Plug</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:hot-plug"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Is Slot</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:is-slot"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>CAPI</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:capi"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>LSI</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:lsi"/></td>
                        </tr>

                        <xsl:choose> <!-- Might not be there -->
                        <xsl:when test="mrwpcie:endpoint/mrwpcie:default-pcie-cooling-type">
                        <tr>
                            <td>
                                <b>Default Cooling Type</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:default-pcie-cooling-type"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>

                        <xsl:choose> <!-- Might not be there -->
                        <xsl:when test="mrwpcie:endpoint/mrwpcie:default-power-consumption">
                        <tr>
                            <td>
                                <b>Default Power Consumption</b>
                            </td>
                            <td><xsl:value-of select="mrwpcie:endpoint/mrwpcie:default-power-consumption"/> Watts</td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>
                    </table>
                    <br/>
                    <br/>
                </xsl:for-each>
                <br/><br/>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
