<!-- IBM_PROLOG_BEGIN_TAG                                                   -->
<!-- This is an automatically generated prolog.                             -->
<!--                                                                        -->
<!-- $Source: mrwChipIDs.xsl $                                              -->
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
    xmlns:mrwid="http://w3.ibm.com/stg/power-firmware/schema/mrwid"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwid"
    xmlns:ex="http://exslt.org/dates-and-times"
    extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Processor Logical Chip IDs</title>
            </head>
            <body>
                <h1>Processor Logical Chip IDs</h1>
                <br/>
                <br/>
                <table border="3" cellpadding="5">
                    <tr>
                        <th>Logical Node</th>
                        <th>Logical Position</th>
                        <th>Target</th>
                        <th>Instance Path</th>
                    </tr>
                    <xsl:for-each select="mrwid:chip-ids/mrwid:chip-id">
                    <tr>
                        <td><xsl:value-of select="mrwid:node"/></td>
                        <td><xsl:value-of select="mrwid:position"/></td>
                        <td>n<xsl:value-of select="mrwid:target/mrwid:node"/>:p<xsl:value-of select="mrwid:target/mrwid:position"/></td>
                        <td><xsl:value-of select="mrwid:instance-path"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
                <br/><br/>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
