-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: peliculasDB
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero` (
  `ID_Genero` int NOT NULL,
  `Género` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
INSERT INTO `Genero` VALUES (1,'Ciencia Ficción'),(2,'Romance'),(3,'Acción'),(4,'Ciencia Ficción'),(5,'Ciencia Ficción'),(6,'Acción'),(7,'Crimen'),(8,'Crimen'),(9,'Ciencia Ficción'),(10,'Acción'),(11,'Aventura'),(12,'Animación'),(13,'Drama'),(14,'Acción'),(15,'Drama'),(16,'Drama'),(17,'Fantasía'),(18,'Fantasía'),(19,'Fantasía'),(20,'Ciencia Ficción'),(21,'Ciencia Ficción'),(22,'Ciencia Ficción'),(23,'Thriller'),(24,'Drama'),(25,'Drama'),(26,'Drama'),(27,'Bélica'),(28,'Crimen'),(29,'Drama'),(30,'Aventura'),(31,'Western'),(32,'Acción'),(33,'Thriller'),(34,'Drama'),(35,'Drama'),(36,'Drama'),(37,'Romance'),(38,'Comedia'),(39,'Ciencia Ficción'),(40,'Crimen'),(41,'Drama'),(42,'Drama'),(43,'Acción'),(44,'Ciencia Ficción'),(45,'Bélica'),(46,'Misterio'),(47,'Crimen'),(48,'Drama'),(49,'Drama'),(50,'Drama'),(51,'Western'),(52,'Acción'),(53,'Romance'),(54,'Acción'),(55,'Drama'),(56,'Drama'),(57,'Thriller'),(58,'Drama'),(59,'Bélica'),(60,'Terror'),(61,'Fantasía'),(62,'Ciencia Ficción'),(63,'Thriller'),(64,'Comedia'),(65,'Romance'),(66,'Misterio'),(67,'Misterio'),(68,'Misterio'),(69,'Terror'),(70,'Terror'),(71,'Terror'),(72,'Thriller'),(73,'Ciencia Ficción'),(74,'Ciencia Ficción'),(75,'Animación, Fantasía'),(76,'Acción, Crimen'),(77,'Acción, Crimen');
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Peliculas`
--

DROP TABLE IF EXISTS `Peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Peliculas` (
  `ID_Pelicula` int NOT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `Anio` year DEFAULT NULL,
  `Puntuacion` decimal(3,1) DEFAULT NULL,
  `Sinopsis` text,
  `ID_Clasificacion` int DEFAULT NULL,
  `ID_Genero` int DEFAULT NULL,
  PRIMARY KEY (`ID_Pelicula`),
  KEY `ID_Clasificacion` (`ID_Clasificacion`),
  KEY `ID_Genero` (`ID_Genero`),
  CONSTRAINT `Peliculas_ibfk_1` FOREIGN KEY (`ID_Clasificacion`) REFERENCES `clasificacion` (`ID_Clasificacion`),
  CONSTRAINT `Peliculas_ibfk_2` FOREIGN KEY (`ID_Genero`) REFERENCES `Genero` (`ID_Genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Peliculas`
--

LOCK TABLES `Peliculas` WRITE;
/*!40000 ALTER TABLE `Peliculas` DISABLE KEYS */;
INSERT INTO `Peliculas` VALUES (1,'El origen',2010,8.8,'Un ladrón especializado en extraer secretos del subconsciente se enfrenta a una misión compleja: implantar una idea en la mente de su objetivo.',1,1),(2,'Titanic',1997,7.8,'Una joven aristócrata y un artista pobre se enamoran a bordo del infame transatlántico Titanic antes de que se estrelle contra un iceberg.',2,2),(3,'Batman: El caballero de la noche',2008,9.0,'Batman enfrenta a su mayor adversario, el Joker, quien busca sumergir Gotham City en el caos.',3,3),(4,'Interestelar',2014,8.6,'Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.',4,4),(5,'Matrix',1999,8.7,'Un hacker descubre que la realidad en la que vive es una simulación creada por máquinas y se une a una resistencia para liberar a la humanidad.',5,5),(6,'Gladiador',2000,8.5,'Un general romano es traicionado y se convierte en gladiador, buscando venganza contra el emperador que destruyó su vida.',6,6),(7,'El padrino',1972,9.2,'La historia de la familia Corleone, su ascenso al poder en el crimen organizado y las luchas internas por el control del imperio familiar.',7,7),(8,'Tiempos violentos',1994,8.9,'Varios relatos interconectados sobre el crimen, la venganza y el destino se desarrollan en Los Ángeles.',8,8),(9,'Avatar',2009,7.9,'Un ex-marine es enviado a un planeta distante donde se convierte en un avatar para interactuar con los nativos, los Na\'vi, mientras una crisis ecológica se desata.',9,9),(10,'Los Vengadores',2012,8.0,'Los héroes más poderosos de la Tierra deben unirse para detener una invasión alienígena liderada por Loki.',10,10),(11,'Parque Jurásico',1993,8.2,'Un parque temático de dinosaurios se convierte en una pesadilla cuando los animales se liberan y comienzan a atacar a los humanos.',11,11),(12,'El rey león',1994,8.5,'Un joven león debe asumir su lugar como rey de la sabana africana después de la muerte de su padre, enfrentándose a su malvado tío Scar.',12,12),(13,'Forrest Gump',1994,8.8,'La vida de un hombre con un bajo coeficiente intelectual está entrelazada con eventos históricos, mientras él sigue su propio camino hacia el éxito.',13,13),(14,'Spider-Man: Sin camino a casa',2021,8.3,'Spider-Man debe enfrentarse a los villanos de otros universos tras un hechizo fallido que amenaza con destruir su realidad.',14,14),(15,'Guasón',2019,8.4,'El origen del villano Joker se relata en esta historia de un hombre desplazado por la sociedad que cae en la locura y se convierte en un símbolo del caos.',15,15),(16,'Sueño de fuga',1994,9.3,'Un hombre condenado a cadena perpetua por un crimen que no cometió encuentra amistad y esperanza mientras planea su fuga de prisión.',16,16),(17,'El señor de los anillos: La comunidad del anillo',2001,8.8,'Un grupo de héroes se embarca en una misión peligrosa para destruir un anillo que tiene el poder de destruir el mundo.',17,17),(18,'El señor de los anillos: Las dos torres',2002,8.7,'La lucha contra las fuerzas de Sauron continúa mientras la Comunidad del Anillo se enfrenta a nuevas amenazas y alianzas.',18,18),(19,'El señor de los anillos: El retorno del rey',2003,9.0,'El destino de la Tierra Media se decide en una batalla final mientras el anillo se acerca a su destrucción.',19,19),(20,'La guerra de las galaxias: Una nueva esperanza',1977,8.6,'Un joven granjero se une a una rebelión para derrotar al malvado Imperio Galáctico y salvar a la princesa Leia.',20,20),(21,'La guerra de las galaxias: El imperio contraataca',1980,8.7,'Los rebeldes luchan por su supervivencia mientras Darth Vader persigue a Luke Skywalker y sus amigos en una guerra épica.',21,21),(22,'La guerra de las galaxias: El regreso del Jedi',1983,8.3,'Luke Skywalker regresa para enfrentar a Darth Vader y el Emperador Palpatine en una batalla decisiva por el destino de la galaxia.',22,22),(23,'El silencio de los inocentes',1991,8.6,'Un agente del FBI se enfrenta a un asesino en serie mientras busca la ayuda de otro asesino encarcelado para atraparlo.',23,23),(24,'La lista de Schindler',1993,9.0,'Basada en hechos reales, la historia de Oskar Schindler, un empresario que salvó a más de mil judíos del Holocausto.',24,24),(25,'El club de la pelea',1999,8.8,'Un hombre insomne forma un club secreto de lucha, lo que lo lleva a una peligrosa espiral de caos y autodestrucción.',25,25),(26,'Milagros inesperados',1999,8.6,'Un prisionero en el corredor de la muerte forma un vínculo especial con un guardia y cambia la vida de aquellos que lo rodean.',26,26),(27,'Rescatando al soldado Ryan',1998,8.6,'Un grupo de soldados se embarca en una misión para salvar a un paracaidista cuya madre ha perdido a tres hijos en la guerra.',27,27),(28,'Los infiltrados',2006,8.5,'Un policía encubierto se infiltra en una banda criminal, mientras que un miembro de la banda se infiltra en la policía.',28,28),(29,'Latigazo',2014,8.5,'Un joven baterista lucha por cumplir con las expectativas de un maestro despiadado que lleva a los estudiantes a límites extremos.',29,29),(30,'The Revenant',2015,8.0,'Un cazador de pieles es abandonado tras ser atacado por un oso y debe sobrevivir en la naturaleza para vengarse de aquellos que lo dejaron atrás.',30,30),(31,'Django Unchained',2012,8.4,'Un esclavo liberado se asocia con un cazador de recompensas para rescatar a su esposa de un terrateniente brutal.',31,31),(32,'Mad Max: Fury Road',2015,8.1,'En un futuro post-apocalíptico, Max se une a una guerrera para escapar de un tirano en una persecución salvaje por el desierto.',32,32),(33,'Parasite',2019,8.6,'Una familia pobre se infiltra en la vida de una familia rica, lo que desencadena una serie de eventos inesperados.',33,33),(34,'A Beautiful Mind',2001,8.2,'La historia de un genio matemático que lucha contra la esquizofrenia mientras realiza descubrimientos clave en su campo.',34,34),(35,'The Prestige',2006,8.5,'Dos magos rivales luchan por superar al otro con trucos cada vez más sorprendentes, hasta que sus obsesiones los llevan a límites peligrosos.',35,35),(36,'The Wolf of Wall Street',2013,8.2,'Un joven corredor de bolsa asciende en Wall Street, pero sus prácticas corruptas y su estilo de vida decadente lo llevan a su caída.',36,36),(37,'La La Land',2016,8.0,'Una aspirante a actriz y un pianista de jazz luchan por equilibrar su carrera y su relación romántica en Los Ángeles.',37,37),(38,'The Grand Budapest Hotel',2014,8.1,'Las aventuras del conserje de un hotel de lujo en Europa y su relación con un joven empleado que lo involucra en un robo de arte.',38,38),(39,'Gravity',2013,7.7,'Dos astronautas luchan por sobrevivir en el espacio tras la destrucción de su estación espacial.',39,39),(40,'No Country for Old Men',2007,8.1,'Un hombre encuentra una gran suma de dinero en el desierto, lo que desencadena una violenta persecución entre él, un asesino y un sheriff.',40,40),(41,'The Social Network',2010,7.8,'La historia de la creación de Facebook y las controversias legales que rodean a su fundador, Mark Zuckerberg.',41,41),(42,'The Big Short',2015,7.8,'Un grupo de inversores predice la crisis financiera de 2008 y se aprovecha de la caída del mercado hipotecario.',42,42),(43,'Logan',2017,8.1,'El envejecido Logan cuida a un enfermo profesor X mientras protege a una joven mutante de fuerzas oscuras.',43,43),(44,'Blade Runner 2049',2017,8.0,'En un futuro distópico, un nuevo Blade Runner busca respuestas a secretos enterrados en su sociedad controlada por inteligencia artificial.',44,44),(45,'1917',2019,8.2,'Durante la Primera Guerra Mundial, dos soldados británicos deben entregar un mensaje crucial para salvar a 1,600 compañeros de la muerte.',45,45),(46,'Knives Out',2019,7.9,'Un detective investiga la muerte de un novelista de misterio, descubriendo secretos familiares y un crimen mucho más complejo de lo que parece.',46,46),(47,'The Irishman',2019,7.9,'Un veterano de la mafia mira hacia atrás a su vida, mientras reflexiona sobre la desaparición del sindicalista Jimmy Hoffa.',47,47),(48,'Once Upon a Time in Hollywood',2019,7.7,'En 1969, un actor y su doble de cine enfrentan los cambios en Hollywood y la llegada de una tragedia con la secta de Charles Manson.',48,48),(49,'The Truman Show',1998,8.1,'Un hombre vive toda su vida sin saber que está siendo grabado y transmitido en un programa de televisión, hasta que descubre la verdad.',49,49),(50,'Catch Me If You Can',2002,8.1,'Un joven estafador escapa de la policía y el FBI mientras se disfraza como piloto, doctor y abogado.',50,50),(51,'The Hateful Eight',2015,7.8,'Ocho extraños se encuentran atrapados en una cabaña durante una tormenta de nieve, mientras secretos oscuros salen a la luz.',51,51),(52,'The Bourne Identity',2002,7.9,'Un hombre amnésico se embarca en una peligrosa misión mientras intenta descubrir su identidad y los motivos detrás de su persecución.',52,52),(53,'The Notebook',2004,7.8,'Una historia de amor que narra cómo una joven pareja lucha por mantener su relación a pesar de los obstáculos impuestos por sus diferencias sociales.',53,53),(54,'The Equalizer',2014,7.2,'Un hombre con habilidades de combate se convierte en un vigilante cuando una joven es amenazada por la mafia rusa.',54,54),(55,'A Star Is Born',2018,7.6,'Un músico veterano ayuda a una joven cantante a alcanzar la fama mientras enfrenta sus propios demonios personales y profesionales.',55,55),(56,'Slumdog Millionaire',2008,8.0,'Un joven indio compite en un popular concurso de televisión, mientras recuerda su vida y las experiencias que lo llevaron hasta allí.',56,56),(57,'Black Swan',2010,8.0,'Una bailarina de ballet lucha por equilibrar su vida y su obsesión con el papel protagonista en \"El lago de los cisnes\"\".\"',57,57),(58,'The Pursuit of Happyness',2006,8.0,'Un hombre lucha por mantener a su hijo mientras enfrenta una vida de pobreza y un trabajo precario en su búsqueda por convertirse en corredor de bolsa.',58,58),(59,'Corazón valiente',1995,8.3,'La historia de William Wallace, un héroe escocés que lidera una rebelión contra el dominio inglés en el siglo XIII.',59,59),(60,'Los otros',2001,7.6,'Una madre que vive con sus dos hijos en una casa aislada empieza a descubrir que la casa está plagada de presencias extrañas.',60,60),(61,'El gran pez',2003,8.0,'Un hombre mayor relata las fantásticas historias de su vida a su hijo, que no sabe si creer en ellas.',61,61),(62,'El planeta de los simios',1968,8.0,'Un astronauta llega a un planeta gobernado por simios inteligentes que esclavizan a los humanos.',62,62),(63,'La chica del dragón tatuado',2011,7.8,'Una periodista y una hacker investigan la desaparición de una joven hace décadas mientras descubren secretos oscuros.',63,63),(64,'El diablo viste a la moda',2006,6.9,'Una joven obtiene un trabajo en una revista de moda y debe lidiar con su exigente jefa mientras lucha por mantener su vida personal.',64,64),(65,'500 días con ella',2009,7.7,'La historia de una relación que empieza y termina contada desde diferentes perspectivas, centrándose en la experiencia del protagonista masculino.',65,65),(66,'El código Da Vinci',2006,6.6,'Un profesor de simbología se ve envuelto en una conspiración que lo lleva a descubrir secretos históricos mientras es perseguido por un asesino.',66,66),(67,'Ángeles y demonios',2009,6.7,'Un experto en simbología investiga una serie de asesinatos relacionados con los Illuminati y el Vaticano.',67,67),(68,'Inferno',2016,6.2,'Un experto en simbología sufre de amnesia y se une a una doctora para detener una amenaza relacionada con una plaga mortal.',68,68),(69,'El conjuro',2013,7.5,'Basado en hechos reales, un par de investigadores paranormales ayudan a una familia aterrorizada por una entidad maligna en su casa.',69,69),(70,'Annabelle',2014,5.4,'Una muñeca poseída por un espíritu demoníaco aterroriza a una joven pareja y su hija recién nacida.',70,70),(71,'IT (Eso)',2017,7.3,'Un grupo de niños en una pequeña ciudad se enfrenta a un ser maligno que toma la forma de un payaso.',71,71),(72,'Fragmentado',2016,7.3,'Un hombre con múltiples personalidades rapta a tres jóvenes y deben luchar por sobrevivir mientras descubren la verdad detrás de su secuestrador.',72,72),(73,'Glass',2019,6.6,'En este thriller de superhéroes, tres individuos con habilidades extraordinarias se enfrentan en una confrontación de proporciones épicas.',73,73),(74,'Señales',2002,6.8,'Un ex sacerdote y su familia descubren señales misteriosas en los cultivos que podrían ser el preludio de una invasión alienígena.',74,74),(75,'Coraline y la puerta secreta',2009,7.7,'Una niña encuentra una puerta secreta que la lleva a un mundo paralelo, donde debe salvar a sus padres y su vida en el proceso.',75,75),(76,'John Wick: Otro día para matar',2014,7.4,'Un ex asesino profesional se ve forzado a volver a la acción cuando una deuda del pasado lo obliga a asesinar a su antiguo amigo.',76,76),(77,'John Wick: Pacto de sangre',2017,7.5,'John Wick debe luchar para sobrevivir después de romper una de las reglas sagradas de la sociedad de asesinos.',77,77);
/*!40000 ALTER TABLE `Peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tabla_Pelicula_Actor`
--

DROP TABLE IF EXISTS `Tabla_Pelicula_Actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tabla_Pelicula_Actor` (
  `ID_Pelicula` int DEFAULT NULL,
  `ID_Actor` int DEFAULT NULL,
  KEY `fk_actor` (`ID_Actor`),
  CONSTRAINT `fk_actor` FOREIGN KEY (`ID_Actor`) REFERENCES `actores` (`ID_Actor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tabla_Pelicula_Actor`
--

LOCK TABLES `Tabla_Pelicula_Actor` WRITE;
/*!40000 ALTER TABLE `Tabla_Pelicula_Actor` DISABLE KEYS */;
INSERT INTO `Tabla_Pelicula_Actor` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77);
/*!40000 ALTER TABLE `Tabla_Pelicula_Actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores` (
  `ID_Actor` int NOT NULL,
  `Actor_Protagonista` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
INSERT INTO `actores` VALUES (1,'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page'),(2,'Leonardo DiCaprio, Kate Winslet'),(3,'Christian Bale, Heath Ledger, Aaron Eckhart'),(4,'Matthew McConaughey, Anne Hathaway, Jessica Chastain'),(5,'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss'),(6,'Russell Crowe, Joaquin Phoenix, Connie Nielsen'),(7,'Marlon Brando, Al Pacino, James Caan'),(8,'John Travolta, Uma Thurman, Samuel L. Jackson'),(9,'Sam Worthington, Zoe Saldana, Sigourney Weaver'),(10,'Robert Downey Jr., Chris Hemsworth, Scarlett Johansson'),(11,'Sam Neill, Laura Dern, Jeff Goldblum'),(12,'Matthew Broderick, James Earl Jones, Jeremy Irons'),(13,'Tom Hanks, Robin Wright, Gary Sinise'),(14,'Tom Holland, Zendaya, Benedict Cumberbatch'),(15,'Joaquin Phoenix, Robert De Niro, Zazie Beetz'),(16,'Tim Robbins, Morgan Freeman, Bob Gunton'),(17,'Elijah Wood, Ian McKellen, Viggo Mortensen'),(18,'Elijah Wood, Ian McKellen, Viggo Mortensen'),(19,'Elijah Wood, Ian McKellen, Viggo Mortensen'),(20,'Mark Hamill, Harrison Ford, Carrie Fisher'),(21,'Mark Hamill, Harrison Ford, Carrie Fisher'),(22,'Mark Hamill, Harrison Ford, Carrie Fisher'),(23,'Jodie Foster, Anthony Hopkins, Scott Glenn'),(24,'Liam Neeson, Ben Kingsley, Ralph Fiennes'),(25,'Edward Norton, Brad Pitt, Helena Bonham Carter'),(26,'Tom Hanks, Michael Clarke Duncan, David Morse'),(27,'Tom Hanks, Matt Damon, Tom Sizemore'),(28,'Leonardo DiCaprio, Matt Damon, Jack Nicholson'),(29,'Miles Teller, J.K. Simmons, Melissa Benoist'),(30,'Leonardo DiCaprio, Tom Hardy, Domhnall Gleeson'),(31,'Jamie Foxx, Christoph Waltz, Leonardo DiCaprio'),(32,'Tom Hardy, Charlize Theron, Nicholas Hoult'),(33,'Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong'),(34,'Russell Crowe, Jennifer Connelly, Ed Harris'),(35,'Hugh Jackman, Christian Bale, Scarlett Johansson'),(36,'Leonardo DiCaprio, Jonah Hill, Matthew McConaughey'),(37,'Ryan Gosling, Emma Stone'),(38,'Ralph Fiennes, F. Murray Abraham, Tilda Swinton'),(39,'Sandra Bullock, George Clooney'),(40,'Javier Bardem, Tommy Lee Jones, Woody Harrelson'),(41,'Jesse Eisenberg, Andrew Garfield, Justin Timberlake'),(42,'Christian Bale, Steve Carell, Ryan Gosling'),(43,'Hugh Jackman, Patrick Stewart, Richard E. Grant'),(44,'Ryan Gosling, Harrison Ford, Jared Leto'),(45,'George MacKay, Dean-Charles Chapman, Mark Strong'),(46,'Daniel Craig, Chris Evans, Ana de Armas'),(47,'Robert De Niro, Al Pacino, Joe Pesci'),(48,'Leonardo DiCaprio, Brad Pitt, Margot Robbie'),(49,'Jim Carrey, Laura Linney, Ed Harris'),(50,'Leonardo DiCaprio, Tom Hanks, Christopher Walken'),(51,'Samuel L. Jackson, Kurt Russell, Jennifer Jason Leigh'),(52,'Matt Damon, Franka Potente, Clive Owen'),(53,'Ryan Gosling, Rachel McAdams, James Marsden'),(54,'Denzel Washington, Chloe Grace Moretz, Marton Csokas'),(55,'Bradley Cooper, Lady Gaga, Sam Elliott'),(56,'Dev Patel, Freida Pinto, Anil Kapoor'),(57,'Natalie Portman, Mila Kunis, Winona Ryder'),(58,'Will Smith, Jaden Smith, Thandie Newton'),(59,'Mel Gibson, Sophie Marceau, Brendan Gleeson'),(60,'Nicole Kidman, Fionnula Flanagan, Alakina Mann'),(61,'Ewan McGregor, Albert Finney, Billy Crudup'),(62,'Charlton Heston, Roddy McDowall, Kim Hunter'),(63,'Rooney Mara, Daniel Craig, Christopher Plummer'),(64,'Anne Hathaway, Meryl Streep, Emily Blunt'),(65,'Joseph Gordon-Levitt, Zooey Deschanel, Geoffrey Arend'),(66,'Tom Hanks, Audrey Tautou, Jean Reno'),(67,'Tom Hanks, Ewan McGregor, Ayelet Zurer'),(68,'Tom Hanks, Felicity Jones, Irrfan Khan'),(69,'Vera Farmiga, Patrick Wilson, Lili Taylor'),(70,'Annabelle Wallis, Ward Horton, Alfre Woodard'),(71,'Bill Skarsgård, Jaeden Lieberher, Finn Wolfhard'),(72,'James McAvoy, Anya Taylor-Joy, Betty Buckley'),(73,'James McAvoy, Bruce Willis, Samuel L. Jackson'),(74,'Mel Gibson, Joaquin Phoenix, Rory Culkin'),(75,'Dakota Fanning, Teri Hatcher, Jennifer Saunders'),(76,'Keanu Reeves, Willem Dafoe, Michael Nyqvist'),(77,'Keanu Reeves, Laurence Fishburne, Ruby Rose');
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clasificacion` (
  `ID_Clasificacion` int NOT NULL,
  `Clasificacion` int NOT NULL,
  PRIMARY KEY (`ID_Clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificacion`
--

LOCK TABLES `clasificacion` WRITE;
/*!40000 ALTER TABLE `clasificacion` DISABLE KEYS */;
INSERT INTO `clasificacion` VALUES (1,13),(2,13),(3,13),(4,13),(5,18),(6,18),(7,18),(8,18),(9,13),(10,13),(11,13),(12,0),(13,13),(14,13),(15,18),(16,18),(17,13),(18,13),(19,13),(20,13),(21,13),(22,13),(23,18),(24,18),(25,18),(26,18),(27,18),(28,18),(29,18),(30,18),(31,18),(32,18),(33,18),(34,13),(35,13),(36,18),(37,13),(38,13),(39,13),(40,18),(41,13),(42,13),(43,18),(44,18),(45,18),(46,13),(47,18),(48,18),(49,13),(50,13),(51,18),(52,13),(53,13),(54,18),(55,13),(56,13),(57,18),(58,13),(59,18),(60,13),(61,13),(62,13),(63,18),(64,13),(65,13),(66,13),(67,13),(68,13),(69,13),(70,13),(71,18),(72,13),(73,13),(74,13),(75,13),(76,18),(77,18);
/*!40000 ALTER TABLE `clasificacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-22 23:04:40
