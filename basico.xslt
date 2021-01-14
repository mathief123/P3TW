<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
    <h2>Examen tocho</h2>


      <xsl:for-each select="examen/pregunta">
      <xsl:sort select="@tema"/>
        <table border="1">
            
            <xsl:choose>
                <xsl:when test='@tema = "1"'>
                    <tr>
                        <td><xsl:value-of select="enunciado"/></td>
                        <td bgcolor="#fa00ff"><xsl:value-of select="@tema"/></td>
                    </tr>
                </xsl:when>
                <xsl:when test='@tema = "2"'>
                    <tr>
                        <td><xsl:value-of select="enunciado"/></td>
                        <td bgcolor="#fp00ff"><xsl:value-of select="@tema"/></td>
                    </tr>
                </xsl:when>
                <xsl:when test='@tema = "3"'>
                    <tr>
                        <td><xsl:value-of select="enunciado"/></td>
                        <td bgcolor="#ff58ff"><xsl:value-of select="@tema"/></td>
                    </tr>
                </xsl:when>
                <xsl:when test='@tema = "4"'>
                    <tr>
                        <td><xsl:value-of select="enunciado"/></td>
                        <td bgcolor="#ffeeff"><xsl:value-of select="@tema"/></td>
                    </tr>
                </xsl:when>
                <xsl:when test='@tema = "5"'>
                    <tr>
                        <td><xsl:value-of select="enunciado"/></td>
                        <td bgcolor="#ffgggg"><xsl:value-of select="@tema"/></td>
                    </tr>
                </xsl:when>
                <xsl:when test='@tema = "6"'>
                    <tr>
                        <td><xsl:value-of select="enunciado"/></td>
                        <td bgcolor="#ffasdf"><xsl:value-of select="@tema"/></td>
                    </tr>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test='especifica/num'>
                    <tr>
                        <td><xsl:value-of select="respuesta"/></td>
                    </tr>
                </xsl:when>
                <xsl:when test='especifica/libre'>
                    <tr>
                        <td><xsl:value-of select="respuesta"/></td>
                    </tr>
                </xsl:when>
                <xsl:when test='especifica/test"'>
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
                        <td></td>
                    </tr>
                </xsl:when>
                <xsl:when test='especifica/ordenar'>
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
            </xsl:choose>
        </table>
      </xsl:for-each>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>

