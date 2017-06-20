-- MySQL dump 10.16  Distrib 10.1.17-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: yahoo
-- ------------------------------------------------------
-- Server version	10.1.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `idx`
--

DROP TABLE IF EXISTS `idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx` (
  `Index_ID` varchar(10) NOT NULL,
  `Index_Name` varchar(50) NOT NULL,
  `CountryName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx`
--

LOCK TABLES `idx` WRITE;
/*!40000 ALTER TABLE `idx` DISABLE KEYS */;
INSERT INTO `idx` VALUES ('^TWII','TSEC weighted index','Taiwan'),('^TFNI','TSEC finance subindex','Taiwan'),('^TPLI','TSEC plastics subindex','Taiwan'),('^TFII','TSEC foods subindex','Taiwan'),('^TEII','TSEC electrical subindex','Taiwan'),('^DJI','Dow Jones','United States'),('^GSPC','S&P 500','United States'),('^OEX','S&P 100','United States'),('^MID','S&P MID CAP 400 INDEX','United States'),('^IXIC','NASDAQ','United States'),('^NDX','NASDAQ 100','United States'),('^BANK','NASDAQ Bank','United States'),('^NBI','NASDAQ Biotechnology','United States'),('^IXCO','NASDAQ Computer','United States'),('^INDS','NASDAQ Industrial','United States'),('^INSR','NASDAQ Insurance','United States'),('^TRAN','NASDAQ Transportation','United States'),('^NYA','NYSE COMPOSITE','United States'),('^RUA','Russell 3000','United States'),('^RUT','Russell 2000','United States'),('^RUI','Russell 1000','United States'),('^SOX','PHLX Semiconductor','United States'),('^FTSE','FTSE 100','United Kingdom'),('^GDAXI','DAX','Germany'),('^FCHI','CAC 40','France'),('^STOXX50E','ESTX50 EUR P','Europe'),('^ATX','ATX','Austria'),('^SSMI','Swiss Market','Switzerland'),('^OSEAX','OSE All Share','Norway'),('^SMSI','Madrid General','Spain'),('^BFX','BEL-20','Belgium'),('^MXX','IPC','Mexico'),('^GSPTSE','S&P/TSX Composite index','Canada'),('^BVSP','IBOVESPA','Brazil'),('^SSEC','Shanghai Composite','China'),('^SZSC','深證成指','China'),('^SZSA','深證A指','China'),('^SZSB','深證B指','China'),('^N225','Nikkei 225','Japan'),('^HSI','Hang Seng','Hong Kong'),('^AORD','ALL ORDINARIES','Australia'),('^NZ50','NZX 50 INDEX GROSS','New Zealand'),('^STI','STRAITS TIMES INDEX','Singapore'),('^KS11','KOSPI Composite Index','South Korea'),('^KLSE','FTSE Bursa Malaysia KLCI','Malaysia'),('^JKSE','Composite Index','Indonesia'),('^BSESN','S&P BSE SENSEX','India');
/*!40000 ALTER TABLE `idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx_dd`
--

DROP TABLE IF EXISTS `idx_dd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_dd` (
  `DDate` date NOT NULL,
  `Index_ID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL,
  `TShare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_dd`
--

LOCK TABLES `idx_dd` WRITE;
/*!40000 ALTER TABLE `idx_dd` DISABLE KEYS */;
/*!40000 ALTER TABLE `idx_dd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx_mm`
--

DROP TABLE IF EXISTS `idx_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_mm` (
  `DDate` date NOT NULL,
  `Index_ID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL,
  `TShare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_mm`
--

LOCK TABLES `idx_mm` WRITE;
/*!40000 ALTER TABLE `idx_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `idx_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx_ww`
--

DROP TABLE IF EXISTS `idx_ww`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_ww` (
  `DDate` date NOT NULL,
  `Index_ID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL,
  `TShare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_ww`
--

LOCK TABLES `idx_ww` WRITE;
/*!40000 ALTER TABLE `idx_ww` DISABLE KEYS */;
/*!40000 ALTER TABLE `idx_ww` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nasdaq100`
--

DROP TABLE IF EXISTS `nasdaq100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nasdaq100` (
  `SecID` varchar(10) NOT NULL,
  `SecName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `SecID` (`SecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nasdaq100`
--

LOCK TABLES `nasdaq100` WRITE;
/*!40000 ALTER TABLE `nasdaq100` DISABLE KEYS */;
INSERT INTO `nasdaq100` VALUES ('AAL',' American Airlines Group Inc.'),('AAPL',' Apple Inc.'),('ADBE',' Adobe Systems Incorporated'),('ADI',' Analog Devices Inc.'),('ADP',' Automatic Data Processing Inc.'),('ADSK',' Autodesk Inc.'),('AKAM',' Akamai Technologies Inc.'),('ALXN',' Alexion Pharmaceuticals Inc.'),('AMAT',' Applied Materials Inc.'),('AMGN',' Amgen Inc.'),('AMZN',' Amazon.com Inc.'),('ATVI',' Activision Blizzard Inc'),('AVGO',' Broadcom Limited'),('BBBY',' Bed Bath &amp; Beyond Inc.'),('BIDU',' Baidu Inc.'),('BIIB',' Biogen Inc.'),('BMRN',' BioMarin Pharmaceutical Inc.'),('CA',' CA Inc.'),('CELG',' Celgene Corporation'),('CERN',' Cerner Corporation'),('CHKP',' Check Point Software Technologies Ltd.'),('CHTR',' Charter Communications Inc.'),('CMCSA',' Comcast Corporation'),('COST',' Costco Wholesale Corporation'),('CSCO',' Cisco Systems Inc.'),('CSX',' CSX Corporation'),('CTRP',' Ctrip.com International Ltd.'),('CTSH',' Cognizant Technology Solutions Corporation'),('CTXS',' Citrix Systems Inc.'),('DISCA',' Discovery Communications Inc.'),('DISCK',' Discovery Communications Inc.'),('DISH',' DISH Network Corporation'),('DLTR',' Dollar Tree Inc.'),('EA',' Electronic Arts Inc.'),('EBAY',' eBay Inc.'),('ESRX',' Express Scripts Holding Company'),('EXPE',' Expedia Inc.'),('FAST',' Fastenal Company'),('FB',' Facebook Inc.'),('FISV',' Fiserv Inc.'),('FOX',' Twenty-First Century Fox Inc.'),('FOXA',' Twenty-First Century Fox Inc.'),('GILD',' Gilead Sciences Inc.'),('GOOG',' Alphabet Inc.'),('GOOGL',' Alphabet Inc.'),('HSIC',' Henry Schein Inc.'),('ILMN',' Illumina Inc.'),('INCY',' Incyte Corporation'),('INTC',' Intel Corporation'),('INTU',' Intuit Inc.'),('ISRG',' Intuitive Surgical Inc.'),('JD',' JD.com Inc.'),('KHC',' The Kraft Heinz Company'),('LBTYA',' Liberty Global plc'),('LBTYK',' Liberty Global plc'),('LRCX',' Lam Research Corporation'),('LVNTA',' Liberty Interactive Corporation'),('MAR',' Marriott International'),('MAT',' Mattel Inc.'),('MCHP',' Microchip Technology Incorporated'),('MDLZ',' Mondelez International Inc.'),('MNST',' Monster Beverage Corporation'),('MSFT',' Microsoft Corporation'),('MU',' Micron Technology Inc.'),('MXIM',' Maxim Integrated Products Inc.'),('MYL',' Mylan N.V.'),('NCLH',' Norwegian Cruise Line Holdings Ltd.'),('NFLX',' Netflix Inc.'),('NTAP',' NetApp Inc.'),('NTES',' NetEase Inc.'),('NVDA',' NVIDIA Corporation'),('NXPI',' NXP Semiconductors N.V.'),('ORLY',' O\'Reilly Automotive Inc.'),('PAYX',' Paychex Inc.'),('PCAR',' PACCAR Inc.'),('PCLN',' The Priceline Group Inc.'),('PYPL',' PayPal Holdings Inc.'),('QCOM',' QUALCOMM Incorporated'),('QVCA',' Liberty Interactive Corporation'),('REGN',' Regeneron Pharmaceuticals Inc.'),('ROST',' Ross Stores Inc.'),('SBAC',' SBA Communications Corporation'),('SBUX',' Starbucks Corporation'),('SHPG',' Shire plc'),('SIRI',' Sirius XM Holdings Inc.'),('SRCL',' Stericycle Inc.'),('STX',' Seagate Technology PLC'),('SWKS',' Skyworks Solutions Inc.'),('SYMC',' Symantec Corporation'),('TMUS',' T-Mobile US Inc.'),('TRIP',' TripAdvisor Inc.'),('TSCO',' Tractor Supply Company'),('TSLA',' Tesla Motors Inc.'),('TXN',' Texas Instruments Incorporated'),('ULTA',' Ulta Salon Cosmetics &amp; Fragrance Inc.'),('VIAB',' Viacom Inc.'),('VOD',' Vodafone Group Plc'),('VRSK',' Verisk Analytics Inc.'),('VRTX',' Vertex Pharmaceuticals Incorporated'),('WBA',' Walgreens Boots Alliance Inc.'),('WDC',' Western Digital Corporation'),('WFM',' Whole Foods Market Inc.'),('XLNX',' Xilinx Inc.'),('XRAY',' DENTSPLY SIRONA Inc.'),('YHOO',' Yahoo! Inc.');
/*!40000 ALTER TABLE `nasdaq100` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp500`
--

DROP TABLE IF EXISTS `sp500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp500` (
  `SecID` varchar(10) NOT NULL,
  `SecName` varchar(50) DEFAULT NULL,
  `outShare` double DEFAULT NULL,
  `indexWT` decimal(10,4) DEFAULT NULL,
  UNIQUE KEY `SecID` (`SecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp500`
--

LOCK TABLES `sp500` WRITE;
/*!40000 ALTER TABLE `sp500` DISABLE KEYS */;
INSERT INTO `sp500` VALUES ('A','Agilent Technologies Inc',327770000,0.0007),('AA','Alcoa Inc',1315107000,0.0007),('AAL','American Airlines Group Inc.',578172000,0.0010),('AAP','Advance Auto Parts Inc',73556000,0.0006),('AAPL','Apple Inc.',5477425000,0.0289),('ABBV','AbbVie Inc.',1617359000,0.0054),('ABC','AmerisourceBergen Corp',215855000,0.0009),('ABT','Abbott Laboratories',1469152000,0.0033),('ACN','Accenture plc A',623791000,0.0035),('ADBE','Adobe Systems Inc',500210000,0.0024),('ADI','Analog Devices Inc',307350000,0.0009),('ADM','Archer-Daniels-Midland Co',587582000,0.0013),('ADP','Automatic Data Processing',455535000,0.0020),('ADS','Alliance Data Systems Corp',58940000,0.0006),('ADSK','Autodesk Inc',224589000,0.0006),('AEE','Ameren Corp',242635000,0.0006),('AEP','American Electric Power',491313000,0.0017),('AES','AES Corp',659001000,0.0004),('AET','Aetna Inc',350600000,0.0020),('AFL','AFLAC Inc',413987000,0.0015),('AGN','Allergan plc',395557000,0.0050),('AIG','American Intl Group Inc',1119032000,0.0030),('AIV','Apartment Investment & Mgmt',156610000,0.0003),('AIZ','Assurant Inc',61937000,0.0002),('AJG','Gallagher Arthur J. & Co',177129000,0.0004),('AKAM','Akamai Technologies Inc',175592000,0.0004),('ALB','Albemarle Corp',112297000,0.0004),('ALK','Alaska Air Group Inc',123253000,0.0004),('ALL','Allstate Corp',374367000,0.0012),('ALLE','Allegion plc',95734000,0.0003),('ALXN','Alexion Pharmaceuticals Inc',224020000,0.0014),('AMAT','Applied Materials Inc',1089144000,0.0014),('AME','AMETEK Inc',233410000,0.0005),('AMG','Affiliated Managers Grp',53810000,0.0003),('AMGN','Amgen Inc',751217000,0.0065),('AMP','Ameriprise Financial Inc',165813000,0.0008),('AMT','American Tower Corp A',424560000,0.0024),('AMZN','Amazon.com Inc',471828000,0.0181),('AN','AutoNation Inc',103104000,0.0002),('ANTM','Anthem Inc',262953000,0.0017),('AON','Aon plc',264919000,0.0014),('APA','Apache Corp',378534000,0.0010),('APC','Anadarko Petroleum Corp',510427000,0.0014),('APD','Air Products & Chemicals Inc',216081000,0.0016),('APH','Amphenol Corp A',307927000,0.0009),('ATVI','Activision Blizzard Inc',738228000,0.0015),('AVB','AvalonBay Communities Inc',137163000,0.0012),('AVGO','Broadcom Limited',390448000,0.0032),('AVY','Avery Dennison Corp',89180000,0.0003),('AWK','American Water Works Co Inc',177715000,0.0007),('AXP','American Express Co',951033000,0.0031),('AYI','Acuity Brands Inc',43830000,0.0005),('AZO','AutoZone Inc',29859000,0.0012),('BA','Boeing Co',637011000,0.0043),('BAC','Bank of America Corp',10271916000,0.0075),('BAX','Baxter Intl Inc',552263000,0.0013),('BBBY','Bed Bath & Beyond Inc',154367000,0.0003),('BBT','BB&T Corp',820866000,0.0015),('BBY','Best Buy Co Inc',324078000,0.0005),('BCR','Bard C.R. Inc',73319000,0.0008),('BDX','Becton Dickinson & Co',212202000,0.0018),('BEN','Franklin Resources Inc',584931000,0.0010),('BF.B','Brown-Forman Corp B',115520000,0.0005),('BHI','Baker Hughes Inc',437914000,0.0010),('BIIB','Biogen Inc',219051000,0.0032),('BK','The Bank of New York Mellon Corp',1077083000,0.0021),('BLK','BlackRock Inc',163367000,0.0030),('BLL','Ball Corp',173954035,0.0006),('BMY','Bristol-Myers Squibb',1669307000,0.0063),('BRK.B','Berkshire Hathaway B',2465586000,0.0180),('BSX','Boston Scientific Corp',1356867000,0.0016),('BWA','Borgwarner Inc',217620000,0.0003),('BXP','Boston Properties Inc',153611000,0.0011),('C','Citigroup Inc',2934929000,0.0065),('CA','CA Inc',416773000,0.0007),('CAG','ConAgra Foods Inc',436415000,0.0010),('CAH','Cardinal Health Inc',325815000,0.0013),('CAT','Caterpillar Inc',583869000,0.0024),('CB','Chubb Limited',464478000,0.0029),('CBG','CBRE Group Inc.',335436000,0.0004),('CBS','CBS Corp B',415313000,0.0010),('CCI','Crown Castle Intl Corp',336897000,0.0016),('CCL','Carnival Corp',562137000,0.0013),('CELG','Celgene Corp',774601000,0.0044),('CERN','Cerner Corp',338082000,0.0010),('CF','CF Industries Holdings',233094000,0.0002),('CFG','Citizens Financial Group Inc',528980000,0.0005),('CHD','Church & Dwight Co',128330000,0.0006),('CHK','Chesapeake Energy Corp',749793000,0.0002),('CHRW','CH Robinson Worldwide Inc',142767000,0.0005),('CI','Cigna Corporation',256513000,0.0016),('CINF','Cincinnati Financial Corp',164354000,0.0006),('CL','Colgate-Palmolive Co',893018000,0.0033),('CLX','Clorox Co',129340000,0.0008),('CMA','Comerica Inc (MI)',175134000,0.0004),('CMCSA','Comcast Corp A',2417751000,0.0082),('CME','CME Group Inc A',338640000,0.0017),('CMG','Chipotle Mexican Grill Inc.',29201000,0.0006),('CMI','Cummins Inc',170360000,0.0010),('CMS','CMS Energy Corp',279156000,0.0006),('CNC','Centene Corp',170470000,0.0006),('CNP','Centerpoint Energy Inc',430619000,0.0005),('COF','Capital One Financial',512099000,0.0017),('COG','Cabot Oil & Gas A',465000000,0.0005),('COH','Coach Inc',278030000,0.0006),('COL','Rockwell Collins',130194000,0.0005),('COP','ConocoPhillips',1238387000,0.0025),('COST','Costco Wholesale Corp',438066000,0.0037),('CPB','Campbell Soup Co',309147000,0.0009),('CRM','Salesforce.com',677500000,0.0028),('CSCO','Cisco Systems Inc',5029712000,0.0077),('CSRA','CSRA Inc',163301000,0.0002),('CSX','CSX Corporation',955867000,0.0013),('CTAS','Cintas Corp',107003000,0.0005),('CTL','CenturyLink Inc',546052000,0.0008),('CTSH','Cognizant Tech Solutions Corp',605870000,0.0017),('CTXS','Citrix Systems Inc',155102000,0.0006),('CVS','CVS Health Corporation',1074022000,0.0050),('CVX','Chevron Corp',1884702000,0.0097),('CXO','Concho Resources Inc',130349000,0.0008),('D','Dominion Resources Inc',616218000,0.0024),('DAL','Delta Air Lines',771592000,0.0015),('DD','E. I. du Pont de Nemours and Company',873512000,0.0030),('DE','Deere & Co',314259000,0.0012),('DFS','Discover Financial Services',412225000,0.0011),('DG','Dollar General Corp',283778000,0.0013),('DGX','Quest Diagnostics',141457000,0.0006),('DHI','Horton D.R. Inc',370925000,0.0006),('DHR','Danaher Corp',688695000,0.0028),('DIS','Walt Disney Co',1622441000,0.0078),('DISCA','Discovery Communications Inc A',150480000,0.0001),('DISCK','Discovery Communications Inc C',253992000,0.0003),('DLPH','Delphi Automotive PLC',272977000,0.0009),('DLR','Digital Realty Trust',146820000,0.0007),('DLTR','Dollar Tree Inc',235565000,0.0011),('DNB','Dun & Bradstreet Corp',36258000,0.0002),('DO','Diamond Offshore Drilling',137170000,0.0001),('DOV','Dover Corp',155149000,0.0005),('DOW','Dow Chemical',1122828000,0.0030),('DPS','Dr Pepper Snapple Group',185812000,0.0009),('DRI','Darden Restaurants Inc',126726000,0.0003),('DTE','DTE Energy Co',179435000,0.0008),('DUK','Duke Energy Corp',688904000,0.0029),('DVA','DaVita HealthCare Partners Inc',206500000,0.0008),('DVN','Devon Energy Corp',524000000,0.0010),('EA','Electronic Arts',301610000,0.0011),('EBAY','eBay Inc.',1148904000,0.0018),('ECL','Ecolab Inc',293305000,0.0017),('ED','Consolidated Edison Inc',304160000,0.0012),('EFX','Equifax Inc',119014000,0.0007),('EIX','Edison Intl',325811000,0.0012),('EL','Estee Lauder Cos. A',222580000,0.0010),('EMC','EMC Corp',1953197000,0.0027),('EMN','Eastman Chemical Co',148658000,0.0004),('EMR','Emerson Electric Co',643351000,0.0018),('ENDP','Endo International plc',222663000,0.0001),('EOG','EOG Resources',550277000,0.0022),('EQIX','Equinix Inc',69429000,0.0013),('EQR','Equity Residential',365502000,0.0012),('EQT','EQT Corporation',172737000,0.0006),('ES','Eversource Energy',317207000,0.0009),('ESRX','Express Scripts Holding Co.',632803000,0.0024),('ESS','Essex Property Trust',65430000,0.0007),('ETFC','E*TRADE Financial Corp',278729000,0.0003),('ETN','Eaton Corp plc',458000000,0.0014),('ETR','Entergy Corp',178741000,0.0007),('EW','Edwards Lifesciences Corp',211763000,0.0012),('EXC','Exelon Corp',921802000,0.0017),('EXPD','Expeditors Intl of WA Inc',182059000,0.0004),('EXPE','Expedia',136304000,0.0008),('EXR','Extra Space Storage Inc',125210000,0.0005),('F','Ford Motor Co',3901983000,0.0025),('FAST','Fastenal Co',288883000,0.0006),('FB','Facebook Inc A',2311865000,0.0145),('FBHS','Fortune Brands Home & Security Inc',153376000,0.0004),('FCX','Freeport-McMoRan Inc',1252140000,0.0008),('FDX','FedEx Corp',268424000,0.0022),('FE','FirstEnergy Corp',424712000,0.0007),('FFIV','F5 Networks Inc',66981000,0.0004),('FIS','Fidelity National Information',326450000,0.0013),('FISV','Fiserv Inc',222330000,0.0012),('FITB','Fifth Third Bancorp (OH)',767718000,0.0007),('FL','Foot Locker Inc',136094000,0.0004),('FLIR','FLIR Systems Inc',137632000,0.0002),('FLR','Fluor Corp',139230000,0.0003),('FLS','Flowserve Corp',130367000,0.0003),('FMC','FMC Corp',133752000,0.0003),('FOX','Twenty-First Century Fox Inc B',798521000,0.0010),('FOXA','Twenty-First Century Fox Inc A',1095726000,0.0014),('FRT','Federal Realty Invt Trust',70904000,0.0006),('FSLR','First Solar Inc',102245000,0.0002),('FTI','FMC Technologies Inc',226355000,0.0002),('FTR','Frontier Communications Corp',1173080000,0.0003),('FTV','Fortive Corp',344347500,0.0008),('GD','General Dynamics',305647000,0.0022),('GE','General Electric Co',9195657000,0.0144),('GGP','General Growth Properties Inc',883197000,0.0014),('GILD','Gilead Sciences Inc',1331822000,0.0053),('GIS','General Mills Inc',594402000,0.0021),('GLW','Corning Inc',1075349000,0.0012),('GM','General Motors Company',1539825000,0.0024),('GOOG','Alphabet Inc C',343440000,0.0133),('GOOGL','Alphabet Inc A',293675000,0.0117),('GPC','Genuine Parts Co',149623000,0.0007),('GPN','Global Payments Inc',153999000,0.0005),('GPS','Gap Inc',397964000,0.0005),('GRMN','Garmin Ltd',189193000,0.0005),('GS','Goldman Sachs Group Inc',415394000,0.0033),('GT','Goodyear Tire & Rubber Co',265944000,0.0003),('GWW','Grainger W.W. Inc',61322000,0.0006),('HAL','Halliburton Co',859265000,0.0018),('HAR','Harman Intl Industries Inc',70555000,0.0002),('HAS','Hasbro Inc',124702000,0.0005),('HBAN','Huntington Bancshares (OH)',798867000,0.0003),('HBI','Hanesbrands Inc',377517000,0.0005),('HCA','HCA Holdings Inc',391054000,0.0015),('HCN','Welltower Inc',356995000,0.0014),('HCP','HCP Inc',467088000,0.0009),('HD','Home Depot Inc',1244007000,0.0087),('HES','Hess Corp',313819000,0.0008),('HIG','Hartford Finl Services Group',393385000,0.0007),('HOG','Harley-Davidson Inc',181090000,0.0004),('HOLX','Hologic Inc',278830000,0.0005),('HON','Honeywell Intl Inc',762115000,0.0044),('HOT','Starwood Hotel & Resort World',168550000,0.0006),('HP','Helmerich & Payne Inc',108039000,0.0003),('HPE','Hewlett Packard Enterprise Co',1661715000,0.0017),('HPQ','HP Inc',1710607000,0.0012),('HRB','Block H & R Inc',224406000,0.0002),('HRL','Hormel Foods Corp',529860000,0.0010),('HRS','Harris Corp',124726000,0.0005),('HSIC','Schein Henry Inc',82066000,0.0007),('HST','Host Hotels & Resorts Inc',747315000,0.0006),('HSY','Hershey Foods Corp',152753000,0.0008),('HUM','Humana Inc',149037000,0.0013),('IBM','Intl Business Machines Corp',959962000,0.0078),('ICE','Intercontinental Exchange Inc',119046000,0.0015),('IFF','Intl Flavors & Fragrances',79714000,0.0005),('ILMN','Illumina Inc',147200000,0.0012),('INTC','Intel Corp',4722000000,0.0083),('INTU','Intuit Inc',255871000,0.0014),('IP','Intl Paper Co',411174000,0.0009),('IPG','Interpublic Group Cos',402405000,0.0004),('IR','Ingersoll-Rand Plc',257464000,0.0008),('IRM','Iron Mountain Inc',262652000,0.0005),('ISRG','Intuitive Surgical Inc',38060000,0.0013),('ITW','Illinois Tool Works Inc',359370000,0.0020),('IVZ','Invesco Ltd',417270000,0.0006),('JBHT','Hunt J.B. Transport Services',112654000,0.0004),('JCI','Johnson Controls Inc',648370000,0.0015),('JEC','Jacobs Engineering Group Inc',121925000,0.0003),('JNJ','Johnson & Johnson',2750644000,0.0174),('JNPR','Juniper Networks Inc',383945000,0.0004),('JPM','JP Morgan Chase & Co',3656659000,0.0118),('JWN','Nordstrom Inc',173435000,0.0003),('K','Kellogg Co',350048000,0.0014),('KEY','KeyCorp',842373000,0.0004),('KHC','The Kraft Heinz Company',1215955000,0.0053),('KIM','Kimco Realty Corp',419649000,0.0006),('KLAC','KLA-Tencor Corporation',155708000,0.0005),('KMB','Kimberly-Clark',360128000,0.0023),('KMI','Kinder Morgan Inc',2231556000,0.0022),('KMX','Carmax Inc',193829000,0.0005),('KO','Coca-Cola Co',4326199000,0.0095),('KORS','Michael Kors Holdings Ltd',176472000,0.0004),('KR','Kroger Co',953787000,0.0016),('KSS','Kohl\'s Corp',183709000,0.0003),('KSU','Kansas City Southern Inc',107988000,0.0005),('L','Loews Corp',339020000,0.0007),('LB','L Brands Inc',287502000,0.0010),('LEG','Leggett & Platt',134326000,0.0003),('LEN','Lennar Corp A',183406000,0.0004),('LH','Lab Corp of America Hldgs',102400000,0.0007),('LKQ','LKQ Corp',306679000,0.0005),('LLL','L-3 Communications Holdings',76953000,0.0005),('LLTC','Linear Technology Corp',239098000,0.0007),('LLY','Lilly Eli & Co',1103837000,0.0046),('LM','Legg Mason Inc',105402000,0.0001),('LMT','Lockheed Martin',304453000,0.0038),('LNC','Lincoln National Corp',239007000,0.0005),('LNT','Alliant Energy Corp',227125000,0.0004),('LOW','Lowe\'s Cos Inc',886105000,0.0036),('LRCX','Lam Research Corp',159600000,0.0007),('LUK','Leucadia National Corp (NY)',362330000,0.0003),('LUV','Southwest Airlines Co',638687000,0.0011),('LVLT','Level 3 Communications',357930000,0.0009),('LYB','LyondellBasell Industries N.V.',426727000,0.0016),('M','Macy\'s Inc',308395000,0.0005),('MA','Mastercard Inc A',1078666000,0.0052),('MAC','Macerich Co',148493000,0.0006),('MAR','Marriott Intl A',254232000,0.0009),('MAS','Masco Corp',332746000,0.0006),('MAT','Mattel Inc',340446000,0.0005),('MCD','McDonald\'s Corp',877858000,0.0052),('MCHP','Microchip Technology Inc',214820000,0.0006),('MCK','McKesson Corp',225021000,0.0022),('MCO','Moody\'s Corp',194300000,0.0010),('MDLZ','Mondelez International Inc',1552061000,0.0034),('MDT','Medtronic plc',1406156000,0.0062),('MET','Metlife Inc',1098667000,0.0023),('MHK','Mohawk Industries Inc',74091000,0.0007),('MJN','Mead Johnson Nutrition Co',186664000,0.0008),('MKC','McCormick & Co',115270000,0.0005),('MLM','Martin Marietta Materials',63527000,0.0006),('MMC','Marsh & McLennan Companies',521233000,0.0017),('MMM','3M Co',606515000,0.0054),('MNK','Mallinckrodt plc',109326000,0.0003),('MNST','Monster Beverage Corp New',190243000,0.0015),('MO','Altria Group Inc',1956425000,0.0067),('MON','Monsanto Co.',436845000,0.0023),('MOS','Mosaic Co',349816000,0.0004),('MPC','Marathon Petroleum Corp.',529835000,0.0010),('MRK','Merck & Co Inc',2768025000,0.0082),('MRO','Marathon Oil Corp',847650000,0.0005),('MS','Morgan Stanley',1937024000,0.0028),('MSFT','Microsoft Corp',7860467000,0.0225),('MSI','Motorola Solutions Inc',174600000,0.0006),('MTB','M&T Bank Corp',158999000,0.0009),('MU','Micron Technology Inc',1037040000,0.0007),('MUR','Murphy Oil Corp',172195000,0.0002),('MYL','Mylan NV',508368000,0.0012),('NAVI','Navient Corp',330514000,0.0002),('NBL','Noble Energy Inc',428571000,0.0007),('NDAQ','Nasdaq Inc',164515000,0.0005),('NEE','NextEra Energy Inc',461446000,0.0029),('NEM','Newmont Mining Corp',530530000,0.0011),('NFLX','NetFlix Inc',428300000,0.0019),('NFX','Newfield Exploration Co',196705000,0.0004),('NI','Nisource Inc',321544000,0.0004),('NKE','NIKE Inc B',1331470000,0.0037),('NLSN','Nielsen Holdings plc',360805000,0.0009),('NOC','Northrop Grumman Corp',180452000,0.0019),('NOV','National Oilwell Varco Inc',377061000,0.0006),('NRG','NRG Energy',314910000,0.0002),('NSC','Norfolk Southern Corp',295738000,0.0013),('NTAP','NetApp Inc',289083000,0.0003),('NTRS','Northern Trust Corp (IL)',228164000,0.0007),('NUE','Nucor Corp',317929000,0.0008),('NVDA','Nvidia Corp',534000000,0.0015),('NWL','Newell Brands Inc',456680000,0.0012),('NWS','News Corp B',199630000,0.0001),('NWSA','News Corp A',380573000,0.0002),('O','Realty Income Corp',257631000,0.0009),('OI','Owens-Illinois Inc',161919000,0.0001),('OKE','ONEOK Inc',210105000,0.0004),('OMC','Omnicom Group',237750000,0.0009),('ORCL','Oracle Corp',4149865000,0.0086),('ORLY','O\'Reilly Automotive',96456000,0.0014),('OXY','Occidental Petroleum',763741000,0.0028),('PAYX','Paychex Inc',360121000,0.0010),('PBCT','People\'s United Financial Inc',310861000,0.0002),('PBI','Pitney Bowes Inc',188620000,0.0001),('PCAR','PACCAR Inc',350463000,0.0010),('PCG','PG&E Corporation',496040000,0.0016),('PCLN','The Priceline Group Inc',49639000,0.0033),('PDCO','Patterson Cos Inc',99089000,0.0002),('PEG','Public Service Enterprise Grp',505929000,0.0011),('PEP','PepsiCo Inc',1444417000,0.0079),('PFE','Pfizer Inc',6064849000,0.0113),('PFG','Principal Financial Group',289853000,0.0006),('PG','Procter & Gamble',2661852000,0.0115),('PGR','Progressive Corp',583000000,0.0009),('PH','Parker-Hannifin Corp',134681000,0.0007),('PHM','Pulte Group Inc',346032000,0.0003),('PKI','PerkinElmer Inc',109030000,0.0003),('PLD','ProLogis Inc',525367000,0.0014),('PM','Philip Morris International',1551264000,0.0078),('PNC','PNC Finl Services Group',499324000,0.0020),('PNR','Pentair PLC',180716000,0.0005),('PNW','Pinnacle West Capital (AZ)',111140000,0.0004),('PPG','PPG Industries Inc',266063000,0.0014),('PPL','PPL Corp',676945000,0.0012),('PRGO','Perrigo Company plc',143223000,0.0006),('PRU','Prudential Financial Inc',442000000,0.0016),('PSA','Public Storage',173380000,0.0020),('PSX','Phillips 66',525581000,0.0020),('PVH','PVH Corp',81040000,0.0004),('PWR','Quanta Services Inc',151036000,0.0001),('PX','Praxair Inc',285265000,0.0016),('PXD','Pioneer Natural Resources',163557000,0.0013),('PYPL','PayPal Holdings Inc.',1212027000,0.0022),('QCOM','QUALCOMM Inc',1468915000,0.0046),('QRVO','Qorvo, Inc',127531000,0.0004),('R','Ryder System Inc',53703000,0.0001),('RAI','Reynolds American Inc',1427341000,0.0036),('RCL','Royal Caribbean Cruises Ltd',215241000,0.0007),('REGN','Regeneron Pharmaceuticals Inc',102628000,0.0022),('RF','Regions Financial Corp',1266713000,0.0005),('RHI','Robert Half Intl Inc',131319000,0.0002),('RHT','Red Hat Inc',181436000,0.0006),('RIG','Transocean Ltd',365202000,0.0002),('RL','Ralph Lauren Corp A',57021000,0.0002),('ROK','Rockwell Automation Inc',130260000,0.0007),('ROP','Roper Technologies, Inc',101201000,0.0008),('ROST','Ross Stores Inc',401804000,0.0012),('RRC','Range Resources Corp',169746000,0.0003),('RSG','Republic Services Inc',343900000,0.0008),('RTN','Raytheon Co',296980000,0.0020),('SBUX','Starbucks Corp',1464900000,0.0043),('SCG','SCANA Corp',142917000,0.0005),('SCHW','Schwab Charles Corp',1321691000,0.0019),('SE','Spectra Energy Corp',684210000,0.0012),('SEE','Sealed Air Corp',197140000,0.0004),('SHW','Sherwin-Williams Co',92495000,0.0014),('SIG','Signet Jewelers Ltd',78006000,0.0003),('SJM','Smucker J.M. Co',119680000,0.0009),('SLB','Schlumberger Ltd',1389519000,0.0056),('SLG','SL Green Realty Corp',100237000,0.0005),('SNA','Snap On Inc',58146000,0.0004),('SNI','Scripps Networks Interactive A',95025000,0.0003),('SO','Southern Co',938552000,0.0025),('SPG','Simon Property Group A',309409000,0.0035),('SPGI','S&P Global Inc',264600000,0.0016),('SPLS','Staples Inc',646290000,0.0003),('SRCL','Stericycle Inc',84913000,0.0003),('SRE','Sempra Energy',249498000,0.0014),('STI','SunTrust Banks Inc (GA)',501130000,0.0010),('STJ','St Jude Medical Inc',284277000,0.0011),('STT','State Street Corp',395940000,0.0013),('STX','Seagate Technology',298484000,0.0004),('STZ','Constellation Brands Inc A',176410000,0.0014),('SWK','Stanley Black & Decker',150117000,0.0009),('SWKS','Skyworks Solutions Inc',190238000,0.0006),('SWN','Southwestern Energy Co',473311000,0.0003),('SYF','Synchrony Financial',833920000,0.0011),('SYK','Stryker Corp',373981000,0.0022),('SYMC','Symantec Corp',612292000,0.0006),('SYY','Sysco Corp',563516000,0.0014),('T','AT&T Inc',6156000000,0.0134),('TAP','Molson Coors Brewing Co B',209234000,0.0010),('TDC','Teradata Corp',130000000,0.0001),('TDG','TransDigm Group',52979000,0.0007),('TEL','TE Connectivity Ltd.',357616000,0.0010),('TGNA','TEGNA Inc',217588000,0.0002),('TGT','Target Corp',589275000,0.0022),('TIF','Tiffany & Co',126018000,0.0004),('TJX','TJX Cos Inc',661083000,0.0027),('TMK','Torchmark Corp',120651000,0.0003),('TMO','Thermo Fisher Scientific',393512000,0.0031),('TRIP','TripAdvisor Inc. A',132906000,0.0004),('TROW','T Rowe Price Group Inc',248200000,0.0008),('TRV','Travelers Cos Inc',292395000,0.0017),('TSCO','Tractor Supply Co',133427000,0.0006),('TSN','Tyson Foods Inc A',300537000,0.0011),('TSO','Tesoro Corp',119980000,0.0004),('TSS','Total System Services Inc',183610000,0.0004),('TWX','Time Warner Inc',786394000,0.0030),('TXN','Texas Instruments Inc',1004227000,0.0035),('TXT','Textron Inc',268832000,0.0005),('TYC','Tyco Intl',425498000,0.0009),('UA','Under Armour Inc A',183141000,0.0003),('UA.C','Under Armour Inc-C',219136000,0.0003),('UAL','United Continental Holding Inc',335700000,0.0007),('UDR','UDR Inc',267137000,0.0005),('UHS','Universal Health Services B',89760000,0.0005),('ULTA','Ulta Salon Cosmetics & Fragr',62455000,0.0008),('UNH','Unitedhealth Group Inc',950804000,0.0068),('UNM','Unum Group',237760000,0.0004),('UNP','Union Pacific Corp',841034000,0.0039),('UPS','United Parcel Service Inc B',690451000,0.0037),('URBN','Urban Outfitters',117117000,0.0001),('URI','United Rentals Inc',88502000,0.0003),('USB','US Bancorp',1726403000,0.0036),('UTX','United Technologies Corp',836866000,0.0045),('V','Visa Inc A',1904791000,0.0075),('VAR','Varian Medical Systems Inc',95215000,0.0004),('VFC','VF Corp',417018000,0.0013),('VIAB','Viacom Inc B',346610000,0.0007),('VLO','Valero Energy Corp',469803000,0.0012),('VMC','Vulcan Materials Co',133188000,0.0008),('VNO','Vornado Realty Trust',188771000,0.0010),('VRSK','Verisk Analytics Inc',168166000,0.0007),('VRSN','VeriSign Inc',108476000,0.0004),('VRTX','Vertex Pharmaceuticals Inc',247350000,0.0012),('VTR','Ventas Inc',338132000,0.0013),('VZ','Verizon Communications Inc',4076288000,0.0114),('WAT','Waters Corp',80941000,0.0006),('WBA','Walgreens Boots Alliance Inc',1080246000,0.0043),('WDC','Western Digital Corp',281437000,0.0006),('WEC','WEC Energy Group Inc',315647000,0.0010),('WFC','Wells Fargo & Co',5077048000,0.0123),('WFM','Whole Foods Market Inc',321027000,0.0004),('WHR','Whirlpool Corp',75967000,0.0007),('WLTW','Willis Towers Watson PLC',138441000,0.0008),('WM','Waste Management Inc',444262000,0.0014),('WMB','The Williams Companies Inc',750570000,0.0009),('WMT','Wal-Mart Stores',3116647000,0.0115),('WRK','WestRock Co',252610000,0.0005),('WU','Western Union Co',491137000,0.0004),('WY','Weyerhaeuser Co',747074000,0.0012),('WYN','Wyndham Worldwide Corp',111952000,0.0004),('WYNN','Wynn Resorts Ltd',101790000,0.0005),('XEC','Cimarex Energy Co',94815000,0.0005),('XEL','Xcel Energy Inc',507953000,0.0011),('XL','XL Group Ltd',284670000,0.0004),('XLNX','Xilinx Inc',253728000,0.0006),('XOM','Exxon Mobil Corp',4146611000,0.0186),('XRAY','Dentsply Sirona Inc.',234231000,0.0007),('XRX','Xerox Corp',1013000000,0.0005),('XYL','Xylem Inc',178897000,0.0004),('YHOO','Yahoo Inc',949919000,0.0018),('YUM','Yum! Brands Inc',407441000,0.0018),('ZBH','Zimmer Biomet Holdings Inc',199239000,0.0013),('ZION','Zions Bancorp (UT)',204624000,0.0002),('ZTS','Zoetis Inc',496200000,0.0012);
/*!40000 ALTER TABLE `sp500` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usastock_dd`
--

DROP TABLE IF EXISTS `usastock_dd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usastock_dd` (
  `DDate` date NOT NULL,
  `StockID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL,
  `TShare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usastock_dd`
--

LOCK TABLES `usastock_dd` WRITE;
/*!40000 ALTER TABLE `usastock_dd` DISABLE KEYS */;
/*!40000 ALTER TABLE `usastock_dd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usastock_mm`
--

DROP TABLE IF EXISTS `usastock_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usastock_mm` (
  `DDate` date NOT NULL,
  `StockID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usastock_mm`
--

LOCK TABLES `usastock_mm` WRITE;
/*!40000 ALTER TABLE `usastock_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `usastock_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usastock_ww`
--

DROP TABLE IF EXISTS `usastock_ww`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usastock_ww` (
  `DDate` date NOT NULL,
  `StockID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usastock_ww`
--

LOCK TABLES `usastock_ww` WRITE;
/*!40000 ALTER TABLE `usastock_ww` DISABLE KEYS */;
/*!40000 ALTER TABLE `usastock_ww` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-20 18:13:36
