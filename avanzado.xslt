<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <form>
            <xsl:for-each select="examen/pregunta">
                <xsl:choose>
                    <xsl:when test='especifica/num'>
                        <tr>
                            <td><xsl:value-of select="enunciado"/></td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </xsl:when>
                    <xsl:when test='especifica/libre'>
                        <tr>
                            <td><xsl:value-of select="enunciado"/></td>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="respuesta"/></td>
                        </tr>
                    </xsl:when>
                    <xsl:when test='especifica/test'>
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
                    </xsl:when>
                    <xsl:when test='especifica/bool'>
                        <tr>
                            <td><xsl:value-of select="enunciado"/></td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </form>
    </html>
</xsl:template>

<xsl:template match="examen/pregunta/especifico/num">
    <input type="number">
        <xsl:attribute name="min">
            <xsl:value-of select="@maximo"/>
        </xsl:attribute>
        <xsl:attribute name="max">
            <xsl:value-of select="@minimo"/>
        </xsl:attribute>
    </input>
</xsl:template>

<xsl:template match="examen/pregunta/especifico/">
    <table>
        <tr>
            <td><xsl:value-of select="enunciado"/></td>
        </tr>
        <xsl:apply-templates/>
    </table>
</xsl:template>