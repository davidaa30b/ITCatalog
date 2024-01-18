<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>


	<xsl:param name="sortOnComputer">name</xsl:param>
	<xsl:param name="sortOrderComputer">descending</xsl:param> <!--descending  ascending-->
	<xsl:param name="sortTypeComputer">text</xsl:param>

	<xsl:param name="sortOnVideocards">name</xsl:param>
	<xsl:param name="sortOrderVideocards">descending</xsl:param>
	<xsl:param name="sortTypeVideocards">text</xsl:param>

	
	<xsl:param name="sortOnProcessors"></xsl:param>
	<xsl:param name="sortOrderProcessors">descending</xsl:param>
	<xsl:param name="sortTypeProcessors">text</xsl:param>

	
	<xsl:param name="sortOnAntiviruses">name</xsl:param>
	<xsl:param name="sortOrderAntiviruses">descending</xsl:param>
	<xsl:param name="sortTypeAntiviruses">text</xsl:param>
	

	<xsl:key name="purposeId" match="catalog/purposes/purpose" use="@id"/>


	<xsl:template match="/">
		<html>
			<head>
				<title>Почти всичко за компютрите</title>
				<link rel = "stylesheet" type="text/css" href="mainStyle.css"/>
				<link rel = "stylesheet" type="text/css" href="productsStyle.css"/>

			</head>
			<script type="text/javascript" src="pagesTransition.js"></script>
			<body>
				<div class = "conta">
					<div class =  "menu">
						<ul>
							<li class = "logo">
								<button class="transparent-button" onclick="showMainmenu();">
									<img src = "images/logo2.png"/>
								</button>
							</li>
							<li>
								<button class="transparent-button" onclick="showComputers();">
									Лаптопи
								</button>
							</li>

							<li>
								<button class="transparent-button" onclick="showProcessors();">
									Процесори
								</button>
							</li>

							<li>
								<button class="transparent-button" onclick="showVideocards();">
									Видеокарти
								</button>
							</li>

							<li>
								<button class="transparent-button" onclick="showAntiviruses();">
									Антивирусни
								</button>
							</li>
						</ul>
					</div>
					<xsl:apply-templates/>
				</div>


				<div class = "bottompiece">
					<div class = "dolu">Не знаeм дали е Copyright free, но е правен от Дейвид Барух и Александър Спиpидонов.</div>
				</div>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="/itProducts/mainMenu">
		<div id="mainmenuContainer" style="display:inline">
			<div class = "banner">
				<div class="app">
					<h1>Почти всичко за компютрите</h1>
					<p>
						При изборa на компютър е важно да се съобразите с вашите нужди.
						<br/>
						Изберете едина от категориите горе, за да разгледате компоненти или лаптопи.
					</p>

				</div>
				<img class="main-image" src="{unparsed-entity-uri(image/@source)}" />
			</div>
		</div>
	</xsl:template>


	<!--Computers-->

	
	<xsl:template match="/itProducts/catalog/products">

    <div id="computerContainer" style="display:none;">
        <table cellspacing="0" width="50%" bgcolor="#35384B" class="tt">
            <xsl:for-each select="/itProducts/catalog/products/product[@iteam='computer'] ">
                <xsl:sort select="*[name(.) = $sortOnComputer]" data-type="{$sortTypeComputer}" order="{$sortOrderComputer}"/>                
                <tr>
                    <td>
                        <img class="computer-image" src="{unparsed-entity-uri(image/@source)}" />
                    </td>
                    <td>
                        <ul class="ma">
                            <div class="sp">
                                <b>
                                    <xsl:value-of select="name"/>
                                </b>
                            </div>
							
                            <li>
                                <b>Дисплей: </b><xsl:value-of select="display"/>
								<xsl:value-of select="displayhertzs"/> <b> Hz </b>
                            </li>
                            <li>
                                <b>Процесор: </b><xsl:value-of select="processor"/> 
								
                            </li>
                            <li>
                                <b>Видео карта: </b><xsl:value-of select="gpu"/>
                            </li>
                            <li>
                                <b>RAM : </b><xsl:value-of select="ram"/><b> GB</b>
                            </li>
							<li>
								<b>Предназначение: </b> <xsl:value-of select="key('purposeId', purpose/@idref)/@id"/>
							</li>
                        </ul>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
	<!--Videocards-->

	<div id="videocardContainer" style="display:none;">
		<table cellspacing="0" width="50%" bgcolor="35384B" class="tt">
			<xsl:for-each select="/itProducts/catalog/products/product[@iteam='videocard']">
				<xsl:sort select="*[name(.) = $sortOnVideocards]" data-type="{$sortTypeVideocards}" order="{$sortOrderVideocards}"/>
				<tr>
					<td>
						<img class="videocard-image" src="{unparsed-entity-uri(image/@source)}" />
					</td>
					<td>
						<ul class="ma">

							<div class="sp">
								<b>
									<xsl:value-of select="name"/>
								</b>
							</div>
							<li>
								<b>Памет: </b>	<xsl:value-of select="memory"/> 
								<b>GB </b> <xsl:value-of select="memoryspeed"/> 
								<b> видео памет</b>
							</li>
							<li>
								<b>Честота: </b> <xsl:value-of select="frequencybase"/>
								<b>GHz base Clock, </b> <xsl:value-of select="frequencyboost"/> 
								<b>GHz Turbo boost</b> 
							</li>
							<li>
								<b>Bandwidth: </b>	<xsl:value-of select="bandwidth"/> 
								<b>GB/s Bandwidth</b>
							</li>
							<li>
								<b>Предназначение: </b> <xsl:value-of select="key('purposeId', purpose/@idref)/@id"/>
							</li>
						</ul>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</div>
	<!--Processors-->

	<div id="processorContainer" style="display:none;">

		<table cellspacing="0" width="50%" bgcolor="35384B" class="tt">
			<xsl:for-each select="/itProducts/catalog/products/product[@iteam='processor']">
				<xsl:sort select="*[name(.) = $sortOnProcessors]" data-type="{$sortTypeProcessors}" order="{$sortOrderProcessors}"/>
				<tr>
					<td>
						<img class="processor-image" src="{unparsed-entity-uri(image/@source)}" />
					</td>
					<td>
						<ul class="ma">

							<div class="sp">
								<b>
									<xsl:value-of select="name"/>
								</b>
							</div>
							<li>
								<b> Физически ядра: </b> <xsl:value-of select="corephis"/> 
								<b>, Логически ядра: </b> <xsl:value-of select="corelog"/>
							</li>
							<li>
								<b>Честота: </b> <xsl:value-of select="frequencybase"/>
								<b>GHz base Clock, </b> <xsl:value-of select="frequencyboost"/> 
								<b>GHz Turbo boost</b> 
							</li>
							<li>
								<b>Кеш: </b> <xsl:value-of select="cache"/> <b> MB</b>
							</li>
							<li>
								<b>Топлинна проектна мощност: </b> <xsl:value-of select="tdp"/> <b> W</b>
							</li>
							<li>
								<b>Предназначение: </b> <xsl:value-of select="key('purposeId', purpose/@idref)/@id"/>
							</li>
						</ul>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</div>
		<!--Antiviruses-->

	<div id="antivirusesContainer" style="display:none;">
        <table cellspacing="0" width="50%" bgcolor="#35384B" class="tt">
            <xsl:for-each select="/itProducts/catalog/products/product[@iteam='antivirus']">
                <xsl:sort select="*[name(.) = $sortOnAntiviruses]" data-type="{$sortTypeAntiviruses}" order="{$sortOrderAntiviruses}"/>                
                <tr>
                    <td>
                        <img class="antivirus-image" src="{unparsed-entity-uri(image/@source)}" />
                    </td>
                    <td>
                        <ul class="ma">
                            <div class="sp">
                                <b>
                                    <xsl:value-of select="name"/>
                                </b>
                            </div>
                            <li>
                                <b>Степен на откриване на зловреден софтуер: </b> <xsl:value-of select="malware"/>
                            </li>
                            <li>
                                <b>Брой устройства: </b> <xsl:value-of select="devices"/>
                            </li>
                            <li>
                                <b>ОС съвместимост: </b> <xsl:value-of select="compatibility"/>
                            </li>
							<li>
								<b>Предназначение: </b> <xsl:value-of select="key('purposeId', purpose/@idref)/@id"/>
							</li>
                          
                        </ul>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>

</xsl:template>


	

</xsl:stylesheet>
