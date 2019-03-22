<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:vann="http://purl.org/vocab/vann/"
    exclude-result-prefixes="xs xd owl vann"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 22, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> gehau</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:variable name="formaten" select="document('../distributies.xml')/distributies/distributie"/>
    <!-- <xsl:variable name="nis" select="document('../../rdf/acd/omgeving/nis-xml.rdf')"/>
    <xsl:param name="hoofactiviteitenarray"
        select="document('../xsd/acd/generiek/Generiek.xsd')/xs:schema/xs:simpleType[@name='HoofdActiviteitenMilieuvergunningenEnumType']/xs:restriction/xs:enumeration/@value"/>
        
    -->
    <xsl:variable name="conceptschemes" select="('../../conceptscheme/antenne_dossier/antenne_dossier.rdf','../../conceptscheme/antenne_gecontroleerde_ruimte_status/antenne_gecontroleerde_ruimte_status.rdf','../../conceptscheme/antenne_demping_materiaal/antenne_demping_materiaal.rdf','../../conceptscheme/antenne_norm_type/antenne_norm_type.rdf','../../conceptscheme/antenne_straling_type/antenne_straling_type.rdf','../../conceptscheme/antenne_dossier_type/antenne_dossier_type.rdf','../../conceptscheme/eenheid/eenheid.rdf','../../conceptscheme/antenne_gebouw_dtype/antenne_gebouw_dtype.rdf','../../conceptscheme/antenne_rekenmethode/antenne_rekenmethode.rdf')"/>
    <xsl:variable name="ontologies" select="('../../../ns/dossier/dossier-ontology.rdf','../../../ns/waarde/waarde-ontology.rdf','../../../ns/zendantenne/zendantenne-ontology.rdf')"/>   
    <xsl:variable name="licensedocument" select="'https://lod.milieuinfo.be/id/licensedocument/didm/gratis_open_data_licentie'"/>
    
    <xsl:template match="/">
        <xsl:result-document href="zendantenne_dcat.rdf">
            <rdf:RDF xmlns:foaf="http://xmlns.com/foaf/0.1/" 
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:dcat="http://www.w3.org/ns/dcat#"
                xmlns:dcterms="http://purl.org/dc/terms/"             
                xmlns:skos="http://www.w3.org/2004/02/skos/core#"
                xmlns:org="http://www.w3.org/ns/org#">
                <!-- 
   zie: https://github.com/datagovuk/dcat-usage/wiki/DCAT-Examples
   https://overheid.vlaanderen.be/open-data-handleiding
   -->
                
                <dcterms:LicenseDocument>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="$licensedocument"/>
                    </xsl:attribute>
                    <dcterms:type rdf:resource="https://overheid.vlaanderen.be/voorwaarden-voor-het-hergebruik-van-overheidsinformatie"/>   
                    <dcterms:rightsHolder rdf:resource="http://data.vlaanderen.be/id/organisatie/OVO003751"/>
                    <dcterms:hasFormat rdf:resource="https://overheid.vlaanderen.be/sites/default/files/documenten/ict-egov/licences_gratis-open-data-licentie1.2.xml"/>  
                </dcterms:LicenseDocument>              
                <org:Organization rdf:about="http://data.vlaanderen.be/id/organisatie/OVO003323">
                    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
                    <foaf:name  xml:lang="nl">Departement Omgeving</foaf:name>     
                    <rdfs:seeAlso rdf:resource="https://wegwijs.vlaanderen.be/#/organisations/ef10b997-ab90-f07c-a689-0da2d0fef485/info"/>
                    <skos:prefLabel  xml:lang="nl">Departement Omgeving</skos:prefLabel>
                    <org:classification rdf:resource="http://data.vlaanderen.be/id/concept/organisatieclassificatie/1e54c545-6f5d-4942-a509-978ae405f34c"/>
                    <org:identifier rdf:datatype="http://www.w3.org/2001/XMLSchema#string">OVO003323</org:identifier>
                    <foaf:homepage rdf:resource="https://www.omgevingvlaanderen.be"/>    
                    <dcterms:type rdf:resource="http://data.vlaanderen.be/id/concept/organisatieclassificatie/1e54c545-6f5d-4942-a509-978ae405f34c"/>   
                </org:Organization>            
                <org:Organization rdf:about="http://data.vlaanderen.be/id/organisatie/OVO003751">
                    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
                    <foaf:name  xml:lang="nl">Data- en informatiebeheer &amp; digitale maatschappij</foaf:name>
                    <rdfs:seeAlso rdf:resource="https://wegwijs.vlaanderen.be/#/organisations/d19a7867-749a-dad6-4f30-351cc3a7fb66"/>
                    <skos:altLabel  xml:lang="nl">DIDM</skos:altLabel>
                    <skos:prefLabel  xml:lang="nl">Data- en informatiebeheer &amp; digitale maatschappij</skos:prefLabel>
                    <org:classification rdf:resource="http://data.vlaanderen.be/id/concept/organisatieclassificatie/b5c586ed-f3dc-4273-b14a-2f458a5c07fa"/>
                    <org:identifier rdf:datatype="http://www.w3.org/2001/XMLSchema#string">OVO003751</org:identifier>
                    <foaf:homepage rdf:resource="https://www.omgevingvlaanderen.be/data-en-informatiebeheer-digitale-maatschappij"/>    
                    <dcterms:type rdf:resource="http://data.vlaanderen.be/id/concept/organisatieclassificatie/b5c586ed-f3dc-4273-b14a-2f458a5c07fa"/>   
                </org:Organization>
                
                <dcat:Catalog rdf:about="https://lod.milieuinfo.be/id/catalog/zendantenne">
                    <foaf:homepage rdf:resource="https://lod.milieuinfo.be/doc/catalog/zendantenne"/>
                    <dcterms:title xml:lang="nl">Catalog Zendantenne</dcterms:title>
                    <dcterms:description xml:lang="nl">De datasets die in het kader van zendantennes worden gepubliceerd</dcterms:description>
                    <dcterms:publisher rdf:resource="http://data.vlaanderen.be/id/organisatie/OVO003323"/>
                    <rdf:type rdf:resource="http://www.w3.org/ns/dcat#Catalog"></rdf:type>
                    <dcterms:issued rdf:datatype="http://www.w3.org/2001/XMLSchema#date">2018-06-01</dcterms:issued>
                    <dcterms:modified  rdf:datatype="http://www.w3.org/2001/XMLSchema#date"><xsl:value-of select="current-date()"/></dcterms:modified>
                    <dcterms:language xml:lang="nl">nl</dcterms:language>
                    <dcterms:license>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="$licensedocument"/>
                        </xsl:attribute>
                    </dcterms:license>
                </dcat:Catalog>
                
                <!-- for each dataset -->
                <dcat:Catalog rdf:about="https://lod.milieuinfo.be/id/catalog/zendantenne">
                    <dcat:dataset rdf:resource="https://lod.milieuinfo.be/id/dataset/zendantenne"/>
                </dcat:Catalog>
                <dcat:Dataset rdf:about="https://lod.milieuinfo.be/id/dataset/zendantenne">
                    <dcterms:title xml:lang="nl">Dataset zendantenne</dcterms:title>
                    <dcterms:description xml:lang="nl">Dataset zendantenne, serialisatie van de databank van https://zendantennes.milieuinfo.be/zendant</dcterms:description>
                    <dcat:theme rdf:resource="http://eurovoc.europa.eu/2176"></dcat:theme>
                    <dcterms:issued  rdf:datatype="http://www.w3.org/2001/XMLSchema#date">2018-06-01</dcterms:issued>
                    <dcterms:spatial rdf:resource="http://publications.europa.eu/resource/authority/country/BEL"/>
                    <dcterms:temporal>2017</dcterms:temporal>
                    <dcterms:temporal>2018</dcterms:temporal>
                    <dcat:contactPoint rdf:resource="mailto:geert@milieuinfo.be"/>
                    <dcterms:publisher rdf:resource="http://data.vlaanderen.be/id/organisatie/OVO003323"/>
                    <dcat:landingPage rdf:resource="https://lod.milieuinfo.be/doc/dataset/zendantenne"/>
                    <dcterms:license>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="$licensedocument"/>
                        </xsl:attribute>
                    </dcterms:license>
                    <!-- <dcterms:source rdf:resource="#item-0ce19e3c-80e5-4e77-a369-ff1a93e37281"/>-->
                </dcat:Dataset>
                <!-- for each distribution -->
                <dcat:Dataset rdf:about="https://lod.milieuinfo.be/id/dataset/zendantenne">
                    <dcat:distribution rdf:resource="https://lod.milieuinfo.be/id/distribution/zendantenne/sparql"/>
                </dcat:Dataset>
                <dcat:Distribution rdf:about="https://lod.milieuinfo.be/id/distribution/zendantenne/sparql">
                    <dcterms:title xml:lang="nl">dataset van zendantenne, sparql API</dcterms:title>
                    <dcterms:description xml:lang="nl">sparql interface op de dataset van zendantenne</dcterms:description>              
                    <dcat:accessURL rdf:resource="https://lod.milieuinfo.be/id/zendantenne/sparql?"/>
                    <dcat:mediaType>application/sparql-query</dcat:mediaType>
                    <dcterms:format>application/sparql-query</dcterms:format>
                    <dcterms:license>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="$licensedocument"/>
                        </xsl:attribute>
                    </dcterms:license>
                </dcat:Distribution>
                <!-- for each distribution -->
                <dcat:Dataset rdf:about="https://lod.milieuinfo.be/id/dataset/zendantenne">
                    <dcat:distribution rdf:resource="https://lod.milieuinfo.be/id/distribution/zendantenne/html"/>
                </dcat:Dataset>
                <dcat:Distribution rdf:about="https://lod.milieuinfo.be/id/distribution/zendantenne/html">
                    <dcterms:title xml:lang="nl">dataset van zendantenne, html distributie</dcterms:title>
                    <dcterms:description xml:lang="nl">dataset van zendantenne in text/html</dcterms:description>
                    <dcat:accessURL rdf:resource="https://lod.milieuinfo.be/doc/distribution/zendantenne"></dcat:accessURL>
                    <dcat:mediaType>text/html</dcat:mediaType>
                    <dcterms:format>text/html</dcterms:format>
                    <dcterms:license>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="$licensedocument"/>
                        </xsl:attribute>
                    </dcterms:license>
                </dcat:Distribution>
                
                
                <xsl:for-each select="$formaten">
                    <xsl:variable name="distribution_resource" select="concat('https://lod.milieuinfo.be/id/distribution/zendantenne/',./extensie)"/>      
                    <dcat:Dataset rdf:about="https://lod.milieuinfo.be/id/dataset/zendantenne">
                        <dcat:distribution>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="$distribution_resource"/>
                            </xsl:attribute>
                        </dcat:distribution>
                    </dcat:Dataset>
                    <dcat:Distribution>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="$distribution_resource"/>
                        </xsl:attribute>
                        <dcterms:title xml:lang="nl"><xsl:value-of select="concat('dataset van zendantenne , ', ./naam, ' distributie.')"/></dcterms:title>
                        <dcterms:description xml:lang="nl"><xsl:value-of select="concat('dataset van zendantenne in ', ./formaat )"/></dcterms:description>
                        <dcat:accessURL >
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat('https://lod.milieuinfo.be/doc/distribution/zendantenne.', ./extensie)"/>
                            </xsl:attribute>
                        </dcat:accessURL>                              
                        <dcat:mediaType><xsl:value-of select="./formaat"/></dcat:mediaType>
                        <dcterms:format><xsl:value-of select="./formaat"/></dcterms:format>
                        <dcterms:license>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="$licensedocument"/>
                            </xsl:attribute>
                        </dcterms:license>
                    </dcat:Distribution>
                </xsl:for-each>
                
                
                <xsl:for-each select="$conceptschemes">
                   <!-- <xsl:variable name="about" select="document(.)/rdf:RDF/rdf:Description[rdf:type/@rdf:resource = 'http://www.w3.org/2004/02/skos/core#ConceptScheme']/@rdf:about"/>-->
                    <xsl:for-each select="document(.)/rdf:RDF/rdf:Description[rdf:type/@rdf:resource = 'http://www.w3.org/2004/02/skos/core#ConceptScheme']">
                        <xsl:variable name="scheme" select="skos:altLabel"/>
                        <xsl:variable name="scheme_uri" select="@rdf:about"/>
                        <xsl:variable name="title" select="dcterms:title"/>
                        <xsl:variable name="dataset_resource" select="concat('https://lod.milieuinfo.be/id/dataset/zendantenne/conceptscheme/',$scheme)"/>                        
                         <dcat:Catalog rdf:about="https://lod.milieuinfo.be/id/catalog/zendantenne">
                             <dcat:dataset>
                                 <xsl:attribute name="rdf:resource">
                                     <xsl:value-of select="$dataset_resource"/>
                                 </xsl:attribute>
                             </dcat:dataset>
                         </dcat:Catalog>
                         <dcat:Dataset >
                             <xsl:attribute name="rdf:about">
                                 <xsl:value-of select="$dataset_resource"/>
                             </xsl:attribute>
                             <dcterms:title xml:lang="nl">
                                 <xsl:value-of select="$title"/>
                             </dcterms:title>
                             <dcterms:description xml:lang="nl"><xsl:value-of select="skos:prefLabel"/></dcterms:description>
                             <dcat:theme rdf:resource="http://eurovoc.europa.eu/2176"></dcat:theme>
                             <dcterms:issued  rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
                                 <xsl:value-of select="dcterms:issued"/>
                             </dcterms:issued>
                             <dcterms:spatial rdf:resource="http://publications.europa.eu/resource/authority/country/BEL"/>
                             <xsl:for-each select="dcterms:temporal">
                                 <dcterms:temporal><xsl:value-of select="."/></dcterms:temporal>                               
                             </xsl:for-each>                      
                             <dcat:contactPoint>
                                 <xsl:attribute name="rdf:resource">
                                     <xsl:value-of select="foaf:maker/rdf:Description/foaf:mbox/@*[namespace-uri()='http://www.w3.org/1999/02/22-rdf-syntax-ns#' and local-name()='resource']"/>
                                 </xsl:attribute>
                             </dcat:contactPoint>
                             <dcterms:publisher rdf:resource="http://data.vlaanderen.be/id/organisatie/OVO003323"/>
                             <dcat:landingPage>
                                 <xsl:attribute name="rdf:resource">
                                     <xsl:value-of select="replace($scheme_uri, '/id/', '/doc/')"/>
                                 </xsl:attribute>
                             </dcat:landingPage>
                             <dcterms:license>
                                 <xsl:attribute name="rdf:resource">
                                     <xsl:value-of select="$licensedocument"/>
                                 </xsl:attribute>
                             </dcterms:license>
                             <!-- <dcterms:source rdf:resource="#item-0ce19e3c-80e5-4e77-a369-ff1a93e37281"/>-->
                         </dcat:Dataset>
                        <!-- for each distribution -->
                        <xsl:for-each select="$formaten">
                            <xsl:variable name="distribution_resource" select="concat('https://lod.milieuinfo.be/id/distribution/zendantenne/conceptscheme/',$scheme,'/',./extensie)"/>      
                            <dcat:Dataset>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$dataset_resource"/>
                                </xsl:attribute>
                                <dcat:distribution>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="$distribution_resource"/>
                                    </xsl:attribute>
                                </dcat:distribution>
                            </dcat:Dataset>
                            <dcat:Distribution>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$distribution_resource"/>
                                </xsl:attribute>
                                <dcterms:title xml:lang="nl"><xsl:value-of select="concat($title, ', ', ./naam, ' distributie.')"/></dcterms:title>
                                <dcterms:description xml:lang="nl"><xsl:value-of select="concat($title, ' in ', ./formaat )"/></dcterms:description>                               
                                <dcat:accessURL >
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="replace(concat($scheme_uri, '.', ./extensie), '/id/', '/doc/')"/>
                                    </xsl:attribute>
                                </dcat:accessURL>                              
                                <dcat:mediaType><xsl:value-of select="./formaat"/></dcat:mediaType>
                                <dcterms:format><xsl:value-of select="./formaat"/></dcterms:format>
                                <dcterms:license>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="$licensedocument"/>
                                    </xsl:attribute>
                                </dcterms:license>
                            </dcat:Distribution>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
                
                
                         
                <xsl:for-each select="$ontologies">
                    <!-- <xsl:variable name="about" select="document(.)/rdf:RDF/rdf:Description[rdf:type/@rdf:resource = 'http://www.w3.org/2004/02/skos/core#ConceptScheme']/@rdf:about"/>-->
                    <xsl:for-each select="document(.)/rdf:RDF/owl:Ontology">
                        <xsl:variable name="name" select="vann:preferredNamespacePrefix"/>
                        <xsl:variable name="ontology_uri" select="replace(vann:preferredNamespaceUri, '/#/', '//')"/>
                        <xsl:variable name="title" select="dcterms:title[@xml:lang='nl']"/>
                        <xsl:variable name="dataset_resource" select="concat('https://lod.milieuinfo.be/id/dataset/zendantenne/ontology/',$name)"/>                        
                        <dcat:Catalog rdf:about="https://lod.milieuinfo.be/id/catalog/zendantenne">
                            <dcat:dataset>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="$dataset_resource"/>
                                </xsl:attribute>
                            </dcat:dataset>
                        </dcat:Catalog>
                        <dcat:Dataset >
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="$dataset_resource"/>
                            </xsl:attribute>
                            <dcterms:title xml:lang="nl">
                                <xsl:value-of select="concat($title, ' ontologie')"/>
                            </dcterms:title>
                            <dcterms:description xml:lang="nl"><xsl:value-of select="concat($title, ' ontologie')"/></dcterms:description>
                            <dcat:theme rdf:resource="http://eurovoc.europa.eu/2176"></dcat:theme>
                            <dcterms:issued  rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
                                <xsl:value-of select="dcterms:issued"/>
                            </dcterms:issued>
                            <dcterms:spatial rdf:resource="http://publications.europa.eu/resource/authority/country/BEL"/>
                            <xsl:for-each select="dcterms:temporal">
                                <dcterms:temporal><xsl:value-of select="."/></dcterms:temporal>                               
                            </xsl:for-each>
                            <dcat:contactPoint>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="foaf:maker/rdf:Description/foaf:mbox/@*[namespace-uri()='http://www.w3.org/1999/02/22-rdf-syntax-ns#' and local-name()='resource']"/>
                                </xsl:attribute>
                            </dcat:contactPoint>
                            <dcterms:publisher rdf:resource="http://data.vlaanderen.be/id/organisatie/OVO003323"/>
                            <dcat:landingPage >
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="$ontology_uri"/>
                                </xsl:attribute>
                            </dcat:landingPage>
                            <dcterms:license>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="$licensedocument"/>
                                </xsl:attribute>
                            </dcterms:license>
                            <!-- <dcterms:source rdf:resource="#item-0ce19e3c-80e5-4e77-a369-ff1a93e37281"/>-->
                        </dcat:Dataset>
                        <!-- for each distribution -->
                        <xsl:for-each select="$formaten">
                            <xsl:variable name="distribution_resource" select="concat('https://lod.milieuinfo.be/id/distribution/zendantenne/ontology/',$name,'/',./extensie)"/>      
                            <dcat:Dataset>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$dataset_resource"/>
                                </xsl:attribute>
                                <dcat:distribution>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="$distribution_resource"/>
                                    </xsl:attribute>
                                </dcat:distribution>
                            </dcat:Dataset>
                            <dcat:Distribution>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$distribution_resource"/>
                                </xsl:attribute>
                                <dcterms:title xml:lang="nl"><xsl:value-of select="concat($title, ' ontologie, ', ./naam, ' distributie.')"/></dcterms:title>
                                <dcterms:description xml:lang="nl"><xsl:value-of select="concat($title, ' ontologie in ', ./formaat )"/></dcterms:description>                              
                                <dcat:accessURL >
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="concat($ontology_uri, '.', ./extensie)"/>
                                    </xsl:attribute>
                                </dcat:accessURL>                              
                                <dcat:mediaType><xsl:value-of select="./formaat"/></dcat:mediaType>
                                <dcterms:format><xsl:value-of select="./formaat"/></dcterms:format>
                                <dcterms:license>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="$licensedocument"/>
                                    </xsl:attribute>
                                </dcterms:license>
                            </dcat:Distribution>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
                
            </rdf:RDF>
        </xsl:result-document>
    </xsl:template>
            
</xsl:stylesheet>