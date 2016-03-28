<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="Recipe">
        <html>
            <head>
                <!-- CSS is being added. IE compatible-->
                <link rel="stylesheet" type="text/css" href="../Css/Recipe.css"/>
            </head>
            <body>
                <!-- Header-->
               <div class="title">
                   <xsl:for-each select="Delectable">
                       <xsl:value-of select="concat(name(.),' - ' )"></xsl:value-of>
                   </xsl:for-each>
                   <xsl:value-of select="Title"></xsl:value-of>
               </div>
                
                <div>
                  <p>    
                      <!-- Recipe introduction-->
                        <xsl:value-of select="Introduction/Description"></xsl:value-of>
                  </p>               
                </div>
                
                <div>
                            <xsl:for-each select="@*">
                                <span>
                                    <!-- Not including Recipe by attribute-->
                                    <xsl:if test= "name() != 'RecipeBy'">
                                       <xsl:value-of select="concat(name(), ' : ', . )" ></xsl:value-of>  
                                    </xsl:if>
                                </span>
                            </xsl:for-each>                     
                </div>
                <div> 
                    <!-- displaying ingredients-->
                    <div id="ingridents" >
                        <h1>Ingredients</h1>
                        <ul class="ulingridents">
                            <!-- concatenate ingredients , quantity and units-->
                        <xsl:for-each select="Ingredients/Item"> 
                            <li class="liingridents">                                                                                     
                                <xsl:for-each select="Information">
                                <xsl:choose>
                                    <xsl:when test="count(child::*) &gt; 0">                                                                                  
                                        <xsl:value-of select="concat(Detail/Quantity, ' ')"></xsl:value-of>
                                        <xsl:for-each select="Detail">
                                            <xsl:if test="count(child::*) &gt; 1"> 
                                        
                                            <xsl:value-of select="concat(Unit, ' of ')"></xsl:value-of>
                                         
                                            </xsl:if>
                                        </xsl:for-each>
                                        <xsl:value-of select="../Name"></xsl:value-of>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat(../Name, ' ')"></xsl:value-of>
                                        <xsl:value-of select="text()"></xsl:value-of>  
                                    </xsl:otherwise>                                                                                               
                                </xsl:choose>
                                </xsl:for-each>
                           </li>
                        </xsl:for-each>
                        </ul>
                    </div>
                    <!-- displaying image and it's hyperlinked-->
                    <div id="imagediv"> 
                        <a target="blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="Introduction/Description/@Source"></xsl:value-of> 
                            </xsl:attribute>
                      
                        <img alt="Recipe Icon" style="height:240px; width:70%;">
                            <xsl:attribute name = "src" >
                                <xsl:value-of select="Introduction/Description/@Image"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                        </a>
                    </div> 
                    <div class="clearleft">
                        <!-- diplaying instructions-->
                        <h1>Instructions</h1>
                       
                            <ol>
                        <xsl:for-each select="Procedure/Step">
                            <li>
                                <xsl:value-of select="text()"></xsl:value-of><br/>
                          </li>
                        </xsl:for-each>
                        </ol>
                        
                    </div>
                </div>
                <div id="groupinfo">
                    <!-- student info-->
                    <xsl:variable
                        name="presenterID"
                        select="@RecipeBy">                                    
                    </xsl:variable>                   
                    <xsl:for-each select="Groups/Group/Student">                       
                        <xsl:if test="@ID = $presenterID">
                            <xsl:value-of select="../@Group_Name"></xsl:value-of><br/><br/>
                            <xsl:value-of select="concat('Recipe By', ' - ' , FirstName,' ', LastName)">                            
                            </xsl:value-of>  
                        </xsl:if>
                        
                    </xsl:for-each>     
                                 
                </div>
              
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>