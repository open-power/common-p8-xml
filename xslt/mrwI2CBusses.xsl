<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwI2CBusses.xml $                                            -->
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
    xmlns:mrwi2c="http://w3.ibm.com/stg/power-firmware/schema/mrwi2c"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwi2c"
    xmlns:ex="http://exslt.org/dates-and-times" extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>I2C Devices</title>
            </head>
            <body>
                <h1>I2C Devices</h1>
                <br/>
                <br/>


                <!-- //////////////////////////////////////////////////////////////////// -->
                <!-- The summary table, which will point to individual places down below -->


                <table border="3" cellpadding="5">
                <tr>
                    <th>I2C Slave</th>
                    <th>I2C Master</th>
                    <th>Engine</th>
                    <th>Port</th>
                    <th>Address</th>
                    <th>Details</th>
                </tr>
                <xsl:for-each select="mrwi2c:i2c-devices/mrwi2c:i2c-device">
                    <xsl:variable name="label" select="0"></xsl:variable>
                    <tr>
                        <td><xsl:value-of select="mrwi2c:instance-path"/>
                        <xsl:if test="mrwi2c:restrict-to-variation-id and mrwi2c:restrict-to-variation-id != ''">
                           <br/>Restrict-to: <xsl:value-of select="mrwi2c:restrict-to-variation-id"/>
                        </xsl:if>
                        </td>
                        <td><xsl:value-of select="mrwi2c:i2c-master/mrwi2c:instance-path"/></td>
                        <td><xsl:value-of select="mrwi2c:i2c-master/mrwi2c:i2c-engine"/></td>
                        <td><xsl:value-of select="mrwi2c:i2c-master/mrwi2c:i2c-port"/></td>
                        <td><xsl:value-of select="mrwi2c:address"/></td>
                        <!-- Use the entry-num element to link to the detailed table below -->
                        <td><xsl:text disable-output-escaping="yes">&lt;a href="#i2c</xsl:text><xsl:value-of select="mrwi2c:entry-num"></xsl:value-of><xsl:text disable-output-escaping="yes">"&gt;</xsl:text>Details<xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text></td>
                    </tr>
                </xsl:for-each>
                </table>
                <br/><br/><br/><br/>

                <!-- //////////////////////////////////////////////////////////////////// -->
                <!-- The detailed tables -->

                <xsl:for-each select="mrwi2c:i2c-devices/mrwi2c:i2c-device">
                    <xsl:text disable-output-escaping="yes">&lt;a name="i2c</xsl:text><xsl:value-of select="mrwi2c:entry-num"/><xsl:text disable-output-escaping="yes">"&gt;&lt;/a&gt;</xsl:text>
                    <table border="3" cellpadding="5" width="1000">
                        <tr>
                            <td colspan="2">
                                <b>
                                    <center>I2C Device</center>
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Device</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:part-id"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Part Type</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:part-type"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Card</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:card-id"/> (<xsl:value-of select="mrwi2c:card-location-code"/>)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Instance Path</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:instance-path"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Address</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:address"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Speed</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:speed"/>
                            </td>
                        </tr>

                        <xsl:choose>
                        <xsl:when test="mrwi2c:content-type">
                        <tr>
                            <td><b>Content</b></td>
                            <td><xsl:value-of select="mrwi2c:content-type"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>
                         <xsl:choose>
                        <xsl:when test="mrwi2c:size">
                        <tr>
                            <td><b>Device Size</b></td>
                            <td><xsl:value-of select="mrwi2c:size"/></td>
                        </tr>
                        </xsl:when>
                        </xsl:choose>

                        <xsl:apply-templates select="mrwi2c:target"/> <!-- may not be present -->
                        <tr>
                            <td colspan="2">
                                <center>
                                    <b>I2C Master</b>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Device</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:i2c-master/mrwi2c:part-id"/>
                            </td>
                        </tr>
                        <tr>
                            <td><b>I2C Engine</b></td>
                            <td><xsl:value-of select="mrwi2c:i2c-master/mrwi2c:i2c-engine"/></td>
                        </tr>
                        <tr>
                            <td><b>I2C Port</b></td>
                            <td><xsl:value-of select="mrwi2c:i2c-master/mrwi2c:i2c-port"/></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Part Type</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:i2c-master/mrwi2c:part-type"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Card</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:i2c-master/mrwi2c:card-id"/> (<xsl:value-of select="mrwi2c:i2c-master/mrwi2c:card-location-code"/>)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Instance Path</b>
                            </td>
                            <td>
                                <xsl:value-of select="mrwi2c:i2c-master/mrwi2c:instance-path"/>
                            </td>
                            <xsl:apply-templates select="mrwi2c:i2c-master/mrwi2c:target"/> <!-- may not be present -->
                        </tr>
                        <xsl:choose>
                        <xsl:when test="mrwi2c:system-paths/mrwi2c:system-path/mrwi2c:fsi-path-segment">

                            <tr>
                            <th colspan="2">FSP Path Information</th>
                            </tr>
                            <xsl:for-each select="mrwi2c:system-paths/mrwi2c:system-path">
                                <tr>
                                <td colspan="2">
                                    <center>
                                    <table border="1" cellpadding="2" width="800px">
                                        <tr><th>FSI Path</th></tr>
                                        <tr><td>Firmware Device Path: <xsl:value-of select="mrwi2c:fsp-device-path"/></td></tr>

                                        <xsl:for-each select="mrwi2c:fsi-path-segment">
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr><th colspan="2">FSI Path Segment</th></tr>
                                                    <tr>
                                                        <td>Master:</td>
                                                        <td><xsl:value-of select="mrwi2c:fsi-master/mrwi2c:instance-path"/> (Link <xsl:value-of select="mrwi2c:fsi-master/mrwi2c:link"/>)</td>
                                                    </tr>

                                                    <xsl:for-each select="mrwi2c:cards/mrwi2c:card">
                                                    <tr>
                                                        <td>Card:</td>
                                                        <td><xsl:value-of select="mrwi2c:instance-path"/> (<xsl:value-of select="mrwi2c:location-code"/>)</td>
                                                    </tr>
                                                    </xsl:for-each>

                                                    <tr>
                                                        <td>Slave:</td>
                                                        <td><xsl:value-of select="mrwi2c:fsi-slave/mrwi2c:instance-path"/> (port <xsl:value-of select="mrwi2c:fsi-slave/mrwi2c:port"/>)</td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        </xsl:for-each>

                                    </table>
                                    </center>
                                </td>
                                </tr>
                                <!-- print the I2C path -->
                                <xsl:apply-templates select="mrwi2c:i2c-path"/>
                            </xsl:for-each>


                        </xsl:when>
                        <xsl:otherwise> <!-- no FSI in path, probably direct connect to FSP -->
                            <tr>
                            <th colspan="2">FSP Path Information</th>
                            </tr>
                            <tr>
                                <td colspan="2">Firmware Device Path: <xsl:value-of select="mrwi2c:system-paths/mrwi2c:system-path/mrwi2c:fsp-device-path"/></td>
                            </tr>
                            <xsl:apply-templates select="mrwi2c:system-paths/mrwi2c:system-path/mrwi2c:i2c-path"/> <!-- print I2C path information -->
                        </xsl:otherwise>

                        </xsl:choose>

                    </table>
                    <br/>
                    <br/>
                </xsl:for-each>
                <br/><br/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="mrwi2c:target">
        <tr>
            <td>
                <b>Target</b>
            </td>
            <td>
                <xsl:value-of select="mrwi2c:name"/>:n<xsl:value-of select="mrwi2c:node"/>:p<xsl:value-of select="mrwi2c:position"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="mrwi2c:i2c-path">
        <tr>
             <td colspan="2">
             <center>
             <table border="1" cellpadding="2" width="800px">
            <tr>
            <td>
            <table>
                <tr>
                    <th colspan="2">I2C Path</th>
                </tr>
                <tr>
                    <td> Master:</td>
                    <td>
                        <xsl:value-of select="mrwi2c:i2c-master"/>
                    </td>
                </tr>

                <xsl:for-each select="mrwi2c:cards/mrwi2c:card">
                    <tr>
                        <td>Card:</td>
                        <td>
                            <xsl:value-of select="mrwi2c:instance-path"/> (<xsl:value-of select="mrwi2c:location-code"/>)
                        </td>
                    </tr>
                </xsl:for-each>

                <tr>
                    <td>Slave:</td>
                    <td>
                        <xsl:value-of select="mrwi2c:i2c-slave"/>
                    </td>
                </tr>
            </table>
            </td>

         </tr>
         </table>
         </center>
         </td>
         </tr>
    </xsl:template>


</xsl:stylesheet>
