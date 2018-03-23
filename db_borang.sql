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
  `manual` varchar(1) DEFAULT NULL,
  `komp_tnp_jar` varchar(1) DEFAULT NULL,
  `lan` varchar(1) DEFAULT NULL,
  `wan` varchar(1) DEFAULT NULL,
  KEY `FK_aksesbilitas_data` (`kd_jns`),
  CONSTRAINT `FK_aksesbilitas_data` FOREIGN KEY (`kd_jns`) REFERENCES `jns_data` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aksesbilitas_data` */

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

/*Table structure for table `aktivitas_mengajar` */

DROP TABLE IF EXISTS `aktivitas_mengajar`;

CREATE TABLE `aktivitas_mengajar` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `bid_keahlian` varchar(50) DEFAULT NULL,
  `kode_mk` varchar(8) DEFAULT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `jum_kls` int(3) DEFAULT NULL,
  `jp_rencana` int(3) DEFAULT NULL,
  `jp_dilaksanakan` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aktivitas_mengajar` */

/*Table structure for table `artikel_ilmiah` */

DROP TABLE IF EXISTS `artikel_ilmiah`;

CREATE TABLE `artikel_ilmiah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) DEFAULT NULL,
  `nama_dosen` varchar(50) DEFAULT NULL,
  `dipublikasikan` varchar(30) DEFAULT NULL,
  `thn_publikasi` int(4) DEFAULT NULL,
  `lokal` varchar(1) DEFAULT NULL,
  `nasional` varchar(1) DEFAULT NULL,
  `internasional` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `artikel_ilmiah` */

/*Table structure for table `dana_penelitian` */

DROP TABLE IF EXISTS `dana_penelitian`;

CREATE TABLE `dana_penelitian` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tahun` int(4) DEFAULT NULL,
  `judul_penelitian` varchar(100) DEFAULT NULL,
  `sumber_dana` varchar(50) DEFAULT NULL,
  `jml_dana` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dana_penelitian` */

/*Table structure for table `dana_pengmas` */

DROP TABLE IF EXISTS `dana_pengmas`;

CREATE TABLE `dana_pengmas` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tahun` int(4) DEFAULT NULL,
  `judul_kegiatan` varchar(100) DEFAULT NULL,
  `sumber_dana` varchar(50) DEFAULT NULL,
  `jumlah_dana` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dana_pengmas` */

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

/*Table structure for table `data_dosen` */

DROP TABLE IF EXISTS `data_dosen`;

CREATE TABLE `data_dosen` (
  `kode_prodi` varchar(6) DEFAULT NULL,
  `id_dosen` varchar(6) DEFAULT NULL,
  KEY `FK_data_dosen` (`kode_prodi`),
  KEY `FK_dosen` (`id_dosen`),
  CONSTRAINT `FK_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`),
  CONSTRAINT `FK_data_dosen` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data_dosen` */

/*Table structure for table `dosen_tbl` */

DROP TABLE IF EXISTS `dosen_tbl`;

CREATE TABLE `dosen_tbl` (
  `id_dosen` varchar(6) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `tgl_lhr` date NOT NULL,
  `kd_jab` varchar(4) DEFAULT NULL,
  `kd_jns` int(1) DEFAULT NULL,
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
  PRIMARY KEY (`id_dosen`),
  KEY `FK_jns` (`kd_jns`),
  CONSTRAINT `FK_jns` FOREIGN KEY (`kd_jns`) REFERENCES `jns_dosen` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dosen_tbl` */

/*Table structure for table `dt_mhs_nonreg` */

DROP TABLE IF EXISTS `dt_mhs_nonreg`;

CREATE TABLE `dt_mhs_nonreg` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_prodi` varchar(6) NOT NULL,
  `id_ts` int(4) DEFAULT NULL,
  `dy_tampung` int(5) DEFAULT NULL,
  `jc_mhs_ikt_seleksi` int(5) DEFAULT NULL,
  `jc_mhs_lls_seleksi` int(5) DEFAULT NULL,
  `j_maba_nonreg` int(5) DEFAULT NULL,
  `j_maba_trf` int(5) DEFAULT NULL,
  `j_tot_mhs_nonreg` int(5) DEFAULT NULL,
  `j_tot_mhs_trf` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dt_mhs_nonreg` (`id_ts`),
  CONSTRAINT `FK_dt_mhs_nonreg` FOREIGN KEY (`id_ts`) REFERENCES `tahun_akd` (`id_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dt_mhs_nonreg` */

/*Table structure for table `dt_mhs_reg` */

DROP TABLE IF EXISTS `dt_mhs_reg`;

CREATE TABLE `dt_mhs_reg` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_prodi` varchar(6) NOT NULL,
  `id_ts` int(4) DEFAULT NULL,
  `dy_tampung` int(5) DEFAULT NULL,
  `jc_mhs_ikt_seleksi` int(5) DEFAULT NULL,
  `jc_mhs_lls_seleksi` int(5) DEFAULT NULL,
  `j_maba_reg_bkn_trf` int(5) DEFAULT NULL,
  `j_maba_trf` int(5) DEFAULT NULL,
  `j_tot_reg_bkn_trf` int(5) DEFAULT NULL,
  `j_tot_trf` int(5) DEFAULT NULL,
  `j_llsn_reg_bkn_trf` int(5) DEFAULT NULL,
  `j_llsn_trf` int(5) DEFAULT NULL,
  `ipk_min` decimal(2,0) DEFAULT NULL,
  `ipk_rat` decimal(2,0) DEFAULT NULL,
  `ipk_mak` decimal(2,0) DEFAULT NULL,
  `prsn_ipk_1` decimal(2,0) DEFAULT NULL,
  `prsn_ipk_2` decimal(2,0) DEFAULT NULL,
  `prsn_ipk_3` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dt_mhs_reg` (`id_ts`),
  CONSTRAINT `FK_dt_mhs_reg` FOREIGN KEY (`id_ts`) REFERENCES `tahun_akd` (`id_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `dt_mhs_reg` */

insert  into `dt_mhs_reg`(`id`,`id_prodi`,`id_ts`,`dy_tampung`,`jc_mhs_ikt_seleksi`,`jc_mhs_lls_seleksi`,`j_maba_reg_bkn_trf`,`j_maba_trf`,`j_tot_reg_bkn_trf`,`j_tot_trf`,`j_llsn_reg_bkn_trf`,`j_llsn_trf`,`ipk_min`,`ipk_rat`,`ipk_mak`,`prsn_ipk_1`,`prsn_ipk_2`,`prsn_ipk_3`) values (1,'P001',7,65,1016,60,59,0,139,0,41,0,'2','3','3','0','3','76'),(2,'P001',6,65,1014,40,39,0,139,0,41,0,'3','3','3','0','5','95'),(3,'P001',5,65,992,45,43,0,201,0,37,0,'3','3','3','0','6','94'),(4,'P001',4,65,2800,65,62,0,221,0,25,0,'3','3','3','0','32','68'),(5,'P001',3,50,1160,46,45,0,192,0,33,0,'2','3','3','0','39','61');

/*Table structure for table `dt_ruang_dosen` */

DROP TABLE IF EXISTS `dt_ruang_dosen`;

CREATE TABLE `dt_ruang_dosen` (
  `id_jns` int(2) NOT NULL AUTO_INCREMENT,
  `jml_ruang` int(3) DEFAULT NULL,
  `jml_luas` int(3) DEFAULT NULL,
  UNIQUE KEY `id_jns` (`id_jns`),
  CONSTRAINT `FK_dt_ruang_dosen` FOREIGN KEY (`id_jns`) REFERENCES `ruang_dosen` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dt_ruang_dosen` */

/*Table structure for table `evaluasi_lulusan` */

DROP TABLE IF EXISTS `evaluasi_lulusan`;

CREATE TABLE `evaluasi_lulusan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_prodi` varchar(6) NOT NULL,
  `id_kemampuan` int(4) DEFAULT NULL,
  `sangat_baik` decimal(2,0) DEFAULT NULL,
  `baik` decimal(2,0) DEFAULT NULL,
  `cukup` decimal(2,0) DEFAULT NULL,
  `kurang` decimal(2,0) DEFAULT NULL,
  `rencana` tinytext,
  PRIMARY KEY (`id`),
  KEY `FK_evaluasi_lulusan` (`id_kemampuan`),
  CONSTRAINT `FK_evaluasi_lulusan` FOREIGN KEY (`id_kemampuan`) REFERENCES `jns_kemampuan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `evaluasi_lulusan` */

insert  into `evaluasi_lulusan`(`id`,`id_prodi`,`id_kemampuan`,`sangat_baik`,`baik`,`cukup`,`kurang`,`rencana`) values (1,'P001',1,'84','15','0','0','memberikan muatan etika dan moral pada materi kurikulum program studi (mata kuliah etika profesi),\r\nmenyelenggarakan kegiatan pembinaan oleh koordinator beasiswa PUB,\r\nmenyelenggaraakan mentoring setiap minggu'),(2,'P001',2,'91','8','0','0','Mengadakan pelatihan yang berkaitan dengan pemrograman,Mengadakan bootcamp (pelatihan) untuk persiapan dunia kerja'),(3,'P001',3,'66','17','16','0','Mnyelenggarakan mata kuliah TOEFL, Mengadakan kegiatan English club, Mengadakan pelatihan public speaking, Mengadakan kegiatan pelatihan bahasa inggris yang bekerja sama dengan program studi D3 Bahasa Inggris'),(4,'P001',4,'85','14','0','0','Penyediaan sarana laboratorium komputer yang memadai, Mendorong dosen untuk memanfaatkan teknologi informasi dalam proses pembelajaran, Penggunaan aplikasi IT untuk layanan mahasiswa (digital campus)'),(5,'P001',5,'80','12','6','0','Mengadakan pelatihan public speaking, Memperbanyak tugas pembuatan laporan ilmiah (untuk meningkatkan kemampuan komunikasi tertulis), Memperbanyak presentasi/diskusi dalam kelas (untuk meningkatkan kemampuan komunikasi secara lisan)'),(6,'P001',6,'79','11','9','0','Memperbanyak pemberian tugas yang harus dikerjakan dan dipresentasikan secara kelompok, Mengadakan kegiatan Latihan Dasar Kepemimpinan Mahasiswa (LDKM)'),(7,'P001',7,'91','8','0','0','Mengikutsertakan mahasiswa dalam berbagai kegiatan UKM dan kepengurusan PUB sehingga dapat mengembangkan potensi yang dimiliki oleh mahasiswa tersebut');

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
  `id_prodi` varchar(6) DEFAULT NULL,
  `id_ts` int(3) DEFAULT NULL,
  `j_lulusan_wsd` int(5) DEFAULT NULL,
  `instansi` varchar(50) DEFAULT NULL,
  `j_lulusan_psn` int(3) DEFAULT NULL,
  `j_lulusan_terima` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_instansi_lulusan` (`id_prodi`),
  KEY `FK_ts` (`id_ts`),
  CONSTRAINT `FK_ts` FOREIGN KEY (`id_ts`) REFERENCES `tahun_akd` (`id_ts`),
  CONSTRAINT `FK_instansi_lulusan` FOREIGN KEY (`id_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `instansi_lulusan` */

insert  into `instansi_lulusan`(`id`,`id_prodi`,`id_ts`,`j_lulusan_wsd`,`instansi`,`j_lulusan_psn`,`j_lulusan_terima`) values (1,'P001',3,33,'PT. Pasim Sentra Utama',5,5),(2,'P001',3,33,'CV. Zharfan Dwi Putra',3,2),(3,'P001',4,25,'PT. Pasim Sentra Utama',5,4),(4,'P001',4,25,'CV. Zharfan Dwi Putra',2,1),(5,'P001',4,25,'PT. Sonitacitra Buanamandiri',3,3),(6,'P001',5,37,'PT. Pasim Sentra Utama',5,3),(7,'P001',5,37,'PT. Duta Berlian Nusantara',2,2),(8,'P001',5,37,'PT. Kalysa Intijaya Sakti',3,2),(9,'P001',5,37,'PT. Sonitacitra Buanamandiri',3,3),(10,'P001',6,41,'PT. Pasim Sentra Utama',8,8),(11,'P001',6,41,'PT. PUB Pasim Putra',3,3),(12,'P001',6,41,'PT. Kalysa Intijaya Sakti',3,3),(13,'P001',6,41,'PT. Stafalindo Menara Nusantara',2,2),(14,'P001',6,41,'PT. Virginindo Utama Karya',2,1),(15,'P001',7,41,'PT. Pasim Sentra Utama',5,4),(16,'P001',7,41,'PT. Valanino Rajawali Perkasa',5,4),(17,'P001',7,41,'PT. Duta Berlian Nusantara',4,4),(18,'P001',7,41,'PT. Kalysa Intijaya Sakti',2,2),(19,'P001',7,41,'PT. Sonitacitra Buanamandiri',4,3),(20,'P001',7,41,'Yayasan Robo Pasim Global Internusa',3,3);

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

/*Table structure for table `jns_data` */

DROP TABLE IF EXISTS `jns_data`;

CREATE TABLE `jns_data` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `jns_data` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_data` */

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
  `hal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kd_hal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_hal` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_matkul` */

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
  `jns_penggunaan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_penggunaan` */

/*Table structure for table `jns_program` */

DROP TABLE IF EXISTS `jns_program`;

CREATE TABLE `jns_program` (
  `kd_prog` int(2) NOT NULL AUTO_INCREMENT,
  `jns_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_prog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_program` */

/*Table structure for table `jns_pustaka` */

DROP TABLE IF EXISTS `jns_pustaka`;

CREATE TABLE `jns_pustaka` (
  `kd_jns` int(3) NOT NULL AUTO_INCREMENT,
  `jns_pustaka` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_pustaka` */

/*Table structure for table `jns_tng_kepend` */

DROP TABLE IF EXISTS `jns_tng_kepend`;

CREATE TABLE `jns_tng_kepend` (
  `kd_jns` int(3) NOT NULL AUTO_INCREMENT,
  `jns_tng_kepend` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jns_tng_kepend` */

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

/*Table structure for table `keahlian_dosen` */

DROP TABLE IF EXISTS `keahlian_dosen`;

CREATE TABLE `keahlian_dosen` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `gelar` varchar(30) DEFAULT NULL,
  `pengakuan` varchar(50) DEFAULT NULL,
  `bid_keahlian` varchar(100) DEFAULT NULL,
  KEY `FK_keahlian_dosen` (`id_dosen`),
  CONSTRAINT `FK_keahlian_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `keahlian_dosen` */

/*Table structure for table `kegiatan_dsn_ttp` */

DROP TABLE IF EXISTS `kegiatan_dsn_ttp`;

CREATE TABLE `kegiatan_dsn_ttp` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `jenis_kegiatan` varchar(100) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `sbg_penyaji` varchar(1) DEFAULT NULL,
  `sbg_peserta` varchar(1) DEFAULT NULL,
  KEY `FK_kegiatan_dsn_ttp` (`id_dosen`),
  CONSTRAINT `FK_kegiatan_dsn_ttp` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kegiatan_dsn_ttp` */

/*Table structure for table `kegiatan_pakar` */

DROP TABLE IF EXISTS `kegiatan_pakar`;

CREATE TABLE `kegiatan_pakar` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama_pakar` varchar(50) DEFAULT NULL,
  `instansi` varchar(50) DEFAULT NULL,
  `judul_keg` varchar(100) DEFAULT NULL,
  `pelaksanaan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kegiatan_pakar` */

/*Table structure for table `kegiatan_pkm` */

DROP TABLE IF EXISTS `kegiatan_pkm`;

CREATE TABLE `kegiatan_pkm` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `ts_2` int(3) DEFAULT NULL,
  `ts_1` int(3) DEFAULT NULL,
  `ts` int(3) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`),
  CONSTRAINT `FK_kegiatan_pkm` FOREIGN KEY (`kd_jns`) REFERENCES `sumber_biaya` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kegiatan_pkm` */

/*Table structure for table `keikutsertaan_org` */

DROP TABLE IF EXISTS `keikutsertaan_org`;

CREATE TABLE `keikutsertaan_org` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `nm_organisasi` varchar(50) DEFAULT NULL,
  `th_awal` varchar(4) DEFAULT NULL,
  `th_akhir` varchar(4) DEFAULT NULL,
  `internasional` varchar(1) DEFAULT NULL,
  `nasional` varchar(1) DEFAULT NULL,
  `lokal` varchar(1) DEFAULT NULL,
  KEY `FK_keikutsertaan_org` (`id_dosen`),
  CONSTRAINT `FK_keikutsertaan_org` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `keikutsertaan_org` */

/*Table structure for table `masastudi_ipk` */

DROP TABLE IF EXISTS `masastudi_ipk`;

CREATE TABLE `masastudi_ipk` (
  `kd_prodi` varchar(6) DEFAULT NULL,
  `rata_masa_std` decimal(1,0) DEFAULT NULL,
  `rata_ipk` decimal(2,0) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  KEY `FK_masastudi_ipk` (`kd_prodi`),
  CONSTRAINT `FK_masastudi_ipk` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `masastudi_ipk` */

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
  CONSTRAINT `FK_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`),
  CONSTRAINT `FK_mhs` FOREIGN KEY (`kd_mhs`) REFERENCES `jns_mhs` (`kd_jns`),
  CONSTRAINT `FK_prog` FOREIGN KEY (`kd_prog`) REFERENCES `jns_program` (`kd_prog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mhs_reg_nonreg` */

/*Table structure for table `pembimbing_akd` */

DROP TABLE IF EXISTS `pembimbing_akd`;

CREATE TABLE `pembimbing_akd` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `j_mhs_bimbingan` int(3) DEFAULT NULL,
  `rata2_pertemuan` int(3) DEFAULT NULL,
  KEY `FK_dsn_pembimbing_akd` (`id_dosen`),
  CONSTRAINT `FK_dsn_pembimbing_akd` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembimbing_akd` */

/*Table structure for table `pembimbing_skripsi` */

DROP TABLE IF EXISTS `pembimbing_skripsi`;

CREATE TABLE `pembimbing_skripsi` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `jml_mhs` int(4) DEFAULT NULL,
  KEY `FK_pembimbing_skripsi` (`id_dosen`),
  CONSTRAINT `FK_pembimbing_skripsi` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembimbing_skripsi` */

/*Table structure for table `penelitian_dosen` */

DROP TABLE IF EXISTS `penelitian_dosen`;

CREATE TABLE `penelitian_dosen` (
  `kd_jns` int(2) DEFAULT NULL,
  `ts_2` int(3) DEFAULT NULL,
  `ts_1` int(3) DEFAULT NULL,
  `ts` int(3) DEFAULT NULL,
  KEY `FK_penelitian_dosen` (`kd_jns`),
  CONSTRAINT `FK_penelitian_dosen` FOREIGN KEY (`kd_jns`) REFERENCES `sumber_biaya` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penelitian_dosen` */

/*Table structure for table `penggunaan_dana` */

DROP TABLE IF EXISTS `penggunaan_dana`;

CREATE TABLE `penggunaan_dana` (
  `kd_jns` int(2) DEFAULT NULL,
  `ts_2` decimal(2,0) DEFAULT NULL,
  `ts_1` decimal(2,0) DEFAULT NULL,
  `ts` decimal(2,0) DEFAULT NULL,
  KEY `FK_penggunaan_dana` (`kd_jns`),
  CONSTRAINT `FK_penggunaan_dana` FOREIGN KEY (`kd_jns`) REFERENCES `jns_penggunaan` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penggunaan_dana` */

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

insert  into `pengisi_borang`(`id`,`kode_prodi`,`nama`,`nidn`,`jabatan`,`tgl_pengisian`) values (1,'P001','Erna Hikmawati, S. Kom., M. Kom','421089201','Ketua Program Studi D3 Manajemen Informatika','2017-09-08'),(2,'P001','Soleh Sabarudin, S. Kom., M. Kom','408097207','Sekretaris Program Studi D3 Manajemen Informatika','2017-09-08'),(3,'P001','Endang Mulyani, SE','122002078','Bagian HRD','2017-09-08'),(4,NULL,'Sri Lestari, SPd','122006105','Sekretaris Rektorat','0000-00-00'),(5,NULL,'Usman Rachman, Drs., MH','122017210','Ketua LPPM','0000-00-00'),(6,NULL,'Abdul Holik. S.Fil.l., M.Si','422108502','Ketua Bidang Riset','0000-00-00'),(7,NULL,'Sjamsuridjal, Ir., MM','403015301','Ketua Bidang Pengembangan','0000-00-00'),(8,NULL,'H.Iwan Ernawan Astamoen,S.E.,MM','122000026','Ketua SPMI','0000-00-00'),(9,NULL,'Lia Susana','122009137','Kepala Bagian Akademik','0000-00-00'),(10,NULL,'Nina Rustiana','112003015','Kepala Bagian Keuangan','0000-00-00'),(11,NULL,'Endri Hendrayana, SE','122013174','Kepala Bagian CRM dan Kemahasiswaan','0000-00-00'),(12,NULL,'Rd. Norman Rizkianto','122010149','Bagian GA dan umum','0000-00-00'),(13,NULL,'Ridwan Taufik, A.Ma. Pust, SE','122015203','Pustakawan','0000-00-00');

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
  `role_id` int(3) DEFAULT NULL,
  `permission` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `permission` */

/*Table structure for table `perolehan_dana` */

DROP TABLE IF EXISTS `perolehan_dana`;

CREATE TABLE `perolehan_dana` (
  `id_dana` int(2) DEFAULT NULL,
  `jenis_dana` varchar(30) DEFAULT NULL,
  `ts_2` decimal(2,0) DEFAULT NULL,
  `ts_1` decimal(2,0) DEFAULT NULL,
  `ts` decimal(2,0) DEFAULT NULL,
  KEY `FK_perolehan_dana` (`id_dana`),
  CONSTRAINT `FK_perolehan_dana` FOREIGN KEY (`id_dana`) REFERENCES `sumber_dana` (`id_dana`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `perolehan_dana` */

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

/*Table structure for table `prestasi_dosen` */

DROP TABLE IF EXISTS `prestasi_dosen`;

CREATE TABLE `prestasi_dosen` (
  `id_dosen` varchar(6) DEFAULT NULL,
  `prestasi` varchar(50) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `internasional` varchar(1) DEFAULT NULL,
  `nasional` varchar(1) DEFAULT NULL,
  `lokal` varchar(1) DEFAULT NULL,
  KEY `FK_prestasi_dosen` (`id_dosen`),
  CONSTRAINT `FK_prestasi_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_tbl` (`id_dosen`)
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
  KEY `FK_pustaka` (`kd_jns`),
  CONSTRAINT `FK_pustaka` FOREIGN KEY (`kd_jns`) REFERENCES `jns_pustaka` (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pustaka` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`id`,`role_name`) values (1,'admin'),(2,'user');

/*Table structure for table `ruang_dosen` */

DROP TABLE IF EXISTS `ruang_dosen`;

CREATE TABLE `ruang_dosen` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `ruang_dosen` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ruang_dosen` */

/*Table structure for table `sdm` */

DROP TABLE IF EXISTS `sdm`;

CREATE TABLE `sdm` (
  `kd_hal` int(3) DEFAULT NULL,
  `total` int(5) DEFAULT NULL,
  `kd_prodi` varchar(6) DEFAULT NULL,
  `jml` int(3) DEFAULT NULL,
  KEY `FK_hal` (`kd_hal`),
  KEY `FK_sdm` (`kd_prodi`),
  CONSTRAINT `FK_sdm` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi_tbl` (`kode_prodi`),
  CONSTRAINT `FK_hal` FOREIGN KEY (`kd_hal`) REFERENCES `jns_hal` (`kd_hal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sdm` */

/*Table structure for table `struktur_kurikulum` */

DROP TABLE IF EXISTS `struktur_kurikulum`;

CREATE TABLE `struktur_kurikulum` (
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
  PRIMARY KEY (`kode_mk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `struktur_kurikulum` */

/*Table structure for table `sumber_biaya` */

DROP TABLE IF EXISTS `sumber_biaya`;

CREATE TABLE `sumber_biaya` (
  `kd_jns` int(2) NOT NULL AUTO_INCREMENT,
  `jns_sumber` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kd_jns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sumber_biaya` */

/*Table structure for table `sumber_dana` */

DROP TABLE IF EXISTS `sumber_dana`;

CREATE TABLE `sumber_dana` (
  `id_dana` int(2) NOT NULL AUTO_INCREMENT,
  `sumber_dana` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_dana`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sumber_dana` */

/*Table structure for table `tahun_akd` */

DROP TABLE IF EXISTS `tahun_akd`;

CREATE TABLE `tahun_akd` (
  `id_ts` int(3) NOT NULL AUTO_INCREMENT,
  `ts` int(4) DEFAULT NULL,
  PRIMARY KEY (`id_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tahun_akd` */

insert  into `tahun_akd`(`id_ts`,`ts`) values (1,2010),(2,2011),(3,2012),(4,2013),(5,2014),(6,2015),(7,2016),(8,2017),(9,2018);

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
  `unit_kerja` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenaga_kepend` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(4) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values ('1','admin','21232f297a57a5a743894a0e4a801fc3');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int(3) DEFAULT NULL,
  `role_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_role` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`level`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','admin'),(2,'Manajemen Informatika','f5c7528de45dfcd54d08030eecf985f9','user');

/*Table structure for table `waktu_prpbm` */

DROP TABLE IF EXISTS `waktu_prpbm`;

CREATE TABLE `waktu_prpbm` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `teori` int(6) DEFAULT NULL,
  `praktek` int(6) DEFAULT NULL,
  `praktikum` int(6) DEFAULT NULL,
  `pkl` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `waktu_prpbm` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
