<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwDMIBusses.xml $                                            -->
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
    xmlns:mrwdmi="http://w3.ibm.com/stg/power-firmware/schema/mrwdmi"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwdmi"
    xmlns:ex="http://exslt.org/dates-and-times"
    extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>DMI Bus Swap Information</title>
            </head>
            <body>
                <h1>DMI Bus Swap Information</h1>
                <br/>
                <br/>

                <table border="3" cellpadding="5">
                <tr>
                    <th>MCS</th>
                    <th>Target</th>
                    <th>Centaur</th>
                    <th>Target</th>
                    <th>Master Chip TX_MSBSWAP (Downstream Dir)</th>
                    <th>Slave Chip TX_MSBSWAP (Upstream Dir)</th>
                    <th>Master Chip TX_LANE_INVERT (Downstream Dir)</th>
                    <th>Slave Chip TX_LANE_INVERT (Upstream Dir)</th>
                    <th>MCS Refclock Enable Mapping (DMI_REFCLOCK_SWIZZLE)</th>
                </tr>
                <xsl:for-each select="mrwdmi:dmi-busses/mrwdmi:dmi-bus">
                    <tr>
                        <td><xsl:value-of select="mrwdmi:mcs/mrwdmi:instance-path"/></td>
                        <td>n<xsl:value-of select="mrwdmi:mcs/mrwdmi:target/mrwdmi:node"/>:p<xsl:value-of select="mrwdmi:mcs/mrwdmi:target/mrwdmi:position"/>:mcs<xsl:value-of select="mrwdmi:mcs/mrwdmi:target/mrwdmi:chipUnit"/></td>
                        <td><xsl:value-of select="mrwdmi:centaur/mrwdmi:instance-path"/></td>
                        <td>n<xsl:value-of select="mrwdmi:centaur/mrwdmi:target/mrwdmi:node"/>:p<xsl:value-of select="mrwdmi:centaur/mrwdmi:target/mrwdmi:position"/></td>
                        <td><xsl:value-of select="mrwdmi:tx-msb-lsb-swap"/></td>
                        <td><xsl:value-of select="mrwdmi:rx-msb-lsb-swap"/></td>
                        <td><xsl:value-of select="mrwdmi:downstream-n-p-lane-swap-mask"/></td>
                        <td><xsl:value-of select="mrwdmi:upstream-n-p-lane-swap-mask"/></td>
                        <td><xsl:value-of select="mrwdmi:mcs-refclock-enable-mapping"/></td>
                    </tr>
                </xsl:for-each>
                </table>
                <br/><br/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
