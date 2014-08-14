<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwMemoryBusses.xsl $                                         -->
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
    xmlns:mrwmem="http://w3.ibm.com/stg/power-firmware/schema/mrwmem"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwmem"
    xmlns:ex="http://exslt.org/dates-and-times"
    extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>


    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Memory Bus Connections</title>
            </head>
            <body>
                <h1>Memory Bus Connections</h1>
                <br/><br/>
                <table border="3" cellpadding="5">
                    <tr>
                        <th>Processor MCS Target</th>
                        <xsl:choose>  <!-- Only print MBA info when not on Centaur DIMMs -->
                        <xsl:when test="//mrwmem:memory-bus/mrwmem:mba/mrwmem:mba-port">
                        <th>Centaur MBA Target</th>
                        <th>MBA Port</th>
                        <th>MBA Slot</th>
                        </xsl:when>
                        <xsl:otherwise> <!--  on Centaur DIMMS, just print Centaur target -->
                        <th>Centaur Target</th>
                        </xsl:otherwise>
                        </xsl:choose>
                        <th>DIMM Target</th>
                        <th>DIMM Instance Path</th>
                        <th>Proc->Centaur FSI Link</th>

                    </tr>
                    <xsl:for-each select="mrwmem:memory-busses/mrwmem:memory-bus">
                        <tr>
                            <td>
                                n<xsl:value-of select="mrwmem:mcs/mrwmem:target/mrwmem:node"/>:p<xsl:value-of select="mrwmem:mcs/mrwmem:target/mrwmem:position"/>:mcs<xsl:value-of select="mrwmem:mcs/mrwmem:target/mrwmem:chipUnit"/>
                            </td>

                            <xsl:choose>
                            <xsl:when test="mrwmem:mba/mrwmem:mba-port">
                            <td>
                                n<xsl:value-of select="mrwmem:mba/mrwmem:target/mrwmem:node"/>:p<xsl:value-of select="mrwmem:mba/mrwmem:target/mrwmem:position"/>:mba<xsl:value-of select="mrwmem:mba/mrwmem:target/mrwmem:chipUnit"/>
                            </td>

                            <td><xsl:value-of select="mrwmem:mba/mrwmem:mba-port"/></td>
                            <td><xsl:value-of select="mrwmem:mba/mrwmem:mba-slot"/></td>
                            </xsl:when>
                            <xsl:otherwise>
                            <!-- The centaur target, which is part of the MBA target -->
                            <td>
                                n<xsl:value-of select="mrwmem:mba/mrwmem:target/mrwmem:node"/>:p<xsl:value-of select="mrwmem:mba/mrwmem:target/mrwmem:position"/>
                            </td>
                            </xsl:otherwise>
                            </xsl:choose>
                            <td>
                                n<xsl:value-of select="mrwmem:dimm/mrwmem:target/mrwmem:node"/>:p<xsl:value-of select="mrwmem:dimm/mrwmem:target/mrwmem:position"/>
                            </td>
                            <td><xsl:value-of select="mrwmem:dimm/mrwmem:instance-path"/></td>
                            <td><xsl:value-of select="mrwmem:fsi-link"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <br/><br/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
