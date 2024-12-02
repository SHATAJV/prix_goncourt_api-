-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 02 déc. 2024 à 13:46
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `prix_goncourt`
--

-- --------------------------------------------------------

--
-- Structure de la table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id_author` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `biography` text,
  PRIMARY KEY (`id_author`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `authors`
--

INSERT INTO `authors` (`id_author`, `name`, `biography`) VALUES
(1, 'Gaël Faye', 'Auteur compositeur interprète, Gaël Faye est l’auteur du premier roman phénomène Petit pays (Grasset 2016, prix Goncourt des lycéens) ainsi que de plusieurs albums, de Pili pili sur un croissant au beurre (2013), à Mauve Jacaranda (2022). Il était la Révélation scène de l’année des Victoires de la musique 2018.'),
(2, 'Olivier Norek', 'Olivier Norek est l\'auteur des romans policiers Code 93, Territoires, Surtensions, Surface, Dans les brumes de Capelans, qui ont reçu de nombreux prix littéraires et ont été traduits dans le monde entier.\r\nSon passé de logisticien humanitaire (Guyane, ex-Yougoslavie...) et sa volonté d\'engagement le conduisent aussi à explorer des sujets de société majeurs tels que la crise migratoire et écologique à travers les romans Entre deux mondes et Impact.\r\nAvec Les Guerriers de l\'Hiver, il nous raconte l\'épopée héroïque de ces soldats oubliés de l\'Histoire, dont le sacrifice résonne avec notre actualité.'),
(3, 'Kamel Daoud', 'Kamel Daoud, écrivain et journaliste, est notamment l\'auteur de Meursault, contre-enquête (2014, Goncourt du premier roman).'),
(4, 'Philippe Jaenada', 'Philippe Jaenada (born 1964 in Saint-Germain-en-Laye) is a French writer. The author of over a dozen books, he won the Prix Femina for his 2017 novel La Serpe.[1]'),
(5, 'Jean-Noël Orengo', 'Jean-Noël Orengo est chroniqueur de films pour le magazine Transfuge. Il est l\'auteur d\'un essai sur l\'art, Vivre en peinture, paru aux éditions Les Cahiers dessinés en 2023. Tous ses romans sont publiés aux éditions Grasset.'),
(16, 'Thomas Clerc\r\n', 'Thomas Clerc vit rue Erlanger (16e arrondissement de Paris) entre 1965 et 19801.\r\n\r\nIl est agrégé de lettres modernes, docteur en lettres et maître de conférences en littérature contemporaine à l\'université Paris-Nanterre2.\r\n\r\nThomas Clerc développe une écriture introspective, notamment dans son roman Intérieur dont le décor unique est son propre appartement à Paris3.\r\n\r\nIl est mis en cause sur les réseaux sociaux en décembre 2015, à propos d\'un texte4 considéré par certains internautes comme méprisant envers les consommateurs de Starbucks, jugés moins intelligents que la moyenne. Le billet, intitulé « Attentats : que Starbucks paie l\'addition », fait un rapprochement entre l\'entreprise américaine et la lutte contre le terrorisme, un mois après les attentats du 13 novembre 2015 en France5.'),
(6, 'Maylis de Kerangal', 'Maylis de Kerangal est l\'autrice de sept fictions aux Éditions Verticales, dont Corniche Kennedy (2008), Naissance d\'un pont (2010, prix Médicis, prix Franz-Hessel), Réparer les vivants (2014, dix prix Littéraires), Un monde à portée de main (2018) et Canoës, ainsi que de trois récits dans la collection « Minimales » : Ni fleurs ni couronnes (2006), Tangente vers l\'est (2012, prix Landerneau) et À ce stade de la nuit (2015).'),
(7, 'Sandrine Collette', 'Sandrine Collette vit dans le Morvan. Elle est notamment l\'auteure de Et toujours les Forêts, Grand prix RTL Lire, prix du Livre France Bleu - PAGE des libraires, prix de La Closerie des Lilas, ainsi que de On était des loups, prix Renaudot des Lycéens et prix Giono 2022.'),
(8, 'Carole Martinez', 'Carole Martinez, née en 1966, est romancière et professeure de français. Son premier roman, \"Le cœur cousu\", a été récompensé par quinze prix littéraires, dont le prix Renaudot des lycéens en 2007. Son deuxième roman, \"Du domaine des murmures\", a lui aussi été acclamé par la critique. Publié en 2011, il a notamment reçu le prix Goncourt des lycéens. En 2016, Carole Martinez a publié \"La Terre qui penche\", qui témoigne a nouveau de son immense talent, de cet univers si singulier, entre magie et songe, sensualité et violence, petite et grande Histoire.'),
(9, 'Rebecca Lighieri', 'Born in 1966 in Marseille as Emmanuelle Garino, she lives in Villejuif, near Paris. She writes under the surname of her first husband, with whom she has two daughters.[2]\r\n\r\nSince 2013, she has also published noir novels under the pseudonym Rebecca Lighieri.[3]\r\n\r\nIn 2018, she published the novel Arcadia (French: Arcadie), which received the 2019 Prix du Livre Inter. It was shortlisted for the Prix Femina, Prix Médicis and Prix de Flore. It was also longlisted for the Prix France-Culture and Prix Wepler.\r\n\r\nIn 2021, she co-wrote the screenplay of Émilie Aussel\'s first feature film L\'Été l\'éternité (Our Eternal Summer),[4] which had its world premiere at the 74th Locarno Film Festival.[5]\r\n\r\nIn 2022, she was awarded the Prix Médicis for her novel La Treizième Heure.'),
(10, 'Abdellah Taïa', 'Abdellah Taïa est né à Rabat (Maroc) en 1973. Il a publié aux Éditions du Seuil plusieurs romans, traduits dans de nombreuses langues, notamment Une mélancolie arabe, Le Jour du roi (Prix de Flore 2010) et Vivre à ta lumière. Le Bastion des Larmes est son premier livre aux Éditions Julliard.'),
(11, 'Thibault de Montaigu', 'Thibault de Montaigu a publié sept romans et essais, dont Un jeune homme triste, Les anges brûlent, Les Grands Gestes la nuit, Zanzibar et, en 2020, La Grâce, qui a reçu le prix de Flore.'),
(12, 'Emmanuelle Lambert', 'Emmanuelle Lambert est l\'autrice de romans et d\'essais, parmi lesquels Giono, furioso (Stock, 2019 ; prix Femina essai), Le Garçon de mon père (Stock, 2021) et Sidonie Gabrielle Colette (Gallimard, 2022).'),
(13, 'Etienne Kern', 'Étienne Kern vit et enseigne à Lyon. Il est l\'auteur aux Éditions Gallimard d\'un roman, Les envolés, couronné en 2022 du Goncourt du premier roman et traduit dans plusieurs langues.'),
(14, 'Hélène Gaudy', 'Née en 1979 à Paris, Hélène Gaudy a étudié à l\'École supérieure des arts décoratifs de Strasbourg. Autrice de plusieurs romans, elle a également publié des ouvrages pour la jeunesse et des livres d\'art.'),
(15, 'Ruben Barrouk', 'Ruben Barrouk est né en 1997 à Paris. En 2022, il retourne sur les traces de sa famille séfarade à Marrakech, où vit sa grand-mère, personnage principal de ce premier roman.');

-- --------------------------------------------------------

--
-- Structure de la table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `summary` text,
  `main_character` varchar(255) DEFAULT NULL,
  `id_author` int DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  PRIMARY KEY (`id_book`),
  UNIQUE KEY `slug` (`slug`),
  KEY `id_author` (`id_author`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`id_book`, `title`, `summary`, `main_character`, `id_author`, `editor`, `publication_date`, `pages`, `isbn`, `price`, `slug`) VALUES
(1, 'Jacaranda', 'Quels secrets cache l’ombre du jacaranda, l’arbre fétiche de Stella  ? Il faudra à son ami Milan des années pour le découvrir. Des années pour percer les silences du Rwanda, dévasté après le génocide des Tutsi. En rendant leur parole aux disparus, les jeunes gens échapperont à la solitude. Et trouveront la paix près des rivages magnifiques du lac Kivu.\r\nSur quatre générations, avec sa douceur unique, Gaël Faye nous raconte l’histoire terrible d’un pays qui s’essaie malgré tout au dialogue et au pardon. Comme un arbre se dresse entre ténèbres et lumière, Jacaranda célèbre l’humanité, paradoxale, aimante, vivante.', 'Stella', 1, 'Grasset', '2024-08-14', 281, '9782246831457', 20.90, 'jacaranda'),
(2, 'Les guerriers de l\'hiver', '\" Je suis certain que nous avons réveillé leur satané Sisu.\r\n– Je ne parle pas leur langue, camarade.\r\n– Et je ne pourrais te traduire ce mot, car il n\'a d\'équivalent nulle part ailleurs. Le Sisu est l\'âme de la Finlande. Il dit le courage, la force intérieure, la ténacité, la résistance, la détermination... Une vie austère, dans un environnement hostile, a forgé leur mental d\'un acier qui nous résiste aujourd\'hui. \"\r\n', 'Le Sisu', 2, 'M. Lafon', '2024-08-29', 446, '9782749947204', 21.95, 'les-guerriers-de-l\'hiver'),
(3, 'Houris', '« Je suis la véritable trace, le plus solide des indices attestant de tout ce que nous avons vécu en dix ans en Algérie. Je cache l\'histoire d\'une guerre entière, inscrite sur ma peau depuis que je suis enfant. »\r\n\r\nAube est une jeune Algérienne qui doit se souvenir de la guerre d\'indépendance, qu\'elle n\'a pas vécue, et oublier la guerre civile des années 1990, qu\'elle a elle-même traversée. Sa tragédie est marquée sur son corps : une cicatrice au cou et des cordes vocales détruites. Muette, elle rêve de retrouver sa voix.\r\n\r\nSon histoire, elle ne peut la raconter qu\'à la fille qu\'elle porte dans son ventre. Mais a-t-elle le droit de garder cette enfant ? Peut-on donner la vie quand on vous l\'a presque arrachée ? Dans un pays qui a voté des lois pour punir quiconque évoque la guerre civile, Aube décide de se rendre dans son village natal, où tout a débuté, et où les morts lui répondront peut-être.\r\n\r\n\r\n', 'Aube', 3, 'Gallimard', '2024-08-15', 411, '9782072999994', 23.00, 'houris'),
(4, 'La désinvolture est une bien belle chose', 'Pourquoi, un matin d\'automne, une si jolie jeune femme, intelligente et libre, entourée d\'amis, admirée, une fille que la vie semblait amuser, amoureuse d\'un beau soldat américain qui l\'aimait aussi, s\'est-elle jetée à l\'aube par la fenêtre d\'une chambre d\'hôtel, à vingt ans ? J\'aimerais savoir, comprendre', 'une si jolie jeune femme', 4, 'Mialet-Barrault', '2024-08-21', 486, '9782080427298', 22.00, 'la-désinvolture-est-une-bien-belle-chose'),
(5, 'Vous êtes l\'amour malheureux du Führer ', '1969 : Albert Speer, architecte favori et ministre de l\'Armement d\'Hitler, publie ses Mémoires. Revisitant son passé, de ses mises en scène des congrès nazis à la chute du Reich, il parachève l\'ultime métamorphose qui a sauvé sa tête au procès de Nuremberg et va faire de lui la star de la culpabilité allemande. Affirmant n\'avoir rien su de la Solution finale, il se déclare « responsable, mais pas coupable ». Les historiens auront beau démontrer qu\'il a menti, sa version de lui-même s\'imposera toujours.\r\n\r\nComment écrire sur un homme qui a rendu la fiction plus séduisante que la vérité ?À l\'heure des fake news et de la guerre des récits, voici le roman d\'un des plus grands mensonges de l\'Histoire. Traquant les scènes de la vie de Speer, s\'interrogeant sur leur vraisemblance, éclairant certains aspects, allant là où il s\'arrête en convoquant les acteurs capitaux d\'après-guerre, notamment l\'historienne Gitta Sereny, l\'auteur propose une lecture vertigineuse de celui à qui l\'un de ses collaborateurs affirmait : « Savez-vous ce que vous êtes ? Vous êtes l\'amour malheureux du Führer. »', 'Albert Speer', 5, '	\r\nGrasset', '2024-08-28', 263, '9782246831372', 20.00, 'vous-êtes-l\'amour-malheureux-du-führer-'),
(6, 'Jour de ressac', '« Finalement, il vous dit quelque chose, notre homme ? Nous arrivions à hauteur de Gonfreville-l\'Orcher, la raffinerie sortait de terre, indéchiffrable et nébuleuse, façon Gotham City, une autre ville derrière la ville, j\'ai baissé ma vitre et inhalé longuement, le nez orienté vers les tours de distillation, vers ce Meccano démentiel. L\'étrange puanteur s\'engouffrait dans la voiture, mélange d\'hydrocarbures, de sel et de poudre. Il m\'a intimé de refermer avant de m\'interroger de nouveau, pourquoi avais-je finalement demandé à voir le corps ? C\'est que vous y avez repensé, c\'est que quelque chose a dû vous revenir.\r\n\r\nOui, j\'y avais repensé. Qu\'est-ce qu\'il s\'imaginait. Je n\'avais pratiquement fait que penser à ça depuis ce matin, mais y penser avait fini par prendre la forme d\'une ville, d\'un premier amour, la forme d\'un porte-conteneurs. »', 'je', 6, 'Verticales', '2024-08-15', 241, '9782073054975', 21.00, 'jour-de-ressac'),
(7, 'Madelaine avant l\'aube', 'C’est un endroit à l’abri du temps. Ce minuscule hameau, qu’on appelle Les Montées, est un pays à lui seul pour les jumelles Ambre et Aelis, et la vieille Rose.\r\nIci, l’existence n’a jamais été douce. Les familles travaillent une terre avare qui appartient à d’autres, endurent en serrant les dents l’injustice. Mais c’est ainsi depuis toujours.\r\nJusqu’au jour où surgit Madelaine. Une fillette affamée et sauvage, sortie des forêts. Adoptée par Les Montées, Madelaine les ravit, passionnée, courageuse, si vivante. Pourtant, il reste dans ses yeux cette petite flamme pas tout à fait droite. Une petite flamme qui fera un jour brûler le monde.\r\n\r\nAvec Madelaine avant l’aube, Sandrine Collette questionne l’ordre des choses, sonde l’instinct de révolte, et nous offre, servie par une écriture éblouissante, une ode aux liens familiaux.', 'Madelaine', 7, 'C’est un endroit à l’abri du temps. Ce minuscule hameau, qu’on appelle Les Montées, est un pays à lui seul pour les jumelles Ambre et Aelis, et la vieille Rose.\r\nIci, l’existence n’a jamais été douce. Les familles travaillent une terre avare qui appartien', '2024-08-21', 247, '9782709674539', 20.90, 'madelaine-avant-l\'aube'),
(8, 'Dors ton sommeil de brute', '« Un long hurlement, celui d’une foule d’enfants, secoue la planète. Dans les villes, le Cri passe à travers les murs, se faufile dans les canalisations, jaillit sous les planchers, court dans les couloirs des tours où les familles dorment les unes au-dessus des autres, le Cri se répand dans les rues. »\r\n\r\nUn rêve collectif court à la vitesse de la rotation terrestre. Il touche tous les enfants du monde à mesure que la nuit avance.\r\nLes nuits de la planète seront désormais marquées par l’apparition de désordres nouveaux, comme si les esprits de la nature tentaient de communiquer avec l’humanité à travers les songes des enfants.\r\nEva a fui son mari et s’est coupée du monde. Dans l’espace sauvage où elle s’est réfugiée avec sa fille Lucie, elle est déterminée à se battre contre ce qui menace son enfant durant son sommeil sur une Terre qui semble basculer.\r\nComment lutter contre la nuit et les cauchemars d’une fillette ?', 'Eva', 8, '	\r\nGallimard', '2024-08-15', 400, '9782072929861', 22.00, 'dors-ton-sommeil-de-brute'),
(9, 'Le club des enfants perdus', 'À vingt-sept ans, Miranda semble appartenir à un drôle de club : celui des enfants qui n\'ont manqué de rien sauf de cette joie pure, essentielle, que certains ressentent du seul fait d\'être en vie.', 'Miranda', 9, 'POL', '2024-08-22', 415, '9782818061435', 22.00, 'le-club-des-enfants-perdus'),
(10, 'Le bastion des larmes', 'À la mort de sa mère, Youssef, un professeur marocain exilé en France depuis un quart de siècle, revient à Salé, sa ville natale, à la demande de ses sœurs, pour liquider l\'héritage familial. En lui, c\'est tout un passé qui ressurgit, où se mêlent inextricablement souffrances et bonheur de vivre.\r\nÀ travers lui, les voix du passé résonnent et l\'interpellent, dont celle de Najib, son ami et amant de jeunesse au destin tragique, happé par le trafic de drogue et la corruption d\'un colonel de l\'armée du roi Hassan II. À mesure que Youssef s\'enfonce dans les ruelles de la ville actuelle, un monde perdu reprend forme, guetté par la misère et la violence, où la différence, sexuelle, sociale, se paie au prix fort. Frontière ultime de ce roman splendide, le Bastion des Larmes, nom donné aux remparts de la vieille ville, à l\'ombre desquels Youssef a jadis fait une promesse à Najib. \" Notre passé... notre grande fiction \", médite Youssef, tandis qu\'il s\'apprête à entrer pleinement dans son héritage, celui d\'une enfance terrible, d\'un amour absolu, aussi, pour ses sœurs magnifiques et sa mère disparue.', 'Youssef', 10, '	\r\nJulliard', '2024-08-22', 212, '9782260056515', 21.00, 'le-bastion-des-larmes'),
(11, 'Coeur', '« Je croyais écrire cette histoire pour mon père, alors que c\'était l\'inverse : cette histoire, il me l\'avait offerte. Et chaque fois que j\'ouvrirai ces pages, je le retrouverai comme si je tenais son coeur vivant entre mes mains. »\r\n\r\nQuand son père malade le presse d\'écrire sur son ancêtre Louis, capitaine des hussards fauché en 1914 dans une charge de cavalerie, Thibault de Montaigu ne sait pas encore quel secret de famille cache cette mort héroïque. Ni pourquoi elle résonne étrangement avec le destin de son propre père qui décline de jour en jour. La course contre la montre qu\'il engage alors pour remonter le passé se mue en une enquête bouleversante où se succèdent personnages proustiens et veuves de guerre, amants flamboyants et épouses délaissées.\r\n\r\nThibault de Montaigu nous raconte une lignée hantée par la gloire et l\'honneur. Mais aussi ce qu\'il reste d\'amour et de courage dissimulés dans le coeur des hommes.', 'Je', 11, 'Albin Michel', '2024-08-21', 327, '9782226493217', 21.90, 'coeur'),
(12, 'Aucun respect', 'Une jeune femme idéaliste comme on peut l\'être à vingt ans arrive à Paris à la fin des années 1990. On la suit dans sa découverte d\'un milieu intellectuel qui a tout d\'une caste d\'hommes.\r\n\r\nElle y rencontre l\'écrivain Alain Robbe-Grillet, imposant « Pape du Nouveau Roman », et son épouse Catherine, maîtresse-star de cérémonies sadomasochistes. Ils incarnent une certaine idée de la littérature et de la liberté sexuelle. Toutes choses auxquelles l\'héroïne s\'affronte tant bien que mal.\r\n\r\nRaconté avec impertinence depuis aujourd\'hui, son apprentissage, d\'une drôlerie irrésistible, est un conte contemporain. Sa leçon est que la liberté s\'exerce dans le jeu avec les autorités établies. Et sa morale, qu\'il ne faut jamais sous-estimer les jeunes femmes.', 'Une jeune femme idéaliste ', 12, 'Stock', '2024-08-21', 224, '9782234093829', 20.00, 'aucun-respect'),
(13, 'La vie meilleure', '« Nous sommes la somme de nos amours. Et c\'est la seule chose qui restera de nous. »\r\n\r\nOn l\'a comparé à Gandhi, à Einstein, à Lénine. Des foules l\'ont acclamé. Des milliardaires lui ont tapé sur l\'épaule. Les damnés de la terre l\'ont imploré. Aujourd\'hui, son nom nous fait sourire, tout comme son invention : la méthode Coué.\r\n\r\nSingulier destin que celui d\'Émile Coué, obscur pharmacien français devenu célébrité mondiale, tour à tour adulé et moqué. La vie meilleure retrace l\'histoire de ce précurseur du développement personnel qui, au début du XXe siècle, pensait avoir découvert les clés de la santé et du bonheur. Un homme sincère jusque dans sa roublardise, qui croyait plus que tout au pouvoir des mots et de l\'imagination.\r\n\r\nAvec ce roman lumineux aux accents intimes, Étienne Kern rend hommage à ceux qui cherchent coûte que coûte une place pour la joie.', 'Émile Coué', 13, 'Gallimard', '2024-08-22', 187, '9782073075833', 19.50, 'la-vie-meilleure'),
(14, 'Archipels', '«?Aux confins de la Louisiane, une île porte le prénom de mon père.\r\n\r\nChaque jour, elle s’enfonce un peu plus sous les eaux.?»\r\n\r\nIl a fallu que son esprit vogue jusqu’à l’Isle de Jean-Charles pour qu’elle se retrouve enfin face à son père. Qui est cet homme à la présence tranquille, à la parole rare, qui se dit sans mémoire?? Pour le découvrir elle se lance dans un projet singulier : lui rendre ses souvenirs, les faire resurgir des objets et des paysages.\r\n\r\nLe premier lieu à arpenter est l’atelier où il a amassé toutes sortes de curiosités, autant de traces qui nourrissent l’enquête sur ce mystère de proximité : le temps qui passe et ces grands inconnus que demeurent souvent nos parents. Derrière l’accumulateur compulsif, l’archiviste des vies des autres, se révèlent l’homme enfant marqué par la guerre, l’artiste engagé et secret. Peu à peu leur relation change, leurs écritures se mêlent et ravivent les hantises et les rêves de toute une époque.\r\n\r\nÀ travers cette géographie intime, Hélène Gaudy explore ce qui se transmet en silence, offrant à son père l’espoir d’un lieu insubmersible – et aux lecteurs, un texte sensible d’une grande beauté.', 'Hélène Gaudy', 14, 'Ed. de l\'Olivier', '2024-08-19', 285, '9782823621150', 21.00, 'archipels'),
(18, 'Paris, Musée du XXIe siècle - Le 18e arrondissement', 'Le 18e arrondissement compte 425 rues, squares, places, avenues, cités, jardins, villas, boulevards, impasses et passages que Thomas Clerc a entrepris d\'arpenter depuis qu\'il y a emménagé récemment. Description totale, née de ses déambulations, dérives et notations, ce livre n\'omet rien de ce que la ville laisse voir, entendre et ressentir.\r\n\r\nDe Montmartre aux abords du périphérique, des habitants de ses quartiers aux touristes égarés, des cafés aux dark stores, de la nuit au jour, l\'ancien faubourg de Paris, insurgé sous la Commune, ne cesse de changer d\'apparence, quand ce n\'est l\'auteur lui-même qui le refaçonne au gré de son périple. Le 18e se déroule comme une toile géante où chaque rue est un tableau vivant.', 'l\'auteur lui-même', 16, 'Éditions de Minuit ', '2024-08-29', 300, '9782707355362', 25.00, 'paris,-musée-du-xxie-siècle---le-18e-arrondissement-18'),
(15, 'Tout le bruit du Guéliz', '« Le bruit condamne l\'Homme à l\'oubli. Mais parfois il arrive qu\'il le sauve de l\'oubli. Il ne tient qu\'à nous de l\'entendre. »\r\n\r\nDans le quartier du Guéliz à Marrakech, un mystérieux bruit hante et tourmente, nuit et jour, une vieille dame. Inquiets, sa fille et son petit-fils quittent Paris pour mener l\'enquête. Sur place, ils guettent, épient, espèrent, mais aucun bruit ne se fait entendre...\r\n\r\nTout le bruit du Guéliz ne nous livre pas une mais mille histoires : celles des exodes, des traditions, des liens qui se font et se défont, des origines perdues.\r\n\r\nÀ la violence et au vacarme assourdissant de notre époque, ce premier roman aux allures de conte, à la fois tendre, drôle et bouleversant, oppose un bruit. Le bruit du Guéliz. Celui d\'un temps révolu, où l\'on vivait ensemble.', 'HOMME', 15, 'Albin Michel', '2024-09-21', 213, '9782226496058', 19.90, 'tout-le-bruit-du-guéliz'),
(16, 'Paris, Musée du XXIe siècle - Le 18e arrondissement', 'Le 18e arrondissement compte 425 rues, squares, places, avenues, cités, jardins, villas, boulevards, impasses et passages que Thomas Clerc a entrepris d\'arpenter depuis qu\'il y a emménagé récemment. Description totale, née de ses déambulations, dérives et notations, ce livre n\'omet rien de ce que la ville laisse voir, entendre et ressentir.\r\n\r\nDe Montmartre aux abords du périphérique, des habitants de ses quartiers aux touristes égarés, des cafés aux dark stores, de la nuit au jour, l\'ancien faubourg de Paris, insurgé sous la Commune, ne cesse de changer d\'apparence, quand ce n\'est l\'auteur lui-même qui le refaçonne au gré de son périple. Le 18e se déroule comme une toile géante où chaque rue est un tableau vivant.', 'l\'auteur lui-même', 16, 'Éditions de Minuit ', '2024-08-29', 300, '9782707355362', 25.00, 'paris,-musée-du-xxie-siècle---le-18e-arrondissement-16');

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `id_member` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `members`
--

INSERT INTO `members` (`id_member`, `name`, `role`, `password`) VALUES
(2, 'Elsa Triolet', 'public', '1111'),
(4, 'Béatrix Beck', 'public', '2222'),
(6, 'Simone de Beauvoir', 'public', '3333'),
(7, 'Anna Langfus', 'public', '4444'),
(9, 'Antonine Maillet', 'public', '5555'),
(12, 'Marguerite Duras ', 'public', '6666'),
(13, 'Pascale Roze ', 'public', '7777'),
(15, 'Paule Constant ', 'public', '8888'),
(17, 'Marie NDiaye', 'public', '9999'),
(19, 'Lydie Salvayre', 'public', '1010'),
(21, 'Leïla Slimani', 'public', '11112'),
(24, 'Brigitte Giraud', 'public', '1212'),
(25, 'Antonine Maillet', 'public', '5555'),
(39, 'shahrzad tajvidi', 'jury', 'shshshsh'),
(27, 'Didier Decoin', 'president', 'm-1234-1'),
(28, 'Françoise Chandernagor', 'jury', 'm-1234-2'),
(29, 'Tahar Ben Jelloun', 'jury', 'm-1234-3'),
(30, 'Christine Angot', 'jury', 'm-1234-4'),
(31, 'Pierre Assouline', 'jury', 'm-1234-5'),
(32, 'Philippe Claudel', 'jury', 'm-1234-6'),
(33, 'Paule Constant', 'jury', 'm-1234-7'),
(34, 'Éric-Emmanuel Schmitt', 'jury', 'm-1234-8'),
(35, 'Camille Laurens', 'jury', 'm-1234-9'),
(36, 'Pascal Bruckner', 'jury', 'm-1234-10'),
(53, 'Decoin didier', 'jury', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `selections`
--

DROP TABLE IF EXISTS `selections`;
CREATE TABLE IF NOT EXISTS `selections` (
  `id_selection` int NOT NULL AUTO_INCREMENT,
  `selection_number` int DEFAULT NULL,
  `id_book` int DEFAULT NULL,
  `max_votes` int DEFAULT NULL,
  `date_selection` date NOT NULL,
  PRIMARY KEY (`id_selection`),
  KEY `id_book` (`id_book`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `selections`
--

INSERT INTO `selections` (`id_selection`, `selection_number`, `id_book`, `max_votes`, `date_selection`) VALUES
(29, 2, 1, 4, '2024-10-01'),
(13, 1, 1, 4, '2024-09-03'),
(14, 1, 2, 4, '2024-09-03'),
(15, 1, 3, 4, '2024-09-03'),
(16, 1, 4, 4, '2024-09-03'),
(17, 1, 5, 4, '2024-09-03'),
(18, 1, 6, 4, '2024-09-03'),
(19, 1, 7, 4, '2024-09-03'),
(20, 1, 8, 4, '2024-09-03'),
(21, 1, 9, 4, '2024-09-03'),
(22, 1, 10, 4, '2024-09-03'),
(23, 1, 11, 4, '2024-09-03'),
(24, 1, 12, 4, '2024-09-03'),
(25, 1, 13, 4, '2024-09-03'),
(26, 1, 14, 4, '2024-09-03'),
(27, 1, 15, 4, '2024-09-03'),
(28, 1, 16, 4, '2024-09-03'),
(38, 2, 2, NULL, '2024-10-01'),
(39, 2, 4, NULL, '2024-10-01'),
(40, 2, 7, NULL, '2024-10-01'),
(41, 3, 3, NULL, '2024-10-22'),
(42, 3, 4, NULL, '2024-10-22'),
(43, 3, 6, NULL, '2024-10-22'),
(44, 2, 6, NULL, '2024-10-01'),
(45, 2, 8, NULL, '2024-10-01'),
(46, 2, 10, NULL, '2024-10-01'),
(47, 2, 12, NULL, '2024-10-01'),
(48, 2, 3, NULL, '2024-10-01'),
(49, 2, 9, NULL, '2024-10-01'),
(50, 2, 5, NULL, '2024-10-01'),
(51, 3, 1, NULL, '2024-10-22'),
(52, 3, 5, NULL, '2024-10-22'),
(53, 3, 2, NULL, '2024-10-22'),
(54, 4, 2, 1, '2024-11-04'),
(56, 3, 8, NULL, '2024-10-22'),
(57, 3, 9, NULL, '2024-10-22'),
(58, 3, 10, NULL, '2024-10-22'),
(59, 3, 11, NULL, '2024-10-22'),
(60, 3, 13, NULL, '2024-10-22'),
(61, 3, 14, NULL, '2024-10-22');

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id_vote` int NOT NULL AUTO_INCREMENT,
  `id_book` int DEFAULT NULL,
  `votes_count` int DEFAULT NULL,
  `id_jury` int DEFAULT NULL,
  `selection_number` int DEFAULT NULL,
  PRIMARY KEY (`id_vote`),
  KEY `id_book` (`id_book`),
  KEY `id_jury` (`id_jury`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `votes`
--

INSERT INTO `votes` (`id_vote`, `id_book`, `votes_count`, `id_jury`, `selection_number`) VALUES
(33, 5, 1, 39, 2),
(34, 7, 1, 39, 2),
(35, 9, 1, 39, 2),
(36, 8, 2, 39, 2),
(37, 2, 1, 39, 2),
(38, 6, 1, 39, 2),
(39, 2, 1, 39, 4),
(40, 2, 2, 53, 2),
(41, 1, 2, 53, 2),
(42, 3, 1, 53, 2),
(43, 6, 1, 53, 2),
(44, 1, 1, 36, 2),
(45, 2, 1, 36, 2),
(46, 3, 1, 36, 2),
(47, 5, 1, 36, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
