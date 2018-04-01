<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns="http://www.w3.org/1999/xhtml">

        <!--=============================================== LaTeX PREAMBLE ====================================================== -->
        <!-- importo per intero il preambolo LaTeX che uso normalmente -->
        <xsl:template match="tei:fileDesc">
                <font color="red">
                        <xsl:text>\documentclass[9pt]{book}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage[utf8]{inputenc}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage[T1]{fontenc}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{fancyhdr}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{lipsum}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{fontspec}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{xltxtra}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{endnotes}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{eledmac}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{eledpar}</xsl:text>
                        <br/>
                        <xsl:text>\renewcommand*{\printnpnum}[1]{}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{geometry}</xsl:text>
                        <br/>
                        <xsl:text>\geometry{a4paper,top=5cm,left=3cm,right=5cm,heightrounded,bindingoffset=12mm}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{pdfpages}</xsl:text>
                        <br/>
                        <xsl:text>\setmainfont[Mapping=text]{Old Standard}</xsl:text>
                        <br/>
                        <xsl:text>\newfontfamily\hebrewfont{Ezra SIL}</xsl:text>
                        <br/>
                        <xsl:text>\newfontface</xsl:text>
                        <br/>
                        <xsl:text>\armfont[Script=Armenian]{DejaVu Serif Condensed}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{polyglossia}</xsl:text>
                        <br/>
                        <xsl:text>\setdefaultlanguage{english}</xsl:text>
                        <br/>
                        <xsl:text>\setmainlanguage{italian}</xsl:text>
                        <br/>
                        <xsl:text>\setotherlanguage[variant=polytonic]{greek}</xsl:text>
                        <br/>
                        <xsl:text>\setotherlanguage{hebrew}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{latexsym}</xsl:text>
                        <br/>
                        <xsl:text>\pagestyle{fancy}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{microtype}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{amsfonts}</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{quoting}</xsl:text>
                        <br/>
                        <xsl:text>\quotingsetup{font=small}</xsl:text>
                        <br/>
                        <xsl:text>\setcounter{firstlinenum}{5}</xsl:text>
                        <br/>
                        <xsl:text>\setcounter{linenumincrement}{5}</xsl:text>
                        <br/>
                        <xsl:text>\lineation{section}</xsl:text>
                        <br/>
                        <xsl:text>\linenummargin{left}</xsl:text>
                        <br/>
                        <xsl:text>\foottwocol{A}%apparatosuduecolonne,nonnecessitadi\LR</xsl:text>
                        <br/>
                        <xsl:text>\footthreecol{B}%apparatosutrecolonne,nonnecessitadi\LR</xsl:text>
                        <br/>
                        <xsl:text>\footnormal{C}%apparatocontinuo,necessitadi\LR</xsl:text>
                        <br/>
                        <xsl:text>\footnormal{D}%apparatocontinuo,conaccapoadognilemma,necessitadi\LR</xsl:text>
                        <br/>
                        <xsl:text>\footparagraph{E}%apparatocontinuo,senzaaccapo,nonnecessitadi\LR</xsl:text>
                        <br/>
                        <xsl:text>\let\footnoteruleA=\relax</xsl:text>
                        <br/>
                        <xsl:text>\usepackage{setspace}</xsl:text>
                        <br/>
                        <xsl:text>\linespread{1.2}</xsl:text>
                        <br/>
                        <xsl:text>\renewcommand*{\notefontsetup}{\scriptsize}</xsl:text>
                        <br/>
                        <xsl:text>\makeatletter</xsl:text>
                        <br/>
                        <xsl:text>%comandoperdefinireilpedice(\textsubscrip)</xsl:text>
                        <br/>
                        <xsl:text>\DeclareRobustCommand*\textsubscript[1]{%</xsl:text>
                        <br/>
                        <xsl:text>\@textsubscript{\selectfont 1}}</xsl:text>
                        <br/>
                        <xsl:text>\def\@textsubscript 1{%</xsl:text>
                        <br/>
                        <xsl:text>{\m@th\ensuremath{_{\mbox{\fontsize\sf@size\z@ 1}}}}}</xsl:text>
                        <br/>
                        <xsl:text>\makeatother</xsl:text>
                        <br/>
                        <xsl:text>\renewcommand*{\rbracket}{\textnormal{\thinspace:}}
                        \newcommand\tab[1][1cm]{\hspace*{ 1}}
                        </xsl:text>
                        <br/>
                        <xsl:text>\usepackage{endnotes}</xsl:text>
                        <br/>
                        <xsl:text>\addtolength{\skip\Efootins}{4.5mm}		% aumenta la distanza tra testo critico e apparato</xsl:text>
                        <br/>
                        <xsl:text>\let\Efootnoterule=\relax				% toglie la barra di separazione tra testo critico e apparato</xsl:text>
                        <br/>
                        <xsl:text>\renewcommand{\notenumfont}{\bfseries}	% mette in grassetto i numeri nell'apparato </xsl:text>
                        <br/>
                </font>
                <xsl:apply-templates/>

        </xsl:template>

        <!--=============================================== LaTeX PREAMBLE ====================================================== -->

        <!-- LIST OF WITNESSES -->
        <!-- perché la conversione funzioni e non si creino overlapping non supportati da LaTeX, una eventuale lista dei testimoni deve trovarsi in sourceDesc -->
        <xsl:template match="tei:listWit[@xml:id]">
                <xsl:if test="./tei:head">
                        <!-- se è presente un titolo per la lista dei testimoni, questo deve essere posto prima di listWit[@xml:id], come nel file di prova ER -->
                        <xsl:text>\subsection*{</xsl:text>
                        <!-- il titolo è inserito in \subsection{} -->
                        <xsl:value-of select="./tei:head"/>
                        <xsl:text>}</xsl:text>
                </xsl:if>
                <font color="saddleBrown">
                        <br/>
                        <b>
                                <xsl:text>\begin{table}[htbp]\begin{tabular}{lp{0.9\textwidth}}</xsl:text>
                                <!-- i testimoni vengono sistemati in tabelle; si apre l'ambiente tabular -->
                        </b>
                        <br/>
                </font>
                <xsl:apply-templates select="./*[not(descendant-or-self::tei:head)]"/>
                <!-- seleziona i testimoni ma esclude discendenti, come tei:head -->
                <font color="saddleBrown">
                        <b>
                                <xsl:text>\end{tabular}\end{table}</xsl:text>
                                <!-- si chiude l'ambiente tabular -->
                        </b>
                </font>
                <br/>
        </xsl:template>

        <xsl:template match="tei:witness" name="witness">
                <xsl:text>\textbf{</xsl:text>
                <xsl:value-of select="./@xml:id"/>
                <!-- le sigle dei tesimoni di xml:id vengono marcate in grassetto -->
                <xsl:text>}</xsl:text>
                <font color="red">
                        <b>
                                <xsl:text>&amp;</xsl:text>
                                <!-- & separa le due colonne delle tabelle -->
                        </b>
                </font>
                <xsl:value-of select="."/>
                <font color="red">
                        <b>
                                <xsl:text> \\</xsl:text>
                                <!-- // segnala la fine della riga -->
                        </b>
                        <br/>
                </font>
        </xsl:template>
        <!-- LIST OF WITNESSES -->


        <xsl:template match="tei:sourceDesc">
                <br/>
                <b>
                        <font color="darkGreen">
                                <xsl:text>\begin{document}</xsl:text>
                                <!-- comando che apre un documento LaTeX -->
                        </font>
                </b>
                <xsl:apply-templates/>
        </xsl:template>

        <!-- CRITICAL TEXT -->
        <xsl:template match="tei:div">
                <xsl:text>\newpage</xsl:text>
                <!-- ad ogni div si crea una nuova pagina -->
                <b>
                        <br/>
                        <font color="red">
                                <xsl:text>\beginnumbering</xsl:text>
                                <!-- ad ogni div comincia la numerazione del testo critico -->
                                <br/>
                                <xsl:text>\pstart‭</xsl:text>
                        </font>
                </b>
                <xsl:apply-templates/>
                <b>
                        <font color="red">
                                <br/>
                                <xsl:text>\pend</xsl:text>
                                <br/>
                                <xsl:text>\endnumbering</xsl:text>
                                <br/>
                        </font>
                </b>
        </xsl:template>
        <!-- CRITICAL TEXT -->

        <!-- TITLE OF SECTIONS -->
        <xsl:template match="tei:div/tei:head">
                <!-- codifica del titolo delle varie sezioni div contenenti testo critico -->
                <br/>
                <b>
                        <xsl:text>\begin{center}</xsl:text>
                        <xsl:text>\textbf{</xsl:text>
                </b>
                <xsl:apply-templates/>
                <b>
                        <xsl:text>} \end{center}</xsl:text>
                </b>
                <br/>
        </xsl:template>
        <!-- TITLE OF SECTIONS -->

        <xsl:template match="tei:app">
                <xsl:apply-templates/>
        </xsl:template>

        <xsl:template match="tei:lem">
                <br/>
                <font color="blue">
                        <xsl:text>\edtext</xsl:text>
                        <!-- il comando \edtext equivale a <lem> di TEI -->
                        <b>
                                <xsl:text>{</xsl:text>
                        </b>
                </font>
                <xsl:apply-templates/>
                <font color="blue">
                        <b>
                                <xsl:text>}{</xsl:text>
                        </b>
                </font>

<!-- poiché i dati che vanno in \edtext vengono accolti nel testo critico, se si vuole riportare, ad esempio, la sigla di un testimone per una lezione accolta a testo, ma non si
                        vuole che questa figuri nel testo critico stesso, è necessario ricorrere al comando \lemma{}, che permette di una entrata d'apparato diversa dal lemma -->
               
                <xsl:if test=".[node()][@wit]"><!-- se il lemma NON VUOTO presenta dei testimoni, seleziono <lem> MA NON i discendenti e posiziono in \lemma{ } le sigle dei testimoni -->                        
                        <font color="green">
                                <xsl:text>\lemma{</xsl:text>
                                <xsl:value-of select=".[not(descendant-or-self::tei:rdg)]"/>
                                <xsl:if test=".[@wit]">
                                        <xsl:text> \textit{</xsl:text>
                                        <xsl:value-of select="replace(./@wit, '#', '')"/>
                                        <xsl:text>}</xsl:text>
                                </xsl:if>
                                <xsl:text>}</xsl:text>
                        </font>
                </xsl:if>
                <xsl:if test=".[not(node())]"> <!-- se il lemma è un MILESTONE e presenta dei testimoni, raccolgo in \lemma{} tutte le parole precedenti al lemma stesso (con le condizioni di cui
                        sotto). Questo permette di riportare in apparato l'ultima parola del testo critico, in modo da poter indicare la presenza di varianti. -->                       
                        <font color="green">
                                <xsl:text>\lemma{</xsl:text>
                                <xsl:value-of select="./preceding::*[not(self::tei:rdg)][not(self::tei:note)][not(ancestor-or-self::tei:rdg)][1]"/>
                                <xsl:if test=".[@wit]">
                                        <xsl:text> \textit{</xsl:text>
                                        <xsl:value-of select="replace(./@wit, '#', '')"/>
                                        <xsl:text>}</xsl:text>
                                </xsl:if>
                                <xsl:text>}</xsl:text>
                        </font>
                </xsl:if>
            
            <!-- codifica delle rdg -->
                
                <font color="red">
                        <xsl:text>\Efootnote{</xsl:text>
                </font>
                <xsl:for-each select="following-sibling::tei:rdg">

                        <!-- seleziona le rdg -->
                        <xsl:if test="./preceding-sibling::tei:lem[not(node())]"> <!-- se la rdg è in relazione con un lemma privo di testo (milestone), questo significa che il testo della <rdg> "aggiunge"
                                qualcosa al testo di <lem>. Poiché sopra una <lem> milestone è stata codificata in modo che in apparato venga visualizzata l'ultima parola del testo critico, in questo
                                modo il testo della variante si aggancia a tale ultima parola (da qui la sigla "add."). Si veda come esempio la riga 8 del file ER_1-146, lemma in apparato:
                                "temptaverit" e la prima riga del file "avicenna"-->
                                <xsl:text>\textit{add.} </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="."/>
                        <xsl:if test=".[not(node())]"> <!-- se la variante è vuota inserisce om. -->                               
                                <font color="orange">
                                        <xsl:text>\emph{om.}</xsl:text>
                                </font>
                        </xsl:if>
                        <font color="magenta">
                                <xsl:text> \textit{</xsl:text>
                                <xsl:if test=".[@wit]">
                                        <xsl:value-of select="replace(./@wit, '#', '')"/>
                                </xsl:if>
                                <xsl:if test=".[@resp]">
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="replace(./@resp, '#', '')"/>
                                </xsl:if>
                                <xsl:text>} </xsl:text>
                        </font>
                </xsl:for-each>
                <xsl:for-each select="following-sibling::*/tei:rdg"> <!-- seleziona le rdg figlie di altri nodi, ad esempio rdgGrp -->                        
                        <xsl:value-of select="."/>
                        <xsl:if test=".[not(node())]">  <!-- se la variante è vuota inserisce om. -->                              
                                <font color="orange">
                                        <xsl:text> \emph{om.}</xsl:text>
                                </font>
                        </xsl:if>
                        <font color="magenta">
                                <xsl:text> \textit{</xsl:text>
                                <xsl:value-of select="replace(./@wit, '#', '')"/>
                                <xsl:text>} </xsl:text>
                        </font>
                </xsl:for-each>
                <font color="red">
                        <xsl:text>}</xsl:text>
                </font>
                <font color="blue">
                        <b>
                                <xsl:text>}</xsl:text>
                        </b>
                </font>
        </xsl:template>

        <xsl:template match="tei:rdg"/>
        <xsl:template match="tei:rdgGrp">
                <xsl:apply-templates/>
        </xsl:template>


        <xsl:template match="tei:text">
                <xsl:apply-templates/>
                <b>
                        <font color="DarkGreen">
                                <xsl:text>\end{document}</xsl:text>
                        </font>
                </b>
        </xsl:template>




        <!--=============================================== GARBAGE COLLECTOR====================================================== -->
        <xsl:template match="tei:note"/>
        <xsl:template match="tei:div[@n = 'Capitula 14-50']"/>
        <xsl:template match="tei:div[@n = 'Capitula 51-146']"/>
        <xsl:template match="tei:div[@n = 'Prologo']"/>
        <xsl:template match="tei:titleStmt"/>
        <xsl:template match="tei:editionStmt"/>
        <xsl:template match="tei:publicationStmt"/>
        <xsl:template match="tei:msDesc"/>
        <xsl:template match="tei:extent"/>
        <xsl:template match="tei:encodingDesc"/>
        <xsl:template match="tei:profileDesc"/>
        <xsl:template match="tei:revisionDesc"/>
        <xsl:template match="tei:biblStruct"/>

</xsl:stylesheet>
