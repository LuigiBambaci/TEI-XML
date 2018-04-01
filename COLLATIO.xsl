<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="tei:teiHeader">
        <h1>
            <xsl:text>collatio</xsl:text>
        </h1>
    </xsl:template>
    <xsl:template match="tei:div[@type = 'analysis']"/>
    <xsl:template match="tei:div[@type = 'prototype']"/>

    <xsl:template match="tei:body">
        <!-- INDICE DEI CAPITOLI E VERSI -->
        <xsl:for-each select="descendant-or-self::tei:div[@type = 'chap']">
            <a href="#{descendant-or-self::tei:div[@type = 'chap']/@n}">
                <xsl:value-of select="descendant-or-self::tei:div[@type = 'chap']/@n"/>
            </a>
            <xsl:text> : </xsl:text>
            <xsl:for-each select="descendant-or-self::tei:ab">
                <a href="#{ancestor-or-self::tei:div/@n}#{./@n}">
                    <xsl:value-of select="./@n"/>
                </a>
                <xsl:text> </xsl:text>
            </xsl:for-each>
            <br/>
        </xsl:for-each>
        <xsl:apply-templates/>
        <!-- INDICE DEI CAPITOLI E VERSI -->
    </xsl:template>


    <xsl:template name="testatinaApparato">
        <h2>
            <xsl:value-of select="ancestor-or-self::tei:div/@n"/>
            <xsl:text> : </xsl:text>
            <xsl:for-each select="ancestor-or-self::tei:ab">
                <xsl:element name="idVerse">
                    <xsl:attribute name="id">
                        <xsl:value-of select="ancestor-or-self::tei:div/@n"/>
                        <xsl:text>#</xsl:text>
                        <xsl:value-of select="./@n"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <!-- assegno un codice alfanumerico in modo da ancorare eventuali riferimenti a varianti, cf. sotto tei:ref -->
                        <xsl:number format="a"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:value-of select="ancestor-or-self::tei:ab/@n"/>
            </xsl:for-each>
            <xsl:text> </xsl:text>
            <xsl:number format="a"/>
        </h2>
    </xsl:template>

    <xsl:template match="tei:div[@type = 'chap']">
        <!-- ID DEL CAPITOLO -->
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <h2>
                <xsl:text>chapter </xsl:text>
                <xsl:value-of select="@n"/>
            </h2>
        </xsl:element>
        <!-- ID DEL CAPITOLO -->

        <xsl:for-each select="descendant-or-self::tei:app">
            <xsl:call-template name="testatinaApparato"/>

            <p>
                <table border="block">
                    <tr>
                        <th>@wit</th>
                        <th>@source</th>
                        <th>@n</th>
                        <th>@rdg</th>
                        <th>@ana</th>
                        <th>@cause</th>
                        <th>@cert</th>
                        <th>@copyOf</th>
                        <th>@type</th>
                        <th>@synch</th>
                        <th>@corresp</th>
                        <th>@sameAs</th>
                    </tr>


                    <xsl:for-each select="descendant-or-self::tei:app/tei:rdg[not(descendant-or-self::tei:rdg[@type = 'Vorlage'])]">
                        <tr>
                            <!-- TESTIMONE O RESP -->
                            <td>
                                <xsl:if test="
                                        ancestor-or-self::tei:rdg[@wit]">
                                    <xsl:value-of select="descendant-or-self::tei:rdg/@wit"/>
                                </xsl:if>
                                <xsl:if test="
                                        ancestor-or-self::tei:rdg[@type = 'conj']">
                                    <!-- <font style="font-variant: small-caps;">-->
                                    <xsl:value-of select="descendant-or-self::tei:rdg/@resp"/>
                                    <!--</font>-->
                                </xsl:if>
                            </td>
                            <!-- TESTIMONE O RESP -->

                            <!-- NUMERO MANOSCRITTO -->
                            <td>
                                <xsl:value-of select="replace(descendant-or-self::tei:rdg/@source, '_', ':')"/>
                            </td>
                            <!-- NUMERO MANOSCRITTO -->

                            <!-- EDIZIONE A STAMPA -->
                            <td>
                                <xsl:value-of select="descendant-or-self::tei:rdg/@n"/>

                            </td>
                            <!-- EDIZIONE A STAMPA -->

                            <!-- LEZIONE VARIANTE -->
                            <td align="right">
                                <xsl:apply-templates select="descendant-or-self::tei:rdg"/>
                            </td>
                            <!-- LEZIONE VARIANTE -->

                            <!-- ANALISI -->
                            <td>
                                <xsl:value-of select="replace(descendant-or-self::tei:rdg/@ana, '_', ' ')"/>
                            </td>
                            <!-- ANALISI -->

                            <!-- TIPOLOGIA VARIANTE -->
                            <td>
                                <xsl:value-of select="replace(descendant-or-self::tei:rdg/@cause, '_', ' ')"/>
                            </td>
                            <!-- TIPOLOGIA VARIANTE -->

                            <!-- GRADO DI CERTEZZA -->
                            <td>
                                <xsl:value-of select="descendant-or-self::tei:rdg/@cert"/>
                            </td>
                            <!-- GRADO DI CERTEZZA -->

                            <!-- TRADUZIONE -->
                            <td>
                                <xsl:apply-templates select="//*[@xml:id = current()/@copyOf]"/>
                            </td>
                            <!-- TRADUZIONE -->

                            <!-- VALUTAZIONE VARIANTE -->
                            <td>
                                <xsl:value-of select="descendant-or-self::tei:rdg/@type"/>
                            </td>
                            <!-- VALUTAZIONE VARIANTE -->

                            <!-- RIFERIMENTO -->
                            <td align="right">
                                <xsl:apply-templates select="//*[@xml:id = current()/@synch]"/>
                            </td>
                            <!-- RIFERIMENTO -->


                            <!-- LOCI PARALLELI -->
                            <td align="right">
                                <xsl:if test="//*[@xml:id = current()/@corresp]">
                                    <xsl:element name="span">
                                        <xsl:attribute name="id">
                                            <xsl:value-of select="@xml:id"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                    <xsl:element name="a">
                                        <xsl:attribute name="tabindex">-1</xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>#</xsl:text>
                                            <xsl:value-of select="//*[@xml:id = current()/@corresp]/@xml:id"/>
                                        </xsl:attribute>
                                        <xsl:apply-templates select="//*[@xml:id = current()/@corresp]/ancestor-or-self::tei:div/@n"/>
                                        <xsl:text> : </xsl:text>
                                        <xsl:apply-templates select="//*[@xml:id = current()/@corresp]/ancestor-or-self::tei:ab/@n"/>
                                        <xsl:text> </xsl:text>
                                    </xsl:element>
                                </xsl:if>
                            </td>
                            <!-- LOCI PARALLELI -->

                            <!-- LEZIONE UGUALE -->
                            <td align="right">
                                <xsl:apply-templates select="//*[@xml:id = current()/@sameAs]"/>
                            </td>
                            <!-- LEZIONE UGUALE -->

                        </tr>
                    </xsl:for-each>
                </table>
            </p>
        </xsl:for-each>
        <style>
            :target{
               border: 2px solid #D4D4D4;-\->
            background-color: #e5eecc;
<!--            animation: background-fade 6s forwards;
-->            }  
            @keyframes background-fade {
            99.9% {
            background:none;
            }
            100% {
            background:none;
            }
        </style>
    </xsl:template>

    <xsl:template match="//tei:rdg">
        <xsl:if test=".[@wit = 'T'] or .[@wit = 'Qa'] or .[@wit = 'Qb'] or .[@wit = 'TM'] or .[@type = 'Vorlage']">
            <font face="Ezra Sil">
                <xsl:apply-templates/>
            </font>
        </xsl:if>
        <xsl:if test=".[@wit = 'Ae'] or .[@wit = 'Ae']">
            <font face="Abyssinica Sil">
                <xsl:apply-templates/>
            </font>
        </xsl:if>
        <xsl:if test=".[@wit = 'G']">
            <font face="SBL Greek">
                <xsl:apply-templates/>
            </font>
        </xsl:if>
        <xsl:if test=".[@wit = 'V'] or .[@wit = 'Hy']">
            <font face="Times New Roman">
                <em>
                    <xsl:apply-templates/>
                </em>
            </font>
        </xsl:if>
        <xsl:if test=".[@wit = 'P' or @wit = 'Syr']">
            <font face="Estrangelo Edessa">
                <xsl:apply-templates/>
            </font>
        </xsl:if>
        <xsl:if test=".[@wit = 'C']">
            <font face="Antinoou">
                <xsl:apply-templates/>
            </font>
        </xsl:if>
        <xsl:if test=".[@wit = 'An']">
            <font face="Times">
                <xsl:apply-templates/>
            </font>
        </xsl:if>
        <xsl:if test=".[@resp]">
            <font face="Times">
                <xsl:apply-templates/>
            </font>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:ref">
        <xsl:if test="//*[@xml:id = current()/@target]">
            <font style="font-style:normal;">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="//*[@xml:id = current()/@target]"/>
                <xsl:text>]</xsl:text>
            </font>
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
