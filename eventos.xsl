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
                <h1>Eventos del 2024</h1>

                <!-- Definimos la variable con el año 2024 -->
                <xsl:variable name="año" select="'2024'" />

                <xsl:apply-templates select="//evento[substring(fechaHora, 1, 4) = $año]">

                    <!-- Ordenar por mes (diciembre primero) -->
                     <xsl:sort select="substring(fechaHora, 6, 2)" data-type="number" order="descending"/> 

                </xsl:apply-templates>

            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>

        </html>

    </xsl:template>

    <!-- Plantilla para los eventos -->
    <xsl:template match="evento">
        <article class="eventos">
            <h4><xsl:value-of select="descripcion"/> - <xsl:value-of select="count(comentarios/comentario)"/> Comentarios</h4>
            <ul>
                <!-- Plantilla para los comentarios -->
                <xsl:apply-templates select="comentarios/comentario"/>
            </ul>
        </article>
    </xsl:template>

    <!-- Plantilla para los comentarios -->
    <xsl:template match="comentario">
        
        <li><xsl:value-of select="."/></li>
        
    </xsl:template>

</xsl:stylesheet>