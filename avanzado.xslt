<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
            <link rel="styleheet" href="examen.css" type="text/css"/>
            <title>Examen</title>
            </head>
            <body>
                <form>
                    <xsl:for-each select="cuestionario/pregunta">
                        <br/>
                        <xsl:choose>
                            <xsl:when test='especifico/num'>
                                <table border="1">
                                    <tr>
                                        <td bgcolor="#a0a0a0"><xsl:value-of select="enunciado"/></td>
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
                                    <xsl:choose>
                                        <xsl:when test='especifico/test/@tipo="M"'>
                                            <xsl:apply-templates select="especifico/test"/>
                                        </xsl:when>
                                        <xsl:when test='especifico/test/@tipo="U"'>
                                            <xsl:apply-templates select="especifico/test/opcion"/>
                                        </xsl:when>
                                    </xsl:choose>    
                                </table>
                            </xsl:when>
                            <xsl:when test='especifico/bool'>
                                <table>
                                    <tr>
                                        <td><xsl:value-of select="enunciado"/></td>
                                    </tr>
                                    <tr>
                                        <td>Si</td>
                                        <td><input type="radio" >            
                                                <xsl:attribute name="name">
                                                    <xsl:value-of select="@id"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="Si"/>
                                                </xsl:attribute>
                                            </input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>No</td>
                                        <td><input type="radio" >            
                                                <xsl:attribute name="name">
                                                    <xsl:value-of select="@id"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="Si"/>
                                                </xsl:attribute>
                                            </input>
                                        </td>
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
        <textarea width="300px">
            <xsl:attribute name="rows">
                <xsl:value-of select="@fila"/>
            </xsl:attribute>
            <xsl:attribute name="cols">
                <xsl:value-of select="@columna"/>
            </xsl:attribute>
            Escriba su respuesta
        </textarea>
    </xsl:template>

    <xsl:template match="especifico/test">
        <xsl:for-each select="opcion">
            <tr>
                <td><xsl:value-of select="."/></td>
                <td><input type='checkbox' /></td>
            </tr>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="especifico/test/opcion">
        <tr>
            <td><xsl:value-of select="."/></td>
            <td><input type='radio' >
                    <xsl:attribute name="value">
                        <xsl:value-of select="opcion"/>
                    </xsl:attribute>
                    <xsl:attribute name="name">
                        <xsl:value-of select="../../../@id"/>
                    </xsl:attribute>
                </input>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>

