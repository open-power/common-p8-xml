<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mrwspi="http://w3.ibm.com/stg/power-firmware/schema/mrwspi"
    xmlns="http://w3.ibm.com/stg/power-firmware/schema/mrwspi"
    xmlns:ex="http://exslt.org/dates-and-times" 
    extension-element-prefixes="ex">

    <!-- Pass in the system name with: xsltproc \-\-stringparam system <the systemName> -->
    <xsl:param name="system"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Processor SPI Connections</title>
            </head>
            <body>
                <h1>Processor SPI Connections</h1>
                <br/>
                <br/>
                <table border="3" cellpadding="5">
                    <tr>
                        <th>Processor Target</th>
                        <th>Processor Instance Path</th>
                        <th>Endpoint</th>
                    </tr>
                    <xsl:for-each select="mrwspi:processor-spi-busses/mrwspi:processor-spi-bus">
                    <tr>
                        <td>n<xsl:value-of select="mrwspi:processor/mrwspi:target/mrwspi:node"/>:p<xsl:value-of select="mrwspi:processor/mrwspi:target/mrwspi:position"/></td>
                        <td><xsl:value-of select="mrwspi:processor/mrwspi:instance-path"/></td>
                        <td><xsl:value-of select="mrwspi:endpoint/mrwspi:instance-path"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
                <br/><br/>
            </body>
            
        </html>
    </xsl:template>

</xsl:stylesheet>
