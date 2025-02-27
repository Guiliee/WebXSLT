<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!-- Salida en formato HTML -->
    <xsl:output encoding="UTF-8" method="html" doctype-system="about:legacy-compat"/>

    <!-- Plantilla raíz -->
    <xsl:template match="/gestionParque">

    <html lang="es">

        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta charset="utf-8"/>
            <meta name="description" content="Página principal" />
            <title>titulo de la web</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="gastrobar.xml">Gastrobar</a>
                <a href="atracciones.xml">Atracciones</a>
                <a href="eventos.xml">Eventos</a>
            </header>
            
            <main>
                <h1>ATRACCIONES</h1>
                <table>
                    <tr>
                        <th>ATRACCION</th>
                        <th>EDAD MINIMA</th>
                        <th>PESO MAXIMO</th>
                    </tr>

                    <xsl:for-each select="//atraccion">
                        <tr>
                            <td><a href="https://es.wikipedia.org/wiki/{translate(nombre, ' ', '_')}" target="_blank"><xsl:value-of select="nombre"/></a></td>
                            <td><xsl:value-of select="restricciones/edadMinima"/></td>
                            <td><xsl:value-of select="restricciones/pesoMaximo"/></td>
                        </tr>
                    </xsl:for-each>
                    
                </table>			
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>

    </xsl:template>


</xsl:stylesheet>