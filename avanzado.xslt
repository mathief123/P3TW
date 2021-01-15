<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
            <link href="style.css" rel="examen.css" type="text/css"/>
            <title>Examen</title>
            </head>
            <body>
                <form>
                    <xsl:for-each select="examen/pregunta">
                        <br/>
                        <xsl:choose>
                            <xsl:when test='especifico/num'>
                                <table>
                                    <tr>
                                        <td><xsl:value-of select="enunciado"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:apply-templates select="especifico/num"/> </td>
                                    </tr>
                                </table>
                            </xsl:when>
                            <xsl:when test='especifico/libre'>
                                <table>
                                    <tr>
                                        <td><xsl:value-of select="enunciado"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:apply-templates select="especifico/libre"/></td>
                                    </tr>
                                </table>
                            </xsl:when>
                            <xsl:when test='especifico/test'>
                                <table>
                                    <tr>
                                        <td><xsl:value-of select="enunciado"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="opcion"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="opcion"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="opcion"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="opcion"/></td>
                                    </tr>
                                </table>
                            </xsl:when>
                            <xsl:when test='especifico/bool'>
                                <table>
                                    <tr>
                                        <td><xsl:value-of select="enunciado"/></td>
                                    </tr>
                                    <tr>
                                        <td>Si</td>
                                        <!--<td><input type="radio" id=></td>-->
                                    </tr>
                                    <tr>
                                        <td>No</td>
                                        <!--<td><input type="radio" id=></td>-->
                                    </tr>
                                </table>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </form>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="especifico/num">
        <input type="number">
            <xsl:attribute name="min">
                <xsl:value-of select="@maximo"/>
            </xsl:attribute>
            <xsl:attribute name="max">
                <xsl:value-of select="@minimo"/>
            </xsl:attribute>
        </input>
    </xsl:template>

    <xsl:template match="especifico/libre">
        <textarea>
            <xsl:attribute name="rows">
                <xsl:value-of select="@fila"/>
            </xsl:attribute>
            <xsl:attribute name="cols">
                <xsl:value-of select="@columna"/>
            </xsl:attribute>
            Escriba su respuesta
        </textarea>
    </xsl:template>
    <xsl:template match="unica">
        <input type="checkbox">
            <xsl:attribute name="value">
                <xsl:value-of select="opcion"/>
            </xsl:attribute>
        </input>
    </xsl:template>

    <xsl:template match="multiple">
        <input type="radio">
            <xsl:attribute name="value">
                <xsl:value-of select="opcion"/>
            </xsl:attribute>
            <xsl:attribute name="name">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
        </input>
    </xsl:template>
</xsl:stylesheet>