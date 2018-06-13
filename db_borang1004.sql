/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.6.16 : Database - db_borangakreditasi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_borangakreditasi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_borangakreditasi`;

/*Table structure for table `aksesbilitas_data` */

DROP TABLE IF EXISTS `aksesbilitas_data`;

CREATE TABLE `aksesbilitas_data` (
  `kd_jns` int(2) DEFAULT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  `manual` varchar(1) DEFAULT NULL,
  `komp_tnp_jar` varchar(1) DEFAULT NULL,
  `lan` varchar(1) DEFAULT NULL,
  `wan` varchar(1) DEFAULT NULL,
  KEY `FK_aksesbilitas_data` (`kd_jns`),
  KEY `FK_aksesbilitas_prodi` (`kd_prodi`),
  CONSTRAINT `FK_aksesbilitas_data` FOREIGN KEY (`kd_jns`) REFERENCES `jns_data` (`kd_jns`),
  CONSTRAINT `FK_aksesbilitas_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aksesbilitas_data` */

insert  into `aksesbilitas_data`(`kd_jns`,`kd_prodi`,`manual`,`komp_tnp_jar`,`lan`,`wan`) values (1,'P001',NULL,NULL,NULL,'v'),(2,'P001',NULL,NULL,NULL,'v'),(3,'P001',NULL,NULL,NULL,'v'),(4,'P001',NULL,NULL,NULL,'v'),(5,'P001',NULL,NULL,NULL,'v'),(6,'P001',NULL,NULL,NULL,'v'),(7,'P001',NULL,NULL,NULL,'v'),(8,'P001',NULL,NULL,NULL,'v'),(9,'P001',NULL,NULL,NULL,'v'),(10,'P001',NULL,NULL,NULL,'v'),(11,'P001',NULL,NULL,NULL,'v');

/*Table structure for table `aktivitas_dosen` */

DROP TABLE IF EXISTS `aktivitas_dosen`;

CREATE TABLE `aktivitas_dosen` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `sks_pss` int(3) DEFAULT NULL,
  `sks_psl_pts` int(3) DEFAULT NULL,
  `sks_ptl` int(3) DEFAULT NULL,
  `sks_penelitian` int(3) DEFAULT NULL,
  `sks_pp_mas` int(3) DEFAULT NULL,
  `sks_man_pts` int(3) DEFAULT NULL,
  `sks_man_ptl` int(3) DEFAULT NULL,
  KEY `FK_aktivitas_dosen` (`id_dosen`),
  CONSTRAINT `FK_aktivitas_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aktivitas_dosen` */

insert  into `aktivitas_dosen`(`id_dosen`,`sks_pss`,`sks_psl_pts`,`sks_ptl`,`sks_penelitian`,`sks_pp_mas`,`sks_man_pts`,`sks_man_ptl`) values ('1',9,0,0,1,1,6,0),('2',9,0,0,1,1,4,0);

/*Table structure for table `aktivitas_mengajar` */

DROP TABLE IF EXISTS `aktivitas_mengajar`;

CREATE TABLE `aktivitas_mengajar` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `bid_keahlian` varchar(50) DEFAULT NULL,
  `kode_mk` varchar(8) DEFAULT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `jum_kls` int(3) DEFAULT NULL,
  `jml_sks` int(4) NOT NULL,
  `jp_rencana` int(3) DEFAULT NULL,
  `jp_dilaksanakan` int(3) DEFAULT NULL,
  KEY `FK_aktivitas_mengajar` (`id_dosen`),
  CONSTRAINT `FK_aktivitas_mengajar` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aktivitas_mengajar` */

insert  into `aktivitas_mengajar`(`id_dosen`,`bid_keahlian`,`kode_mk`,`nama_mk`,`jum_kls`,`jml_sks`,`jp_rencana`,`jp_dilaksanakan`) values ('1','Analisis dan Perancangan','MIMKL24','Rekayasa Perangkat Lunak',1,0,16,16),('2','Pemrograman Web dan Networking','MIMKL14','Pemrograman Internet I (WEB)',1,0,16,16),('9',NULL,'MIMKL23','Matematika Diskrit',NULL,3,16,16),('11',NULL,'MIMKD10','Kalkulus',NULL,3,16,16),('17',NULL,'MIMKU03','PENDIDIKAN AGAMA',NULL,2,16,16);

/*Table structure for table `artikel_ilmiah` */

DROP TABLE IF EXISTS `artikel_ilmiah`;

CREATE TABLE `artikel_ilmiah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kd_prodi` varchar(6) NOT NULL,
  `judul` text,
  `nama_dosen` varchar(50) DEFAULT NULL,
  `dipublikasikan` varchar(100) DEFAULT NULL,
  `thn_publikasi` int(4) DEFAULT NULL,
  `lokal` varchar(1) DEFAULT NULL,
  `nasional` varchar(1) DEFAULT NULL,
  `internasional` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `artikel_ilmiah` */

insert  into `artikel_ilmiah`(`id`,`kd_prodi`,`judul`,`nama_dosen`,`dipublikasikan`,`thn_publikasi`,`lokal`,`nasional`,`internasional`) values (1,'','Pembangunan Sistem Informasi Konsumsi Tunas Raharja di MAN 1 Cirebon','Nur Achadi, Selly Meliana','Jurnal Ilmu Komputer Vol. 6 No. 1',2015,'v',NULL,NULL),(2,'','Pembangunan Aplikasi Bursa Kerja Khusus di SMK Negeri 1 Kota Sukabumi berbasis Web','Sriwisnu','Jurnal Ilmu Komputer Vol. 6 No. 1',2015,'v',NULL,NULL),(3,'','Pembangunan Aplikasi Informasi Pajak Bumi dan Bangunan Berbasis Android dan Google Cloud Messanginges di Desa','Yudhistira','Jurnal Ilmu Komputer Vol. 6 No. 1',2015,'v',NULL,NULL),(4,'','Pembangunan Aplikasi E-Learning SMA Negeri 1 Ciranjang','Eko Travada, Erna Hikmawati','Jurnal Ilmu Komputer Vol. 6 No. 1',2015,'v',NULL,NULL),(5,'','Pembangunan Aplikasi Profil Pahlawan Nasional Indonesia Berbasis Android dan Google Map','Soleh Sabarudin, Eni Triningsih','Jurnal Ilmu Komputer Vol. 6 No. 1',2015,'v',NULL,NULL),(6,'','Sistem Informasi Wisata Berbasis Android dan GIS Studi Kasus Pulau Biawak Indramayu','Soleh Sabarudin, Selly Meliana','Jurnal Ilmu Komputer Vol. 6 No. 2',2015,'v',NULL,NULL),(7,'','Implementasi K-Means Cluster Untuk Menentukan Strategi Marketing di Universitas Nasional Pasim ','Eko Travada, Sriwisnu','Jurnal Ilmu Komputer Vol. 6 No. 2',2015,'v',NULL,NULL),(8,'','Pembangunan Aplikasi Pembobotan Parameter Tes Potensi Akademik (TPA) Penerimaan Mahasiswa / Mahasiswi Pemberdayaan Umat Berkelanjutan (PUB) dengan Metode Analitycal Hierarchy Process (AHP)','Eni Triningsih','Jurnal Ilmu Komputer Vol. 6 No. 2',2015,'v',NULL,NULL),(9,'','Sistem Pendukung Keputusan Pemilihan Vendor Layanan Jaringan dengan Menggunakan Metode AHP dan TOPSIS \r\n','Erna Hikmawati','Jurnal Ilmu Komputer Vol. 6 No. 2',2015,'v',NULL,NULL),(10,'','Arsitektur Enterprise Sistem Informasi Centralized Traffic Control (CTC) Kereta Api\r\n','Yudhistira, Nur Achadi','Jurnal Ilmu Komputer Vol. 6 No. 2',2015,'v',NULL,NULL),(11,'','Penerapan Algoritma Ant Colony Optimization (ACO) Untuk Perhitungan Jarak Terpendek Lokal Wisata di Kota Bandung','Erna Hikmawati, Sriwisnu','Jurnal Ilmu Komputer Vol. 7 No. 1',2016,'v',NULL,NULL),(12,'','Perbandingan Web Service REST dan SOAP (Studi Kasus PT. Dinamika Mitra Sukses Makmur)','Yudhistira, Selly Meliana','Jurnal Ilmu Komputer Vol. 7 No. 1',2016,'v',NULL,NULL),(13,'','Implementasi Algoritma Minimum Edit Distance dalam Pembangunan Aplikasi Pendeteksi Plagiarisme Dokumen Bahasa Indonesia ','Nur Achadi','Jurnal Ilmu Komputer Vol. 7 No. 1',2016,'v',NULL,NULL),(14,'','Pembangunan Aplikasi Penjadwalan Mata Kuliah Menggunakan Algoritma Genetika (Studi Kasus ada Universitas Nasional Pasim Bandung)','Eko Travada, Soleh Sabarudin','Jurnal Ilmu Komputer Vol. 7 No. 1',2016,'v',NULL,NULL),(15,'','Sistem Pendukung Keputusan Seleksi Beasiswa dengan Metode SAW (Simple Additive Weighting) Berbasis Web (Studi Kasus di SMA Negeri 1 Ciranjang)','Eni Triningsih','Jurnal Ilmu Komputer Vol. 7 No. 1',2016,'v',NULL,NULL),(16,'','Penerapan Market Basket Analysis Pada Aplikasi Book Recomender System Menggunakan Frequent Pattern Growth','Erna Hikmawati, Selly Meliana','Jurnal Ilmu Komputer Vol. 7 No. 2',2016,'v',NULL,NULL);

/*Table structure for table `dana_penelitian` */

DROP TABLE IF EXISTS `dana_penelitian`;

CREATE TABLE `dana_penelitian` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kd_prodi` varchar(6) NOT NULL,
  `jns_dana` int(2) DEFAULT NULL,
  `sumber_dana` varchar(50) NOT NULL,
  `tahun` int(4) DEFAULT NULL,
  `judul_penelitian` varchar(100) DEFAULT NULL,
  `jml_dana` double(2,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prodi_dana` (`kd_prodi`),
  KEY `FK_dana_sumber` (`jns_dana`),
  CONSTRAINT `FK_dana_sumber` FOREIGN KEY (`jns_dana`) REFERENCES `sumber_dana` (`id_dana`),
  CONSTRAINT `FK_prodi_dana` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `dana_penelitian` */

insert  into `dana_penelitian`(`id`,`kd_prodi`,`jns_dana`,`sumber_dana`,`tahun`,`judul_penelitian`,`jml_dana`) values (1,'P001',1,'PS Sendiri',2014,'Pembangunan Sistem Informasi Konsumsi Tunas Raharja di MAN 1 Cirebon',6.0),(2,'P001',1,'PS Sendiri',2014,'Pembangunan Aplikasi Bursa Kerja Khusus di SMK Negeri 1 Kota Sukabumi berbasis Web',6.0),(3,'P001',4,'PT. Pasim Sentra Utama',2014,'Pembangunan Aplikasi Informasi Pajak Bumi dan Bangunan Berbasis Android dan Google Cloud Messanginge',4.5),(4,'P001',1,'PS Sendiri',2014,'Pembangunan Aplikasi E-Learning SMA Negeri 1 Ciranjang',6.0),(5,'P001',4,'PT. Pasim Sentra Utama',2015,'Pembangunan Aplikasi Profil Pahlawan Nasional Indonesia Berbasis Android dan Google Map',6.5),(6,'P001',4,'PT. Stafalindo',2015,'Sistem Informasi Wisata Berbasis Android dan GIS Studi Kasus Pulau Biawak Indramayu',7.3);

/*Table structure for table `dana_pengmas` */

DROP TABLE IF EXISTS `dana_pengmas`;

CREATE TABLE `dana_pengmas` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kd_prodi` varchar(6) NOT NULL,
  `jns_dana` int(2) DEFAULT NULL,
  `sumber_dana` varchar(50) NOT NULL,
  `tahun` int(4) DEFAULT NULL,
  `judul_kegiatan` varchar(100) DEFAULT NULL,
  `jumlah_dana` double(10,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dana_pengmas` (`jns_dana`),
  KEY `FK_prodi_pengmas` (`kd_prodi`),
  CONSTRAINT `FK_dana` FOREIGN KEY (`jns_dana`) REFERENCES `sumber_dana` (`id_dana`),
  CONSTRAINT `FK_prodi_pengmas` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `dana_pengmas` */

insert  into `dana_pengmas`(`id`,`kd_prodi`,`jns_dana`,`sumber_dana`,`tahun`,`judul_kegiatan`,`jumlah_dana`) values (1,'P001',4,'PT. Pasim Sentra Utama',2014,'Pelatihan Penggunaan Microsoft Word pada Ibu-Ibu PKK Desa Cileunyi Wetan',5.6),(2,'P001',4,'PT. Pasim Sentra Utama',2014,'Pelatihan Penggunaan Microsoft Excel pada Ibu-Ibu PKK Desa Cileunyi Wetan',5.8),(3,'P001',3,'Dinas Koprasi dan UKM Kab. Bandung Barat',2014,'Peningkatan Kemampuan Kapasitas Manajemen Keuangan Koperasi   Tunas Harapan berbasis Aplikasi Komput',8.0),(4,'P001',4,'PT. Valanino',2015,'Peningkatan Efektivitas Pembuatan Surat dengan Menggunakan ',6.1),(5,'P001',4,'PT. Valanino',2015,'Peningkatan Efektifitas Pengolahan Data dengan Menggunakan ',6.2);

/*Table structure for table `dana_tridarma` */

DROP TABLE IF EXISTS `dana_tridarma`;

CREATE TABLE `dana_tridarma` (
  `kd_prodi` varchar(6) DEFAULT NULL,
  `ts_2` decimal(2,0) DEFAULT NULL,
  `ts_1` decimal(2,0) DEFAULT NULL,
  `ts` decimal(2,0) DEFAULT NULL,
  KEY `FK_dana_tridarma` (`kd_prodi`),
  CONSTRAINT `FK_dana_tridarma` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dana_tridarma` */

insert  into `dana_tridarma`(`kd_prodi`,`ts_2`,`ts_1`,`ts`) values ('P001','99','99','99');

/*Table structure for table `data_mhs` */

DROP TABLE IF EXISTS `data_mhs`;

CREATE TABLE `data_mhs` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_prodi` varchar(6) NOT NULL,
  `tahun` int(4) DEFAULT NULL,
  `kd_prog` int(2) DEFAULT NULL,
  `dy_tampung` int(5) DEFAULT NULL,
  `jc_mhs_ikt_seleksi` int(5) DEFAULT NULL,
  `jc_mhs_lls_seleksi` int(5) DEFAULT NULL,
  `j_maba_reg_bkn_trf` int(5) DEFAULT NULL,
  `j_maba_trf` int(5) DEFAULT NULL,
  `j_tot_reg_bkn_trf` int(5) DEFAULT NULL,
  `j_tot_trf` int(5) DEFAULT NULL,
  `j_llsn_reg_bkn_trf` int(5) DEFAULT NULL,
  `j_llsn_trf` int(5) DEFAULT NULL,
  `ipk_min` double(10,2) DEFAULT NULL,
  `ipk_rat` double(10,2) DEFAULT NULL,
  `ipk_mak` double(10,2) DEFAULT NULL,
  `prsn_ipk1` double(10,2) DEFAULT NULL,
  `prsn_ipk2` double(10,2) DEFAULT NULL,
  `prsn_ipk3` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dt_mhs_reg` (`tahun`),
  KEY `FK_data_mhs` (`kd_prog`),
  KEY `FK_prd` (`id_prodi`),
  CONSTRAINT `FK_data_mhs` FOREIGN KEY (`kd_prog`) REFERENCES `jns_program` (`kd_prog`),
  CONSTRAINT `FK_prd` FOREIGN KEY (`id_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `data_mhs` */

insert  into `data_mhs`(`id`,`id_prodi`,`tahun`,`kd_prog`,`dy_tampung`,`jc_mhs_ikt_seleksi`,`jc_mhs_lls_seleksi`,`j_maba_reg_bkn_trf`,`j_maba_trf`,`j_tot_reg_bkn_trf`,`j_tot_trf`,`j_llsn_reg_bkn_trf`,`j_llsn_trf`,`ipk_min`,`ipk_rat`,`ipk_mak`,`prsn_ipk1`,`prsn_ipk2`,`prsn_ipk3`) values (1,'P001',2012,1,50,1160,46,45,0,192,0,33,0,2.81,3.44,3.78,0.00,39.00,61.00),(2,'P001',2013,1,65,2800,65,62,0,221,0,25,0,3.11,3.54,3.95,0.00,32.00,68.00),(3,'P001',2014,1,65,992,45,43,0,201,0,37,0,3.13,3.71,3.91,0.00,6.00,94.00),(4,'P001',2015,1,65,1014,40,39,0,139,0,41,0,3.46,3.64,3.87,0.00,5.00,95.00),(5,'P001',2016,1,65,1016,60,59,0,139,0,41,0,2.96,3.57,3.85,0.00,24.00,76.00);

/*Table structure for table `data_mhs_angkatan` */

DROP TABLE IF EXISTS `data_mhs_angkatan`;

CREATE TABLE `data_mhs_angkatan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_prodi` varchar(6) DEFAULT NULL,
  `tahun` int(4) DEFAULT NULL,
  `ts_6` int(6) DEFAULT NULL,
  `ts_5` int(6) DEFAULT NULL,
  `ts_4` int(6) DEFAULT NULL,
  `ts_3` int(6) DEFAULT NULL,
  `ts_2` int(6) DEFAULT NULL,
  `ts_1` int(6) DEFAULT NULL,
  `ts` int(6) DEFAULT NULL,
  `jml_ts_llsan` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_data_mhs_angkatan` (`id_prodi`),
  CONSTRAINT `FK_data_mhs_angkatan` FOREIGN KEY (`id_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `data_mhs_angkatan` */

insert  into `data_mhs_angkatan`(`id`,`id_prodi`,`tahun`,`ts_6`,`ts_5`,`ts_4`,`ts_3`,`ts_2`,`ts_1`,`ts`,`jml_ts_llsan`) values (1,'P001',2012,NULL,NULL,45,42,42,4,4,38),(2,'P001',2013,NULL,NULL,NULL,62,61,61,0,41),(3,'P001',2014,NULL,NULL,NULL,NULL,43,41,37,37),(4,'P001',2015,NULL,NULL,NULL,NULL,NULL,39,39,0),(5,'P001',2016,NULL,NULL,NULL,NULL,NULL,NULL,59,NULL);

/*Table structure for table `dosen_tbl` */

DROP TABLE IF EXISTS `dosen_tbl`;

CREATE TABLE `dosen_tbl` (
  `id_dosen` varchar(6) NOT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  `nidn` varchar(10) DEFAULT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `tgl_lhr` date NOT NULL,
  `kd_jab` varchar(4) DEFAULT NULL,
  `kd_jns_dosen` int(1) DEFAULT NULL,
  `sertifikasi` enum('Ya','Tidak','','') NOT NULL,
  `gelar_s1` varchar(20) DEFAULT NULL,
  `asal_pt_s1` varchar(50) DEFAULT NULL,
  `bid_keahlian_s1` varchar(30) DEFAULT NULL,
  `gelar_s2` varchar(20) DEFAULT NULL,
  `asal_pt_s2` varchar(50) DEFAULT NULL,
  `bid_keahlian_s2` varchar(30) DEFAULT NULL,
  `gelar_s3` varchar(20) DEFAULT NULL,
  `asal_pt_s3` varchar(50) DEFAULT NULL,
  `bid_keahlian_s3` varchar(30) DEFAULT NULL,
  `gelar` varchar(50) DEFAULT NULL,
  `pengakuan` varchar(100) DEFAULT NULL,
  `bid_keahlian` varchar(100) DEFAULT NULL,
  `sts_ahli` enum('YA','TIDAK','','') NOT NULL,
  PRIMARY KEY (`id_dosen`),
  KEY `FK_jns` (`kd_jns_dosen`),
  KEY `FK_jab` (`kd_jab`),
  KEY `FK_prodi_dosen` (`kd_prodi`),
  CONSTRAINT `FK_jab` FOREIGN KEY (`kd_jab`) REFERENCES `jab_akademik` (`kd_jab`),
  CONSTRAINT `FK_jns` FOREIGN KEY (`kd_jns_dosen`) REFERENCES `jns_dosen` (`kd_jns`),
  CONSTRAINT `FK_prodi_dosen` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dosen_tbl` */

insert  into `dosen_tbl`(`id_dosen`,`kd_prodi`,`nidn`,`nama_dosen`,`tgl_lhr`,`kd_jab`,`kd_jns_dosen`,`sertifikasi`,`gelar_s1`,`asal_pt_s1`,`bid_keahlian_s1`,`gelar_s2`,`asal_pt_s2`,`bid_keahlian_s2`,`gelar_s3`,`asal_pt_s3`,`bid_keahlian_s3`,`gelar`,`pengakuan`,`bid_keahlian`,`sts_ahli`) values ('1','P001','0421089201','Erna Hikmawati','1992-08-21',NULL,1,'Tidak','S. Kom','Universitas Nasional Pasim','Teknik Informatika','M. Kom','STMIK Likmi','Sistem Informasi',NULL,NULL,NULL,'OCA, OCP, MOS','Oracle, Microsoft','Java, Microsoft Access','YA'),('11','P001','0418106603','Tjandra Tjahyarini','1966-10-18','2',1,'Tidak','Ir','Institut Teknologi Bandung','Geofisika','','(Sedang Studi Lanjut) STMIK LIKMI','Sistem Informasi',NULL,NULL,NULL,NULL,NULL,NULL,'TIDAK'),('17','P001',NULL,'JUHRIDIN','1980-03-09',NULL,2,'Tidak','S.Pd','STAI Siliwangi Bandung','Bahasa Inggris','M.Ag','Pasca Sarjana UIN SGD Bandng','PAI',NULL,NULL,NULL,NULL,NULL,NULL,'TIDAK'),('2','P001','0408097207','Soleh Sabarudin','1972-09-08',NULL,1,'Tidak','S. Kom','Universitas Nasional Pasim','Teknik Informatika','M. Kom','STMIK Likmi','Sistem Informasi',NULL,NULL,NULL,NULL,'Sololearn','HTML, PHP','YA'),('3','P001','8863350017','Eni Triningsih','1989-09-24',NULL,1,'Tidak','S. Kom','Universitas Nasional Pasim','Teknik Informatika','M.T','Institut Teknologi Bandung','Sistem Informasi',NULL,NULL,NULL,NULL,'Sololearn','SQL','YA'),('4','P001','0408047305','Eko Travada SP','1973-01-23','1',1,'Ya','S.T','Universitas Kristen Maranatha','Teknik Elektro','M.T','Institut Teknologi Bandung','Teknik Elektro',NULL,'Sedang Studi Lanjut (S3 STEI ITB)','Elektro dan Informatika',NULL,'Sololearn','C++','YA'),('5','P001','8891700016','Yudhistira Sulaeman','1973-07-03',NULL,1,'Tidak','S.Si','Institut Teknologi Bandung','Matematika','M.Kom','STMIK Likmi','Sistem Informasi',NULL,NULL,NULL,NULL,NULL,NULL,'YA'),('9','P001','0428097402','Lucky Handayani','1974-09-28',NULL,1,'Tidak','S.T','Universitas Jenderal Ahmad Yani','Teknik Mesin','M.T','Institut Teknologi Bandung ','Teknik Mesin',NULL,NULL,NULL,NULL,NULL,NULL,'TIDAK');

/*Table structure for table `dt_ruang_dosen` */

DROP TABLE IF EXISTS `dt_ruang_dosen`;

CREATE TABLE `dt_ruang_dosen` (
  `id_jns` int(2) NOT NULL AUTO_INCREMENT,
  `kd_prodi` varchar(6) NOT NULL,
  `jml_ruang` int(3) DEFAULT NULL,
  `jml_luas` int(3) DEFAULT NULL,
  UNIQUE KEY `id_jns` (`id_jns`),
  KEY `FK_dt_ruang_prodi` (`kd_prodi`),
  CONSTRAINT `FK_dt_ruang_dosen` FOREIGN KEY (`id_jns`) REFERENCES `jns_ruang` (`kd_jns`),
  CONSTRAINT `FK_dt_ruang_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `dt_ruang_dosen` */

insert  into `dt_ruang_dosen`(`id_jns`,`kd_prodi`,`jml_ruang`,`jml_luas`) values (1,'P001',NULL,NULL),(2,'P001',NULL,NULL),(3,'P001',NULL,NULL),(4,'P001',16,64);

/*Table structure for table `evaluasi_lulusan` */

DROP TABLE IF EXISTS `evaluasi_lulusan`;

CREATE TABLE `evaluasi_lulusan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_prodi` varchar(6) NOT NULL,
  `id_kemampuan` int(4) DEFAULT NULL,
  `sangat_baik` double(10,2) DEFAULT NULL,
  `baik` double(10,2) DEFAULT NULL,
  `cukup` double(10,2) DEFAULT NULL,
  `kurang` double(10,2) DEFAULT NULL,
  `rencana` tinytext,
  PRIMARY KEY (`id`),
  KEY `FK_evaluasi_lulusan` (`id_kemampuan`),
  KEY `FK_prodi_lulusan` (`id_prodi`),
  CONSTRAINT `FK_evaluasi_lulusan` FOREIGN KEY (`id_kemampuan`) REFERENCES `jns_kemampuan` (`id`),
  CONSTRAINT `FK_prodi_lulusan` FOREIGN KEY (`id_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `evaluasi_lulusan` */

insert  into `evaluasi_lulusan`(`id`,`id_prodi`,`id_kemampuan`,`sangat_baik`,`baik`,`cukup`,`kurang`,`rencana`) values (1,'P001',1,84.76,15.24,0.00,0.00,'memberikan muatan etika dan moral pada materi kurikulum program studi (mata kuliah etika profesi),\r\nmenyelenggarakan kegiatan pembinaan oleh koordinator beasiswa PUB,\r\nmenyelenggaraakan mentoring setiap minggu'),(2,'P001',2,91.43,8.57,0.00,0.00,'Mengadakan pelatihan yang berkaitan dengan pemrograman,Mengadakan bootcamp (pelatihan) untuk persiapan dunia kerja'),(3,'P001',3,66.67,17.14,16.19,0.00,'Mnyelenggarakan mata kuliah TOEFL, Mengadakan kegiatan English club, Mengadakan pelatihan public speaking, Mengadakan kegiatan pelatihan bahasa inggris yang bekerja sama dengan program studi D3 Bahasa Inggris'),(4,'P001',4,85.71,14.29,0.00,0.00,'Penyediaan sarana laboratorium komputer yang memadai, Mendorong dosen untuk memanfaatkan teknologi informasi dalam proses pembelajaran, Penggunaan aplikasi IT untuk layanan mahasiswa (digital campus)'),(5,'P001',5,80.95,12.38,6.67,0.00,'Mengadakan pelatihan public speaking, Memperbanyak tugas pembuatan laporan ilmiah (untuk meningkatkan kemampuan komunikasi tertulis), Memperbanyak presentasi/diskusi dalam kelas (untuk meningkatkan kemampuan komunikasi secara lisan)'),(6,'P001',6,79.05,11.43,9.52,0.00,'Memperbanyak pemberian tugas yang harus dikerjakan dan dipresentasikan secara kelompok, Mengadakan kegiatan Latihan Dasar Kepemimpinan Mahasiswa (LDKM)'),(7,'P001',7,91.43,8.57,0.00,0.00,'Mengikutsertakan mahasiswa dalam berbagai kegiatan UKM dan kepengurusan PUB sehingga dapat mengembangkan potensi yang dimiliki oleh mahasiswa tersebut');

/*Table structure for table `fakultas_tbl` */

DROP TABLE IF EXISTS `fakultas_tbl`;

CREATE TABLE `fakultas_tbl` (
  `kode_fakultas` varchar(6) NOT NULL,
  `nama_fakultas` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fakultas_tbl` */

insert  into `fakultas_tbl`(`kode_fakultas`,`nama_fakultas`) values ('F001','Ilmu Komputer');

/*Table structure for table `hak_intelektual` */

DROP TABLE IF EXISTS `hak_intelektual`;

CREATE TABLE `hak_intelektual` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `karya` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hak_intelektual` */

/*Table structure for table `instansi_lulusan` */

DROP TABLE IF EXISTS `instansi_lulusan`;

CREATE TABLE `instansi_lulusan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_ts` int(4) DEFAULT NULL,
  `instansi` varchar(50) DEFAULT NULL,
  `j_lulusan_psn` int(3) DEFAULT NULL,
  `j_lulusan_terima` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_instansi_lulusan` (`id_ts`),
  CONSTRAINT `FK_instansi_lulusan` FOREIGN KEY (`id_ts`) REFERENCES `data_mhs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `instansi_lulusan` */

insert  into `instansi_lulusan`(`id`,`id_ts`,`instansi`,`j_lulusan_psn`,`j_lulusan_terima`) values (1,1,'PT. Pasim Sentra Utama',5,5),(2,1,'CV. Zharfan Dwi Putra',3,2),(3,2,'PT. Pasim Sentra Utama',5,4),(4,2,'CV. Zharfan Dwi Putra',2,1),(5,2,'PT. Sonitacitra Buanamandiri',3,3),(6,3,'PT. Pasim Sentra Utama',5,3),(7,3,'PT. Duta Berlian Nusantara',2,2),(8,3,'PT. Kalysa Intijaya Sakti',3,2),(9,3,'PT. Sonitacitra Buanamandiri',3,3),(10,4,'PT. Pasim Sentra Utama',8,8),(11,4,'PT. PUB Pasim Putra',3,3),(12,4,'PT. Kalysa Intijaya Sakti',3,3),(13,4,'PT. Stafalindo Menara Nusantara',2,2),(14,4,'PT. Virginindo Utama Karya',2,1),(15,5,'PT. Pasim Sentra Utama',5,4),(16,5,'PT. Valanino Rajawali Perkasa',5,4),(17,5,'PT. Duta Berlian Nusantara',4,4),(18,5,'PT. Kalysa Intijaya Sakti',2,2),(19,5,'PT. Sonitacitra Buanamandiri',4,3),(20,5,'Yayasan Robo Pasim Global Internusa',3,3);

/*Table structure for table `instrumen` */

DROP TABLE IF EXISTS `instrumen`;

CREATE TABLE `instrumen` (
  `id` int(3) NOT NULL,
  `instrumen` varchar(30) NOT NULL,
  `file` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `instrumen` */

insert  into `instrumen`(`id`,`instrumen`,`file`) values (1,'tes3','Problem_Set_2.docx'),(3,'tes9','Absence.xlsx'),(123,'tes','LAPORAN_MINGGAN_DIVISI_PENDIDI');

/*Table structure for table `jab_akademik` */

DROP TABLE IF EXISTS `jab_akademik`;

CREATE TABLE `jab_akademik` (
  `kd_jab` varchar(4) NOT NULL,
  `nm_jab_akd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jab_akademik` */

insert  into `jab_akademik`(`kd_jab`,`nm_jab_akd`) values ('1','Lektor'),('2','Asisten Ahli');

/*Table structure for table `jns_data` */

DROP TABLE IF EXISTS `jns_data`;

CREATE TABLE `jns_data` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `jns_data` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `jns_data` */

insert  into `jns_data`(`kd_jns`,`jns_data`) values (1,'Mahasiswa'),(2,'Kartu Rencana Studi (KRS)'),(3,'Jadwal Mata Kuliah'),(4,'Nilai Mata Kuliah'),(5,'Transkrip Akademik'),(6,'Lulusan'),(7,'Dosen'),(8,'Pegawai'),(9,'Keuangan'),(10,'Inventaris'),(11,'Perpustakaan');

/*Table structure for table `jns_dosen` */

DROP TABLE IF EXISTS `jns_dosen`;

CREATE TABLE `jns_dosen` (
  `kd_jns` int(1) NOT NULL DEFAULT '0',
  `jns_dosen` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_dosen` */

insert  into `jns_dosen`(`kd_jns`,`jns_dosen`) values (1,'TETAP'),(2,'TIDAK TETAP');

/*Table structure for table `jns_hal` */

DROP TABLE IF EXISTS `jns_hal`;

CREATE TABLE `jns_hal` (
  `kd_hal` int(3) NOT NULL AUTO_INCREMENT,
  `jenis` enum('JABFUNG','DIKTI','','') NOT NULL,
  `hal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kd_hal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `jns_hal` */

insert  into `jns_hal`(`kd_hal`,`jenis`,`hal`) values (1,'JABFUNG','Asisten Ahli'),(2,'JABFUNG','Lektor'),(3,'JABFUNG','Lektor Kepala'),(4,'JABFUNG','Guru Besar/Profesor'),(5,'DIKTI','S1'),(6,'DIKTI','S2/Profesi/Sp-1'),(7,'DIKTI','S3/Sp-2');

/*Table structure for table `jns_jurnal` */

DROP TABLE IF EXISTS `jns_jurnal`;

CREATE TABLE `jns_jurnal` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `jns_jurnal` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_jurnal` */

/*Table structure for table `jns_kemampuan` */

DROP TABLE IF EXISTS `jns_kemampuan`;

CREATE TABLE `jns_kemampuan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `jns_kemampuan` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `jns_kemampuan` */

insert  into `jns_kemampuan`(`id`,`jns_kemampuan`) values (1,'Integritas (etika dan moral)'),(2,'Keahlian berdasarkan bidang il'),(3,'Bahasa Inggris'),(4,'Penggunaan Teknologi Informasi'),(5,'Komunikasi'),(6,'Kerjasama Tim'),(7,'Pengembangan Diri');

/*Table structure for table `jns_matkul` */

DROP TABLE IF EXISTS `jns_matkul`;

CREATE TABLE `jns_matkul` (
  `kd_jns` int(1) NOT NULL AUTO_INCREMENT,
  `jns_matkul` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `jns_matkul` */

insert  into `jns_matkul`(`kd_jns`,`jns_matkul`) values (1,'WAJIB'),(2,'PILIHAN');

/*Table structure for table `jns_mhs` */

DROP TABLE IF EXISTS `jns_mhs`;

CREATE TABLE `jns_mhs` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `jns_mhs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_mhs` */

/*Table structure for table `jns_penggunaan` */

DROP TABLE IF EXISTS `jns_penggunaan`;

CREATE TABLE `jns_penggunaan` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `status_dana` enum('OPR','INV','','') NOT NULL,
  `jns_penggunaan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `jns_penggunaan` */

insert  into `jns_penggunaan`(`kd_jns`,`status_dana`,`jns_penggunaan`) values (1,'OPR','Pendidikan'),(2,'OPR','Penelitian'),(3,'OPR','Pengabdian kepada Masyarakat'),(4,'INV','Investasi Prasarana'),(5,'INV','Investasi Sarana'),(6,'INV','Investasi SDM'),(7,'INV','Lain-Lain');

/*Table structure for table `jns_program` */

DROP TABLE IF EXISTS `jns_program`;

CREATE TABLE `jns_program` (
  `kd_prog` int(2) NOT NULL AUTO_INCREMENT,
  `jns_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_prog`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `jns_program` */

insert  into `jns_program`(`kd_prog`,`jns_program`) values (1,'REGULER'),(2,'NON REGULER');

/*Table structure for table `jns_pustaka` */

DROP TABLE IF EXISTS `jns_pustaka`;

CREATE TABLE `jns_pustaka` (
  `kd_jns` int(3) NOT NULL AUTO_INCREMENT,
  `jns_pustaka` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `jns_pustaka` */

insert  into `jns_pustaka`(`kd_jns`,`jns_pustaka`) values (1,'Buku Teks dan handbook'),(2,'Modul Praktikum / Praktek'),(3,'Jurnal yang terakreditasi oleh lembaga resmi (Dikt'),(4,'Jurnal Internasional (termasuk e-journal)'),(5,'Majalah Ilmiah'),(6,'Prosiding');

/*Table structure for table `jns_ruang` */

DROP TABLE IF EXISTS `jns_ruang`;

CREATE TABLE `jns_ruang` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `ruang_dosen` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `jns_ruang` */

insert  into `jns_ruang`(`kd_jns`,`ruang_dosen`) values (1,'Satu ruang untuk leb'),(2,'Satu ruang untuk 3-4'),(3,'Satu ruang untuk 2 d'),(4,'Satu ruang untuk 1 d');

/*Table structure for table `jns_tng_kepend` */

DROP TABLE IF EXISTS `jns_tng_kepend`;

CREATE TABLE `jns_tng_kepend` (
  `kd_jns` int(3) NOT NULL AUTO_INCREMENT,
  `jns_tng_kepend` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `jns_tng_kepend` */

insert  into `jns_tng_kepend`(`kd_jns`,`jns_tng_kepend`) values (1,'Pustakawan'),(2,'Laboran/ Teknisi/ Analis/ Operator/ Programer'),(3,'Administrasi'),(4,'Lainnya');

/*Table structure for table `jumlah_sks_ps` */

DROP TABLE IF EXISTS `jumlah_sks_ps`;

CREATE TABLE `jumlah_sks_ps` (
  `id_ps` varchar(6) DEFAULT NULL,
  `jns_matkul` int(1) DEFAULT NULL,
  `sks` int(3) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  KEY `FK_jumlah_sks_ps` (`id_ps`),
  KEY `FK_jumlah` (`jns_matkul`),
  CONSTRAINT `FK_jumlah` FOREIGN KEY (`jns_matkul`) REFERENCES `jns_matkul` (`kd_jns`),
  CONSTRAINT `FK_jumlah_sks_ps` FOREIGN KEY (`id_ps`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jumlah_sks_ps` */

/*Table structure for table `jurnal` */

DROP TABLE IF EXISTS `jurnal`;

CREATE TABLE `jurnal` (
  `kd_jns` int(2) DEFAULT NULL,
  `nm_jurnal` varchar(50) DEFAULT NULL,
  `rincian` varchar(50) DEFAULT NULL,
  `jml` int(4) DEFAULT NULL,
  KEY `FK_jurnal` (`kd_jns`),
  CONSTRAINT `FK_jurnal` FOREIGN KEY (`kd_jns`) REFERENCES `jns_jurnal` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jurnal` */

/*Table structure for table `kegiatan_ahli` */

DROP TABLE IF EXISTS `kegiatan_ahli`;

CREATE TABLE `kegiatan_ahli` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kd_prodi` varchar(6) NOT NULL,
  `nama_pakar` varchar(50) DEFAULT NULL,
  `instansi` varchar(50) DEFAULT NULL,
  `judul_keg` varchar(100) DEFAULT NULL,
  `pelaksanaan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `kegiatan_ahli` */

insert  into `kegiatan_ahli`(`id`,`kd_prodi`,`nama_pakar`,`instansi`,`judul_keg`,`pelaksanaan`) values (1,'P001','Kwon Young Choi','ARES, Co.Ltd','Workshop Visual Basic .Net','18 Desember 2014'),(2,'P001','Park Young Sun','DUDU IT','Seminar Simulation Logic for Electronic Warfare','14 Januari 2015'),(3,'P001','Park Young Sun','DUDU IT','Wargame Trainning Concept','21 April 2015'),(4,'P001','Park Young Sun','DUDU IT','Seminar DEVS-based Modelling and Simulation','11 Mei 2015'),(5,'P001','Kwon Young Choi','ARES, Co.Ltd','Workshop How to Make 3D Object Models','28 Oktober 2015'),(6,'P001','Kwon Young Choi','ARES, Co.Ltd','Workshop Computer Graphics','3 Oktober 2015'),(7,'P001','Ismail Syah',NULL,'Menyongsong Kurikulum Berbasis KKNI','Mei 2016'),(8,'P001','Nurul Hiron','Universitas Siliwangi','Penyusunan Proposal Penelitian','Februari 2016'),(9,'P001','Kwon Young Choi','ARES, Co.Ltd','Seminar 3D Visualization with VR-Vantage','5 Oktober 2016'),(10,'P001','Park Young Sun','DUDU IT','Seminar Management Information System','2 November 2016'),(11,'P001','Joe Lian Min','Politeknik Negeri Bandung','Workshop Angular JS','7 Desember 2016'),(12,'P001','Park Young Sun','DUDU IT','Seminar Cyber Security','17 Januari 2017'),(13,'P001','Rida Hudaya','Workshop Robotic','Workshop Robotic','9 Februari 2017');

/*Table structure for table `kegiatan_dsn_ttp` */

DROP TABLE IF EXISTS `kegiatan_dsn_ttp`;

CREATE TABLE `kegiatan_dsn_ttp` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `jenis_kegiatan` varchar(100) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `sbg_penyaji` varchar(1) DEFAULT NULL,
  `sbg_peserta` varchar(1) DEFAULT NULL,
  KEY `FK_kegiatan_dsn_ttp` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kegiatan_dsn_ttp` */

insert  into `kegiatan_dsn_ttp`(`id_dosen`,`jenis_kegiatan`,`tempat`,`tahun`,`sbg_penyaji`,`sbg_peserta`) values ('1','Peningkatan Kemampuan Kapasitas Manajemen Keuangan Koperasi Tunas Harapan Berbasis Aplikasi Komputer','Kec. Sindang Kerta Kab. Bandung Barat','2014','v',NULL),('1','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('1','Pelatihan Penggunaan Microsoft Word Pada Ibu-Ibu PKK Desa Cileunyi Wetan','Kec. Cileunyi, Kab.Bandung','2014','v',NULL),('1','Pelatihan Penggunaan Microsoft Excel Pada Ibu-Ibu PKK Desa Cileunyi Wetan','Kec. Cileunyi, Kab.Bandung','2014','v',NULL),('1','Penggunaan Sistem Informasi Akuntansi Pada Koperasi Bako Wangun','Kec. Sindang Kerta Kab. Bandung Barat','2015','v',NULL),('1','Implementasi Sistem Informasi Pencatatan Data Keuanga Untuk Pengembang Koperasi Giri Waluya','Kec. Sindang Kerta Kab. Bandung Barat','2015','v',NULL),('1','Seminar Simulation Logic for Electronic ','Universitas Nasional Pasim','2015',NULL,'v'),('1','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('1','Seminar DEVS-based Modelling and ','Universitas Nasional Pasim','2015',NULL,'v'),('1','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('1','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('1','Peningkatan Efektivitas Pembuatan Surat dengan Menggunakan Microsoft Word Pada Ibu-Ibu PKK Desa Cile','Kec. Cileunyi, Kab.Bandung','2015','v',NULL),('1',' Peningkatan Efektivitas Pengolahan Data dengan Menggunakan Microsoft Excel Pada Ibu-Ibu PKK Desa Ci',NULL,NULL,NULL,NULL),('1','Pelatihan Pembuatan Surat dengan Mnggunakan Microsoft Word Pada Ibu-Ibu PKK Desa Cimekar','Kec. Cileunyi, Kab.Bandung','2015','v',NULL),('1','Implementasi Sistem Informasi Berbasis Komputer Untuk Pengembangan Koperasi Produsen Kopi Marga Muly','Kec. Sindang Kerta Kab. Bandung Barat','2016','v',NULL),('1','Pelatihan Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('1','Workshop Wargame Knowledge and Animation','Universitas Nasional Pasim','2016',NULL,'v'),('1','Penerapan Sistem Informasi Akuntansi Dalam Kegiatan Operasional Pada Koperasi Pilar Jaya','Kec. Sindang Kerta Kab. Bandung Barat','2016','v',NULL),('1','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('1','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('1','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('1','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('1','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('1','Pelatihan Pengolahan Data dengan Menggunakan Microsoft Excel Pada Ibu-Ibu PKK Desa Cimekar','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('1','Peningkatan Kemampuan Pembuatan Surat  Ibu-Ibu PKK Desa Cinunuk','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('1','Kegiatan Peningkatan Kemampuan Pengolahan Data Ibu-Ibu PKK Desa Cinunuk dengan Menggunakan Microsoft','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('1','Penerapan Microsoft Excel dalam Kegiatan Pengolahan Data pada ','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('1','Peningkatan Kemampuan Akuntansi Koperasi Wening Rahayu Berbasis Sistem Informasi','Kec. Sindang Kerta Kab. Bandung Barat','2017','v',NULL),('1','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('1','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v'),('1',' Pelatihan Penggunaan Microsoft Word Untuk Peningkatan Efektivitas Pembuatan Surat Pada Ibu-Ibu PKK ','Kec. Cileunyi, Kab.Bandung','2017','v',NULL),('1','Pelatihan Penggunaan Microsoft Excel Untuk Peningkatan Evektifitas Pengolahan Data pada Ibu-Ibu PKK ','Kec. Cileunyi, Kab.Bandung','2017','v',NULL),('2','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('2','Seminar Simulation Logic for Electronic ','Universitas Nasional Pasim','2015',NULL,'v'),('2','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('2','Seminar DEVS-based Modelling and Simulation','Universitas Nasional Pasim','2015',NULL,'v'),('2','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('2','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('2','Peningkatan Efektivitas Pembuatan Surat dengan Menggunakan Microsoft Word Pada Ibu-Ibu PKK Desa Cile','Kec. Cileunyi, Kab.Bandung','2015','v',NULL),('2','Kegiatan Peningkatan Kemampuan Pengolahan Data Ibu-Ibu PKK Desa Cinunuk dengan Menggunakan Microsoft','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('2','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('2','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('2','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('2','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('2','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('2',' Pelatihan Penggunaan Microsoft Word Untuk Peningkatan Efektivitas Pembuatan Surat Pada Ibu-Ibu PKK ','Kec. Cileunyi, Kab.Bandung','2017','v',NULL),('2','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('2','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v'),('4','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('4','Pelatihan Penggunaan Microsoft Excel Pada Ibu-Ibu PKK Desa Cileunyi Wetan','Kec. Cileunyi, Kab.Bandung','2014','v',NULL),('4','Pelatihan Pembuatan Surat dengan Mnggunakan Microsoft Word Pada Ibu-Ibu PKK Desa Cimekar','Kec. Cileunyi, Kab.Bandung','2015','v',NULL),('4','Seminar Simulation Logic for Electronic Warfare','Universitas Nasional Pasim','2015',NULL,'v'),('4','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('4','Seminar DEVS-based Modelling and Simulation','Universitas Nasional Pasim','2015',NULL,'v'),('4','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('4','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('4','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('4','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('4','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('4','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('4','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('4','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('4','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v'),('3','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('3','Peningkatan Efektivitas Pengolahan Data dengan Menggunakan Microsoft Excel Pada Ibu-Ibu PKK Desa Cil',NULL,NULL,NULL,NULL),('3','Seminar Simulation Logic for Electronic Warfare','Universitas Nasional Pasim','2015',NULL,'v'),('3','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('3','Seminar DEVS-based Modelling and Simulation','Universitas Nasional Pasim','2015',NULL,'v'),('3','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('3','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('3','Peningkatan Kemampuan Pengolahan Data Ibu-Ibu PKK Desa Cinunuk dengan Menggunakan Microsoft Excel','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('3','Penerapan Microsoft Word dalam Kegiatan Pembuatan Surat pada Ibu-Ibu PKK Desa Cibiru Wetan','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('3','Pelatihan Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('3','Workshop Wargame Knowledge and Animation','Universitas Nasional Pasim','2016',NULL,'v'),('3','Smart City For Advancing Society','Surabaya','2016',NULL,'v'),('3','International Conference On Ict For Smart Society','Surabaya','2016',NULL,'v'),('3','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('3','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('3','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('3','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('3','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('3','Certified Information Systems Security Professional (CISSP)','Jakarta','2017',NULL,'v'),('3','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('3','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v'),('5','Missile and Technical Site Equipment (TSE) under the Transfer of Technology Program of C705 Missile ','China','2014',NULL,'v'),('5','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('5','Radar Fundamentals','Bandung','2015',NULL,'v'),('5',' Peningkatan Efektivitas Pengolahan Data dengan Menggunakan Microsoft Excel Pada Ibu-Ibu PKK Desa Ci','Kec. Cileunyi, Kab.Bandung','2015','v',NULL),('5','Seminar Simulation Logic for Electronic Warfare','Universitas Nasional Pasim','2015',NULL,'v'),('5','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('5','Seminar DEVS-based Modelling and Simulation','Universitas Nasional Pasim','2015',NULL,'v'),('5','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('5','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('5','Peningkatan Kemampuan Pengolahan Data Ibu-Ibu PKK Desa Cinunuk dengan Menggunakan Microsoft Excel','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('5','Workshop Wargame Knowledge and Animation','Universitas Nasional Pasim','2016',NULL,'v'),('5','Workshop Sosialisasi Pengembangan Software','PT. Pasim Sentra Utama','2016','v',NULL),('5','Pelatihan Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('5','Having Duly Satisfied the C705 Missile Pratical Training and Having Fulfilled All Other Requirements','China','2016',NULL,'v'),('5','Military Avionics and Main Data Bus Interface Training','Boulogne-Billancourt','2016',NULL,'v'),('5','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('5','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('5','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('5','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('5','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('5','Peningkatan Kemampuan Akuntansi Koperasi Wening Rahayu Berbasis Sistem Informasi ','Kec. Sindang Kerta Kab. Bandung Barat','2017','v',NULL),('5','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('5','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v'),('6','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('6','Peningkatan Efektivitas Pengolahaan Data dengan Menggunakan Microsoft Excel pada Ibu-Ibu PKK Desa Ci','Kec. Cileunyi, Kab.Bandung','2015','v',NULL),('6','Seminar Simulation Logic for Electronic Warfare','Universitas Nasional Pasim','2015',NULL,'v'),('6','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('6','Seminar DEVS-based Modelling and Simulation','Universitas Nasional Pasim','2015',NULL,'v'),('6','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('6','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('6','Penerapan Microsoft Excel dalam Kegiatan Pengolahan Data pada ','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('6','Pelatihan Pengolahan Data dengan Menggunakan Microsoft Excel Pada Ibu-Ibu PKK Desa Cimekar','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('6','Pelatihan Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('6','Workshop Wargame Knowledge and Animation','Universitas Nasional Pasim','2016',NULL,'v'),('6','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('6','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('6','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('6','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('6','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('6','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('6','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v'),('7','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('7','Pelatihan Penggunaan Microsoft Word Pada Ibu-Ibu PKK Desa Cileunyi Wetan','Kec. Cileunyi, Kab.Bandung','2014','v',''),('7','Seminar Simulation Logic for Electronic Warfare','Universitas Nasional Pasim','2015',NULL,'v'),('7','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('7','Seminar DEVS-based Modelling and Simulation','Universitas Nasional Pasim','2015',NULL,'v'),('7','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('7','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('7','Workshop Wargame Knowledge and Animation','Universitas Nasional Pasim','2016',NULL,'v'),('7','Pelatihan Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('7','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('7','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('7','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('7','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('7','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('7','Peningkatan Kemampuan Pembuatan Surat  Ibu-Ibu PKK Desa Cinunuk','Kec. Cileunyi, Kab.Bandung','2016','v',''),('7','Pelatihan Penggunaan Microsoft Excel Untuk Peningkatan Evektifitas Pengolahan Data pada Ibu-Ibu PKK ',NULL,NULL,NULL,NULL),('7','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('7','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v'),('8','Workshop Visual Basic .Net','Universitas Nasional Pasim','2014',NULL,'v'),('8','Penggunaan Sistem Informasi Akuntansi Pada Koperasi Bako Wangun','Kec. Sindang Kerta Kab. Bandung Barat','2015','v',NULL),('8','Seminar Simulation Logic for Electronic Warfare','Universitas Nasional Pasim','2015',NULL,'v'),('8','Wargame Trainning Concept','Universitas Nasional Pasim','2015',NULL,'v'),('8','Seminar DEVS-based Modelling and Simulation','Universitas Nasional Pasim','2015',NULL,'v'),('8','Workshop How to Make 3D Object Models','Universitas Nasional Pasim','2015',NULL,'v'),('8','Workshop Computer Graphics','Universitas Nasional Pasim','2015',NULL,'v'),('8','Peningkatan Kemampuan Pembuatan Surat Ibu-Ibu PKK Desa Cinunuk dengan Menggunakan Microsoft Word','Kec. Cileunyi, Kab.Bandung','2016','v',NULL),('8','Menyongsong Kurikulum Berbasis KKNI','Universitas Nasional Pasim','2016',NULL,'v'),('8','Penyusunan Proposal Penelitian','Universitas Nasional Pasim','2016',NULL,'v'),('8','Seminar 3D Visualization with VR-Vantage','Universitas Nasional Pasim','2016',NULL,'v'),('8','Seminar Management Information System','Universitas Nasional Pasim','2016',NULL,'v'),('8','Workshop Angular JS','Universitas Nasional Pasim','2016',NULL,'v'),('8','Pelatihan Penggunaan Microsoft Excel Untuk Peningkatan Evektifitas Pengolahan Data pada Ibu-Ibu PKK ','Kec. Cileunyi, Kab.Bandung','2017','v',NULL),('8','Seminar Cyber Security','Universitas Nasional Pasim','2017',NULL,'v'),('8','Workshop Robotic','Universitas Nasional Pasim','2017',NULL,'v');

/*Table structure for table `kegiatan_pkm` */

DROP TABLE IF EXISTS `kegiatan_pkm`;

CREATE TABLE `kegiatan_pkm` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `kd_prodi` varchar(6) NOT NULL,
  `ts_2` int(3) DEFAULT NULL,
  `ts_1` int(3) DEFAULT NULL,
  `ts` int(3) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`),
  CONSTRAINT `FK_kegiatan_pkm` FOREIGN KEY (`kd_jns`) REFERENCES `sumber_biaya` (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `kegiatan_pkm` */

insert  into `kegiatan_pkm`(`kd_jns`,`kd_prodi`,`ts_2`,`ts_1`,`ts`) values (1,'',0,0,0),(2,'',NULL,NULL,0),(3,'',NULL,NULL,NULL),(4,'',6,6,5),(5,'',NULL,NULL,1);

/*Table structure for table `keikutsertaan_org` */

DROP TABLE IF EXISTS `keikutsertaan_org`;

CREATE TABLE `keikutsertaan_org` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `nm_organisasi` varchar(100) DEFAULT NULL,
  `thn_awal` int(4) DEFAULT NULL,
  `thn_akhir` int(4) DEFAULT NULL,
  `internasional` char(1) DEFAULT NULL,
  `nasional` char(1) DEFAULT NULL,
  `lokal` char(1) DEFAULT NULL,
  KEY `FK_keikutsertaan_org` (`id_dosen`),
  CONSTRAINT `FK_keikutsertaan_org` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `keikutsertaan_org` */

insert  into `keikutsertaan_org`(`id_dosen`,`nm_organisasi`,`thn_awal`,`thn_akhir`,`internasional`,`nasional`,`lokal`) values ('1','APTIKOM',2018,2019,NULL,'v',NULL),('2','APTIKOM',2018,2019,NULL,'v',NULL),('3','APTIKOM',2018,2019,NULL,'v',NULL),('4','APTIKOM',2018,2019,NULL,'v',NULL),('4','Ikatan Ahli Informatika Indonesia (IAII)',2016,2018,NULL,'v',NULL),('5','APTIKOM',2018,2019,NULL,'v',NULL);

/*Table structure for table `masastudi_ipk` */

DROP TABLE IF EXISTS `masastudi_ipk`;

CREATE TABLE `masastudi_ipk` (
  `kd_prodi` varchar(6) DEFAULT NULL,
  `rata_masa_std` double(3,1) DEFAULT NULL,
  `rata_ipk` double(3,2) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  KEY `FK_masastudi_ipk` (`kd_prodi`),
  CONSTRAINT `FK_masastudi_ipk` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `masastudi_ipk` */

insert  into `masastudi_ipk`(`kd_prodi`,`rata_masa_std`,`rata_ipk`,`keterangan`) values ('P001',3.2,3.59,NULL);

/*Table structure for table `mhs_reg_nonreg` */

DROP TABLE IF EXISTS `mhs_reg_nonreg`;

CREATE TABLE `mhs_reg_nonreg` (
  `kd_prog` int(2) DEFAULT NULL,
  `kd_mhs` int(2) DEFAULT NULL,
  `total_mhs` int(4) DEFAULT NULL,
  `kd_prodi` varchar(6) DEFAULT NULL,
  KEY `FK_prog` (`kd_prog`),
  KEY `FK_mhs` (`kd_mhs`),
  KEY `FK_prodi` (`kd_prodi`),
  CONSTRAINT `FK_mhs` FOREIGN KEY (`kd_mhs`) REFERENCES `jns_mhs` (`kd_jns`),
  CONSTRAINT `FK_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`),
  CONSTRAINT `FK_prog` FOREIGN KEY (`kd_prog`) REFERENCES `jns_program` (`kd_prog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mhs_reg_nonreg` */

/*Table structure for table `pembimbing_akd` */

DROP TABLE IF EXISTS `pembimbing_akd`;

CREATE TABLE `pembimbing_akd` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  `j_mhs_bimbingan` int(3) DEFAULT NULL,
  `rata2_pertemuan` int(3) DEFAULT NULL,
  KEY `FK_dsn_pembimbing_akd` (`id_dosen`),
  KEY `FK_pembimbing_akd` (`kd_prodi`),
  CONSTRAINT `FK_pembimbing_akd` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`),
  CONSTRAINT `FK_pembimbing_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembimbing_akd` */

insert  into `pembimbing_akd`(`id_dosen`,`kd_prodi`,`j_mhs_bimbingan`,`rata2_pertemuan`) values ('1','P001',18,3),('2','P001',18,3),('4','P001',18,3),('5','P001',17,3),('3','P001',17,3);

/*Table structure for table `pembimbing_skripsi` */

DROP TABLE IF EXISTS `pembimbing_skripsi`;

CREATE TABLE `pembimbing_skripsi` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  `jml_mhs` int(4) DEFAULT NULL,
  KEY `FK_pembimbing_skripsi` (`id_dosen`),
  KEY `FK_pembimbing_prodi` (`kd_prodi`),
  CONSTRAINT `FK_pembimbing` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`),
  CONSTRAINT `FK_pembimbing_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembimbing_skripsi` */

insert  into `pembimbing_skripsi`(`id_dosen`,`kd_prodi`,`jml_mhs`) values ('1','P001',5),('2','P001',5),('4','P001',4),('5','P001',6),('3','P001',6);

/*Table structure for table `penelitian_dosen` */

DROP TABLE IF EXISTS `penelitian_dosen`;

CREATE TABLE `penelitian_dosen` (
  `kd_jns` int(2) DEFAULT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  `ts_2` int(3) DEFAULT NULL,
  `ts_1` int(3) DEFAULT NULL,
  `ts` int(3) DEFAULT NULL,
  KEY `FK_penelitian_prodi` (`kd_prodi`),
  KEY `FK_penelitian_jns` (`kd_jns`),
  CONSTRAINT `FK_penelitian_jns` FOREIGN KEY (`kd_jns`) REFERENCES `sumber_biaya` (`kd_jns`),
  CONSTRAINT `FK_penelitian_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penelitian_dosen` */

insert  into `penelitian_dosen`(`kd_jns`,`kd_prodi`,`ts_2`,`ts_1`,`ts`) values (1,'P001',NULL,NULL,NULL),(2,'P001',4,4,5),(3,'P001',NULL,NULL,NULL),(4,'P001',6,5,4),(5,'P001',NULL,1,2);

/*Table structure for table `penggunaan_dana` */

DROP TABLE IF EXISTS `penggunaan_dana`;

CREATE TABLE `penggunaan_dana` (
  `kd_jns` int(2) DEFAULT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  `ts_2` double(10,2) DEFAULT NULL,
  `ts_1` double(10,2) DEFAULT NULL,
  `ts` double(10,2) DEFAULT NULL,
  KEY `FK_penggunaan_dana` (`kd_jns`),
  KEY `FK_penggunaan_prodi` (`kd_prodi`),
  CONSTRAINT `FK_penggunaan_dana` FOREIGN KEY (`kd_jns`) REFERENCES `jns_penggunaan` (`kd_jns`),
  CONSTRAINT `FK_penggunaan_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penggunaan_dana` */

insert  into `penggunaan_dana`(`kd_jns`,`kd_prodi`,`ts_2`,`ts_1`,`ts`) values (1,'P001',2298266.46,2466829.16,2920170.73),(2,'P001',59800.00,60700.00,65600.00),(3,'P001',40200.00,41300.00,50600.00),(4,'P001',1969942.68,2114424.99,2503003.49),(5,'P001',1313295.12,1409616.66,1668668.99),(6,'P001',656647.56,704808.33,834334.49),(7,'P001',NULL,NULL,NULL);

/*Table structure for table `pengisi_borang` */

DROP TABLE IF EXISTS `pengisi_borang`;

CREATE TABLE `pengisi_borang` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `kode_prodi` varchar(6) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `nidn` varchar(10) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `tgl_pengisian` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_prodi` (`kode_prodi`),
  CONSTRAINT `pengisi_borang_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `pengisi_borang` */

insert  into `pengisi_borang`(`id`,`kode_prodi`,`nama`,`nidn`,`jabatan`,`tgl_pengisian`) values (1,'P001','Erna Hikmawati, S. Kom., M. Kom','421089201','Ketua Program Studi D3 Manajemen Informatika','2017-09-08'),(2,'P001','Soleh Sabarudin, S. Kom., M. Kom','408097207','Sekretaris Program Studi D3 Manajemen Informatika','2017-09-08'),(3,'P001','Endang Mulyani, SE','122002078','Bagian HRD','2017-09-08'),(4,'P001','Sri Lestari, SPd','122006105','Sekretaris Rektorat','2017-09-08'),(5,'P001','Usman Rachman, Drs., MH','122017210','Ketua LPPM','2017-09-08'),(6,'P001','Abdul Holik. S.Fil.l., M.Si','422108502','Ketua Bidang Riset','2017-09-08'),(7,'P001','Sjamsuridjal, Ir., MM','403015301','Ketua Bidang Pengembangan','2017-09-08'),(8,'P001','H.Iwan Ernawan Astamoen,S.E.,MM','122000026','Ketua SPMI','2017-09-08'),(9,'P001','Lia Susana','122009137','Kepala Bagian Akademik','2017-09-08'),(10,'P001','Nina Rustiana','112003015','Kepala Bagian Keuangan','2017-09-08'),(11,'P001','Endri Hendrayana, SE','122013174','Kepala Bagian CRM dan Kemahasiswaan','2017-09-08'),(12,'P001','Rd. Norman Rizkianto','122010149','Bagian GA dan umum','2017-09-08'),(13,'P001','Ridwan Taufik, A.Ma. Pust, SE','122015203','Pustakawan','2017-09-08');

/*Table structure for table `perguruan_tinggi` */

DROP TABLE IF EXISTS `perguruan_tinggi`;

CREATE TABLE `perguruan_tinggi` (
  `kode_pt` varchar(6) NOT NULL DEFAULT '',
  `nama_pt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `perguruan_tinggi` */

insert  into `perguruan_tinggi`(`kode_pt`,`nama_pt`) values ('PT001','Universitas Nasional PASIM');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `role_id` int(3) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `permission` */

insert  into `permission`(`role_id`,`permission`) values (1,'admin'),(2,'akademik'),(3,'kaprodi'),(4,'GeneralAffair');

/*Table structure for table `perolehan_dana` */

DROP TABLE IF EXISTS `perolehan_dana`;

CREATE TABLE `perolehan_dana` (
  `id_dana` int(4) DEFAULT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  `jenis_dana` varchar(50) DEFAULT NULL,
  `ts_2` double(10,2) DEFAULT NULL,
  `ts_1` double(10,2) DEFAULT NULL,
  `ts` double(10,2) DEFAULT NULL,
  KEY `FK_perolehan_prodi` (`kd_prodi`),
  KEY `FK_perolehan_dana` (`id_dana`),
  CONSTRAINT `FK_perolehan_dana` FOREIGN KEY (`id_dana`) REFERENCES `sumber_dana` (`id_dana`),
  CONSTRAINT `FK_perolehan_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `perolehan_dana` */

insert  into `perolehan_dana`(`id_dana`,`kd_prodi`,`jenis_dana`,`ts_2`,`ts_1`,`ts`) values (1,'P001','Beasiswa Yayasan',823200.00,537600.00,529200.00),(1,'P001','Hibah Yayasan',5000000.00,5000000.00,0.00),(1,'P001','Hibah Unit Usaha ',75000.00,973050.00,7497529.50),(2,'P001','Pendaftaran',1250.00,2750.00,3250.00),(2,'P001','Biaya Registrasi',10750.00,23650.00,27950.00),(2,'P001','Biaya Kuliah',21000.00,46200.00,54600.00),(4,'P001','Alumni',1288884.00,1166953.00,1062653.00),(4,'P001','Hibah Penelitian',35800.00,39700.00,44600.00),(4,'P001','Hibah Pengabdian',40200.00,41300.00,50600.00);

/*Table structure for table `persentase_llsn` */

DROP TABLE IF EXISTS `persentase_llsn`;

CREATE TABLE `persentase_llsn` (
  `id_prodi` varchar(6) DEFAULT NULL,
  `persen` double(10,2) DEFAULT NULL,
  KEY `FK_persentase_llsn` (`id_prodi`),
  CONSTRAINT `FK_persentase_llsn` FOREIGN KEY (`id_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `persentase_llsn` */

insert  into `persentase_llsn`(`id_prodi`,`persen`) values ('P001',93.28);

/*Table structure for table `pkdt_tgs_belajar` */

DROP TABLE IF EXISTS `pkdt_tgs_belajar`;

CREATE TABLE `pkdt_tgs_belajar` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `jenjang_pend` varchar(10) DEFAULT NULL,
  `bid_studi` varchar(50) DEFAULT NULL,
  `perguruan_tinggi` varchar(50) DEFAULT NULL,
  `negara` varchar(50) DEFAULT NULL,
  `thn_mulai_std` varchar(4) DEFAULT NULL,
  KEY `FK_pkdt_tgs_belajar` (`id_dosen`),
  CONSTRAINT `FK_pkdt_tgs_belajar` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pkdt_tgs_belajar` */

insert  into `pkdt_tgs_belajar`(`id_dosen`,`jenjang_pend`,`bid_studi`,`perguruan_tinggi`,`negara`,`thn_mulai_std`) values ('4','S3','Elektro dan Informatika','Institut Teknologi Bandung','Indonesia','2017');

/*Table structure for table `prestasi_dosen` */

DROP TABLE IF EXISTS `prestasi_dosen`;

CREATE TABLE `prestasi_dosen` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `prestasi` varchar(50) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `internasional` varchar(1) DEFAULT NULL,
  `nasional` varchar(1) DEFAULT NULL,
  `lokal` varchar(1) DEFAULT NULL,
  KEY `FK_prestasi_dosen` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prestasi_dosen` */

/*Table structure for table `prodi_tbl` */

DROP TABLE IF EXISTS `prodi_tbl`;

CREATE TABLE `prodi_tbl` (
  `kode_prodi` varchar(6) NOT NULL,
  `kode_fakultas` varchar(6) DEFAULT NULL,
  `kode_pt` varchar(6) DEFAULT NULL,
  `prodi` varchar(30) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL,
  `no_sk_ps` varchar(15) DEFAULT NULL,
  `tgl_sk_ps` date DEFAULT NULL,
  `pjbt_ttd` varchar(30) DEFAULT NULL,
  `foto_sk_ps` varchar(30) DEFAULT NULL,
  `bln_mulai_ps` varchar(10) DEFAULT NULL,
  `thn_mulai_ps` int(4) DEFAULT NULL,
  `no_sk_opr` varchar(20) DEFAULT NULL,
  `tgl_sk_opr` date DEFAULT NULL,
  `foto_sk_opr` varchar(30) NOT NULL,
  `peringkat` varchar(1) DEFAULT NULL,
  `nilai` int(4) DEFAULT NULL,
  `no_sk_ban_pt` varchar(35) DEFAULT NULL,
  `alamat_ps` tinytext,
  `no_telp_ps` varchar(16) DEFAULT NULL,
  `no_fax_ps` varchar(16) DEFAULT NULL,
  `homepage_ps` varchar(20) DEFAULT NULL,
  `email_ps` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kode_prodi`),
  KEY `FK_fakultas` (`kode_fakultas`),
  KEY `FK_pt` (`kode_pt`),
  CONSTRAINT `FK_fakultas` FOREIGN KEY (`kode_fakultas`) REFERENCES `fakultas_tbl` (`kode_fakultas`) ON DELETE NO ACTION,
  CONSTRAINT `FK_pt` FOREIGN KEY (`kode_pt`) REFERENCES `perguruan_tinggi` (`kode_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prodi_tbl` */

insert  into `prodi_tbl`(`kode_prodi`,`kode_fakultas`,`kode_pt`,`prodi`,`jurusan`,`no_sk_ps`,`tgl_sk_ps`,`pjbt_ttd`,`foto_sk_ps`,`bln_mulai_ps`,`thn_mulai_ps`,`no_sk_opr`,`tgl_sk_opr`,`foto_sk_opr`,`peringkat`,`nilai`,`no_sk_ban_pt`,`alamat_ps`,`no_telp_ps`,`no_fax_ps`,`homepage_ps`,`email_ps`) values ('P001','F001','PT001','D3','Manajemen Informatika','114/D/O/2001','2001-10-02','A.n. Menteri Pendidikan Nasion',NULL,' Agustus',2001,'2248/D/T/K-IV/2009','2009-05-20','','C',265,'047/SK/BAN-PT/Ak-XII/Dpl-III/II/201','Jalan Dakota No. 8A Sukaraja-Bandung','022 - 6072803','022-20565099','www.pasim.ac.id ','mi@pasim.ac.id');

/*Table structure for table `pustaka` */

DROP TABLE IF EXISTS `pustaka`;

CREATE TABLE `pustaka` (
  `kd_jns` int(2) DEFAULT NULL,
  `jml_judul` int(4) DEFAULT NULL,
  `jml_copy` int(4) DEFAULT NULL,
  `kd_prodi` varchar(6) NOT NULL,
  KEY `FK_pustaka` (`kd_jns`),
  KEY `FK_pustaka_prodi` (`kd_prodi`),
  CONSTRAINT `FK_pustaka` FOREIGN KEY (`kd_jns`) REFERENCES `jns_pustaka` (`kd_jns`),
  CONSTRAINT `FK_pustaka_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pustaka` */

insert  into `pustaka`(`kd_jns`,`jml_judul`,`jml_copy`,`kd_prodi`) values (1,620,670,'P001'),(2,20,60,'P001'),(3,4,4,'P001'),(4,2,NULL,'P001'),(5,12,NULL,'P001'),(6,12,NULL,'P001');

/*Table structure for table `sdm` */

DROP TABLE IF EXISTS `sdm`;

CREATE TABLE `sdm` (
  `kd_hal` int(3) DEFAULT NULL,
  `total` int(5) DEFAULT NULL,
  `kd_prodi` varchar(6) DEFAULT NULL,
  `jml` int(3) DEFAULT NULL,
  KEY `FK_hal` (`kd_hal`),
  KEY `FK_sdm` (`kd_prodi`),
  CONSTRAINT `FK_hal` FOREIGN KEY (`kd_hal`) REFERENCES `jns_hal` (`kd_hal`),
  CONSTRAINT `FK_sdm` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sdm` */

insert  into `sdm`(`kd_hal`,`total`,`kd_prodi`,`jml`) values (1,5,'P001',5),(2,1,'P001',1),(3,0,'P001',NULL),(4,0,'P001',NULL),(5,1,'P001',1),(6,7,'P001',7),(7,0,'P001',NULL);

/*Table structure for table `struktur_kurikulum` */

DROP TABLE IF EXISTS `struktur_kurikulum`;

CREATE TABLE `struktur_kurikulum` (
  `kd_prodi` varchar(6) NOT NULL,
  `kode_mk` varchar(8) NOT NULL,
  `jns_mk` int(1) NOT NULL,
  `smt` int(3) DEFAULT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `sks_kuliah` int(3) DEFAULT NULL,
  `sks_praktek` int(3) DEFAULT NULL,
  `sks_inti` varchar(1) DEFAULT NULL,
  `sks_institusi` varchar(1) DEFAULT NULL,
  `bobot_tgs` varchar(1) DEFAULT NULL,
  `deskripsi` varchar(1) DEFAULT NULL,
  `silabus` varchar(1) DEFAULT NULL,
  `sap` varchar(1) DEFAULT NULL,
  `penyelenggara` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_mk`),
  KEY `FK_struktur_kurikulum` (`jns_mk`),
  KEY `FK_prodi_struktur` (`kd_prodi`),
  CONSTRAINT `FK_prodi_struktur` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`),
  CONSTRAINT `FK_struktur_kurikulum` FOREIGN KEY (`jns_mk`) REFERENCES `jns_matkul` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `struktur_kurikulum` */

insert  into `struktur_kurikulum`(`kd_prodi`,`kode_mk`,`jns_mk`,`smt`,`nama_mk`,`sks_kuliah`,`sks_praktek`,`sks_inti`,`sks_institusi`,`bobot_tgs`,`deskripsi`,`silabus`,`sap`,`penyelenggara`) values ('P001','MKB1001',1,1,'Komputer Grafis',NULL,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB1002',1,1,'Logika dan Algoritma',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB1003',1,1,'Pengelolaan Instalasi Komputer',1,1,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB1004',1,1,'Pengenalan Pengolahan Data Elektronik',1,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB2005',1,2,'Basis Data ',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB2006',1,2,'Pemrograman C ',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB2007',1,2,'Pemrograman VB.Net',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB2008',1,2,'Struktur Data',1,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB3009',1,3,'Animasi ',NULL,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB3010',1,3,'Pemrograman C++ ',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB3011',1,3,'Pemrograman .Net Lanjutan',NULL,3,'v','','v','v','v','v','Jurusan'),('P001','MKB4012',1,4,'Web Interface Design',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB4013',1,4,'Sistem Operasi ',1,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB5014',1,5,'Web Database Development',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB5015',1,5,'Pemrograman Java',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB5016',1,5,'Kerja Praktek',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB6017',1,6,'Kewirausahaan',1,1,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB6018',1,6,'Mobile Programming',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB6019',1,6,'Tugas Akhir',NULL,4,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKB6020',1,6,'Networking',NULL,3,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK1001',1,1,'Dasar Akuntansi I',3,NULL,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK1002',1,1,'Kalkulus',3,NULL,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK1003',1,1,'Pengantar Bisnis ',2,NULL,'v','','v','v','v','v','Jurusan'),('P001','MKK2004',1,2,'Aljabar Linier',3,NULL,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK2005',1,2,'Dasar Akuntansi II',1,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK3006',1,3,'Manajemen Umum ',1,NULL,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK3007',1,3,'Rekayasa Perangkat Lunak',1,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK3008',1,3,'Manajemen Keuangan',3,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK4009',1,4,'Matematika Diskrit',3,0,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK4010',1,4,'Sistem Informasi Manajemen',1,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK4011',1,4,'Interaksi Manusia dan Komputer',1,2,NULL,'v','v','v','v','v','Jurusan'),('P001','MKK5012',1,5,'Analisis dan Perancangan Sistem ',1,2,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK5013',1,5,'Statistika Deskriptif',3,NULL,'v',NULL,'v','v','v','v','Jurusan'),('P001','MKK5014',1,5,'Teknik Proyeksi Bisnis ',1,1,NULL,'v','v','v','v','v','Jurusan'),('P001','MKK6015',1,6,'Topik Khusus SIM',2,NULL,NULL,'v','v','v','v','v','Jurusan'),('P001','MPB1001',1,2,'Etika Profesi',2,NULL,'v','','v','v','v','v','Jurusan'),('P001','MPK1001',1,1,'Bahasa Indonesia',2,NULL,NULL,'v','v','v','v','v','Jurusan'),('P001','MPK2002',1,2,'Pendidikan Pancasila dan Kewarganegaraan',2,NULL,'v',NULL,'v','v','v','v','Jurusan'),('P001','MPK3003',1,3,'General English ',2,NULL,NULL,'v','v','v','v','v','Jurusan'),('P001','MPK3004',1,3,'Pendidikan Agama',2,NULL,'v',NULL,'v','v','v','v','Jurusan'),('P001','MPK4005',1,4,'Ilmu Budaya Dasar',2,NULL,NULL,'v','v','v','v','v','Jurusan'),('P001','MPK4006',1,4,'Writing for Business Letter',NULL,2,NULL,'v','v','v','v','v','Jurusan'),('P001','MPK5007',1,5,'Speaking for Presentation',NULL,2,NULL,'v','v','v','v','v','Jurusan'),('P001','MPK6008',1,6,'TOEFL',NULL,2,NULL,'v','v','v','v','v','Jurusan');

/*Table structure for table `sumber_biaya` */

DROP TABLE IF EXISTS `sumber_biaya`;

CREATE TABLE `sumber_biaya` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `jns_sumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `sumber_biaya` */

insert  into `sumber_biaya`(`kd_jns`,`jns_sumber`) values (1,'Pembiayaan sendiri'),(2,'PT yang bersangkutan'),(3,'Kemristekdikti'),(4,'Institusi dalam negeri di luar'),(5,'Institusi luar negeri');

/*Table structure for table `sumber_dana` */

DROP TABLE IF EXISTS `sumber_dana`;

CREATE TABLE `sumber_dana` (
  `id_dana` int(2) NOT NULL AUTO_INCREMENT,
  `sumber_dana` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_dana`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `sumber_dana` */

insert  into `sumber_dana`(`id_dana`,`sumber_dana`) values (1,'Usaha Sendiri'),(2,'Mahasiswa'),(3,'Pemerintah'),(4,'Sumber Lain');

/*Table structure for table `tenaga_kepend` */

DROP TABLE IF EXISTS `tenaga_kepend`;

CREATE TABLE `tenaga_kepend` (
  `kode_prodi` varchar(6) DEFAULT NULL,
  `kd_jns` int(3) DEFAULT NULL,
  `s3` int(3) DEFAULT NULL,
  `s2` int(3) DEFAULT NULL,
  `s1` int(3) DEFAULT NULL,
  `d4` int(3) DEFAULT NULL,
  `d3` int(3) DEFAULT NULL,
  `d2` int(3) DEFAULT NULL,
  `d1` int(3) DEFAULT NULL,
  `sma` int(3) DEFAULT NULL,
  `unit_kerja` varchar(30) DEFAULT NULL,
  KEY `FK_tenaga_kepend` (`kode_prodi`),
  KEY `FK_jenis` (`kd_jns`),
  CONSTRAINT `FK_jenis` FOREIGN KEY (`kd_jns`) REFERENCES `jns_tng_kepend` (`kd_jns`),
  CONSTRAINT `FK_tenaga_kepend` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenaga_kepend` */

insert  into `tenaga_kepend`(`kode_prodi`,`kd_jns`,`s3`,`s2`,`s1`,`d4`,`d3`,`d2`,`d1`,`sma`,`unit_kerja`) values ('P001',1,NULL,NULL,1,NULL,1,1,NULL,NULL,'Universitas'),('P001',2,NULL,NULL,2,NULL,2,NULL,NULL,NULL,'Program Studi'),('P001',3,NULL,NULL,2,NULL,3,NULL,NULL,NULL,'Program Studi'),('P001',4,NULL,NULL,1,NULL,NULL,NULL,NULL,7,'Universitas');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users` (`role_id`),
  CONSTRAINT `FK_users` FOREIGN KEY (`role_id`) REFERENCES `permission` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role_id`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3',1),(2,'akademik','0b5652714faf87700d60a912f753cc55',2),(3,'kaprodi','3c13922905d2bc454cc35e665335e2fd',3),(4,'GeneralAffair','32d7508fe69220cb40af28441ef746d9',4);

/*Table structure for table `waktu_prpbm` */

DROP TABLE IF EXISTS `waktu_prpbm`;

CREATE TABLE `waktu_prpbm` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kd_prodi` varchar(6) DEFAULT NULL,
  `teori` int(6) DEFAULT NULL,
  `praktek` int(6) DEFAULT NULL,
  `praktikum` int(6) DEFAULT NULL,
  `pkl` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_waktu_prpbm` (`kd_prodi`),
  CONSTRAINT `FK_waktu_prpbm` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `waktu_prpbm` */

insert  into `waktu_prpbm`(`id`,`kd_prodi`,`teori`,`praktek`,`praktikum`,`pkl`) values (1,'P001',613,1600,293,180);

/*Table structure for table `wkt_tunggu_llsn` */

DROP TABLE IF EXISTS `wkt_tunggu_llsn`;

CREATE TABLE `wkt_tunggu_llsn` (
  `id_prodi` varchar(6) DEFAULT NULL,
  `waktu` double(10,2) DEFAULT NULL,
  KEY `FK_wkt_tunggu_llsn` (`id_prodi`),
  CONSTRAINT `FK_wkt_tunggu_llsn` FOREIGN KEY (`id_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wkt_tunggu_llsn` */

insert  into `wkt_tunggu_llsn`(`id_prodi`,`waktu`) values ('P001',0.11);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
