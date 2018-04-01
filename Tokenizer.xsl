<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template name="spanWord">
        <xsl:element name="span">
                  <xsl:value-of select=" lower-case(.)"/>
            
        </xsl:element>
    </xsl:template>

    <xsl:template name="spanVerse">
        <br></br>
        <xsl:element name="ab">
                  <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="spanPunct">
        <xsl:element name="span">
                  <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="divChap">
        <xsl:element name="div">
                  <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="text/node()[not(descendant-or-self::div)]">

        <xsl:for-each select="tokenize(., '[\s\r\n . , / ( ) ! ? ; : ־ ׃ ` #   ܂ ܀]+')">
         
            <xsl:if test="matches(., '[\d]')">
                <xsl:call-template name="spanVerse"/>
            </xsl:if>

            <xsl:if test="matches(., '[\D]+')">
                <xsl:call-template name="spanWord"/>
            </xsl:if>
            
<!-- PUNCTUACTION -->
            <!--   <xsl:if test="matches(., '[. , ( ) ! ? ; :]+')">
                <xsl:call-template name="spanPunct"/>
            </xsl:if>-->
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="text/div">
        <xsl:call-template name="divChap"/>
    </xsl:template>


    <xsl:template match="text()">
    </xsl:template>

</xsl:stylesheet>
