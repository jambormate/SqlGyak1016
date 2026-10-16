

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE gazdik (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nev VARCHAR(1000) NOT NULL,
    eletkor INT NOT NULL
);

CREATE TABLE jatekok (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nev VARCHAR(1000) NOT NULL
);

CREATE TABLE macskak (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    suly NUMERIC(5, 2) NOT NULL,
    szem_szin VARCHAR(1000) NOT NULL,
    gazdi_id INT NOT NULL,
    jatek_id INT,
    FOREIGN KEY (gazdi_id) REFERENCES gazdik(id) ON UPDATE CASCADE,
    FOREIGN KEY (jatek_id) REFERENCES jatekok(id) ON UPDATE CASCADE ON DELETE SET NULL
);

START TRANSACTION;
SET time_zone = "+00:00";


INSERT INTO `gazdik` (`id`, `nev`, `eletkor`) VALUES
(1, 'Kiss Zsuzsi', 7),
(2, 'Özv. Kovács Jánosné', 81),
(3, 'Márton Ákos', 21),
(4, 'Fodor Valentin', 35),
(5, 'Takács Ramóna', 28),
(6, 'Dr. Biró Csilla', 41),
(7, 'Linda Smith', 33);


INSERT INTO `jatekok` (`id`, `nev`) VALUES
(1, 'Plüss egér'),
(2, 'Játékpálca'),
(3, 'Gumilabda'),
(4, 'Macskaalagút'),
(5, 'Kulcscsomó'),
(6, 'Gardrób');


INSERT INTO `macskak` (`id`, `suly`, `szem_szin`, `gazdi_id`, `jatek_id`) VALUES
(1, '3.00', 'zöld', 3, 1),
(2, '5.50', 'kék', 2, 4),
(3, '9.00', 'sárga', 2, 4),
(4, '4.50', 'sárga', 2, 5),
(5, '3.75', 'barna', 3, 1),
(6, '4.20', 'zöld', 1, NULL),
(7, '5.55', 'sárga', 5, 5),
(8, '3.55', 'barna', 2, 2),
(9, '4.00', 'zöld', 5, 4),
(10, '5.00', 'zöld', 5, 1),
(11, '5.10', 'rózsaszín', 7, 2),
(12, '3.90', 'barna', 2, 3),
(13, '4.20', 'heterokróm (kék, barna)', 2, 2),
(14, '3.80', 'barna', 3, 3),
(15, '6.00', 'barna', 2, 6);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
