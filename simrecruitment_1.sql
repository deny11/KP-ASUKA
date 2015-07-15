-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2015 at 07:34 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `simrecruitment_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `access_id` int(2) NOT NULL AUTO_INCREMENT,
  `access_privilege` enum('admin','director','hrd','non_hrd') NOT NULL,
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aplication_status`
--

CREATE TABLE IF NOT EXISTS `aplication_status` (
  `appstatus_id` int(30) NOT NULL,
  `appstatus_description` enum('Unprocessed','Prescreened','Shorlisted','Hired','Keep for reference','Rejected') NOT NULL,
  PRIMARY KEY (`appstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE IF NOT EXISTS `applicant` (
  `applicant_id` int(11) NOT NULL,
  `req_id` int(30) NOT NULL,
  `username_id` int(20) NOT NULL,
  `applicant_name` varchar(30) NOT NULL,
  `aplicant_cickname` varchar(10) NOT NULL,
  `birth_place` varchar(30) NOT NULL,
  `birth_date` date NOT NULL,
  `applicant_gender` enum('Lak-laki','perempuan','','') NOT NULL,
  `aplicant_religion` enum('Islam','Kristen Protestan','Katolik','Hindu','Buddha','Kong Hu Cu') NOT NULL,
  `marital_status` enum('Single','Married','Divorce','Widow') NOT NULL,
  `applicant_nationality` varchar(20) NOT NULL,
  `applicant_address` varchar(50) NOT NULL,
  `applicant_telp` int(30) NOT NULL,
  `idcard_no` int(20) NOT NULL,
  `idcard_valid_thru` date NOT NULL,
  `npwp_no` int(11) DEFAULT NULL,
  `applicant_email` varchar(30) NOT NULL,
  `applicant_hobby` varchar(50) NOT NULL,
  `applicant_life_goal` text NOT NULL,
  `motivation` text NOT NULL,
  PRIMARY KEY (`applicant_id`),
  UNIQUE KEY `username_id` (`username_id`),
  KEY `req_id` (`req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `application_id` int(30) NOT NULL,
  `applicant_id` int(30) NOT NULL,
  `reviewer_id` int(30) NOT NULL,
  `submit_date` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `department_id` int(30) NOT NULL,
  `grade_id` int(30) NOT NULL,
  `reference_name` varchar(30) DEFAULT NULL,
  `reference_telp` int(30) DEFAULT NULL,
  `expected_salary` float NOT NULL,
  PRIMARY KEY (`application_id`),
  KEY `applicant_id` (`applicant_id`),
  KEY `reviewer_id` (`reviewer_id`),
  KEY `status_id` (`status_id`),
  KEY `grade_id` (`grade_id`),
  KEY `department_id` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL,
  `department_name` enum('Civil & Construction','CRM','Electrical & Instrument','HRD & GA','HSE','Marketing','Planner, Estimation, & Control','Purchasing & Procurement','Technical Manager') NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `education_id` int(30) NOT NULL,
  `education_grade` enum('TK','SD','MI','SDLB','SMP','MTs','SMPLB','SMA','MA','SMK','SMALB','D1','D2','D3','D4','S1','S2','S3') NOT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `education_history`
--

CREATE TABLE IF NOT EXISTS `education_history` (
  `edhistory_id` int(30) NOT NULL,
  `education_id` int(30) NOT NULL,
  `applicant_id` int(30) NOT NULL,
  `education_name` varchar(50) NOT NULL,
  `education_address` varchar(30) NOT NULL,
  `education_city` varchar(10) NOT NULL,
  `education_province` varchar(10) NOT NULL,
  `graduation_year` int(8) NOT NULL,
  PRIMARY KEY (`edhistory_id`),
  KEY `education_id` (`education_id`),
  KEY `applicant_id` (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE IF NOT EXISTS `experience` (
  `experience_id` int(30) NOT NULL,
  `applicant_id` int(30) NOT NULL,
  `exp_year_begin` date NOT NULL,
  `exp_year_end` date NOT NULL,
  `exp_position` varchar(30) NOT NULL,
  `exp_salary` float NOT NULL,
  `resign_reason` varchar(255) NOT NULL,
  PRIMARY KEY (`experience_id`),
  KEY `applicant_id` (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` int(2) NOT NULL,
  `grade_desc` enum('Staff','Foreman','Skill','Site Coordinator','Supervisor','Asst. Manager','Manager') NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requisition`
--

CREATE TABLE IF NOT EXISTS `requisition` (
  `req_id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `req_work_duration` int(10) NOT NULL,
  `req_date` date NOT NULL,
  `req_job_location` varchar(30) NOT NULL,
  `req_nationality` varchar(30) NOT NULL,
  `req_marginal_duties` varchar(255) NOT NULL,
  `req_special_qualification` varchar(255) NOT NULL,
  `req_by` int(30) NOT NULL,
  `req_receive_date` date NOT NULL,
  `req_review_by` int(30) NOT NULL,
  `req_review_date` date NOT NULL,
  `req_approved_by` int(30) NOT NULL,
  `req_filled_by` int(30) NOT NULL,
  `req_filled_date` int(11) NOT NULL,
  PRIMARY KEY (`req_id`),
  KEY `department_id` (`department_id`),
  KEY `grade_id` (`grade_id`),
  KEY `req_by` (`req_by`),
  KEY `req_review_by` (`req_review_by`),
  KEY `req_approved_by` (`req_approved_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_offering`
--

CREATE TABLE IF NOT EXISTS `salary_offering` (
  `salary_offering_id` int(11) NOT NULL,
  `salary_status` enum('negotiable','fixed','','') NOT NULL,
  `salary_approved_by` int(11) NOT NULL,
  PRIMARY KEY (`salary_offering_id`),
  KEY `salary_approved_by` (`salary_approved_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL,
  `access_id` int(2) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_desc` text NOT NULL,
  `user_photo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `access_id` (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE IF NOT EXISTS `vacancy` (
  `vac_id` int(11) NOT NULL,
  `vac_publisher_id` int(11) NOT NULL,
  `vac_title` varchar(30) NOT NULL,
  `vac_desc` varchar(100) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `grade_id` int(30) NOT NULL,
  `vac_salary` float DEFAULT NULL,
  `vac_status` enum('Draft','Delayed','Published','Unpublished') NOT NULL,
  `other_qualification` varchar(255) DEFAULT NULL,
  `upload_qualification` varchar(255) DEFAULT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `publish_date_begin` date NOT NULL,
  `publish_date_end` date NOT NULL,
  PRIMARY KEY (`vac_id`),
  UNIQUE KEY `dept_id` (`dept_id`),
  UNIQUE KEY `grade_id` (`grade_id`),
  KEY `vac_publisher_id` (`vac_publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicant`
--
ALTER TABLE `applicant`
  ADD CONSTRAINT `applicant_ibfk_2` FOREIGN KEY (`username_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `applicant_ibfk_1` FOREIGN KEY (`req_id`) REFERENCES `requisition` (`req_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_5` FOREIGN KEY (`status_id`) REFERENCES `aplication_status` (`appstatus_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`grade_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `application_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `application_ibfk_3` FOREIGN KEY (`applicant_id`) REFERENCES `applicant` (`applicant_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `application_ibfk_4` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `education_history`
--
ALTER TABLE `education_history`
  ADD CONSTRAINT `education_history_ibfk_2` FOREIGN KEY (`applicant_id`) REFERENCES `application` (`application_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `education_history_ibfk_1` FOREIGN KEY (`education_id`) REFERENCES `education` (`education_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `applicant` (`applicant_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `requisition`
--
ALTER TABLE `requisition`
  ADD CONSTRAINT `requisition_ibfk_5` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `requisition_ibfk_1` FOREIGN KEY (`req_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `requisition_ibfk_2` FOREIGN KEY (`req_review_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `requisition_ibfk_3` FOREIGN KEY (`req_approved_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `requisition_ibfk_4` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`grade_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`access_id`) REFERENCES `access` (`access_id`) ON UPDATE CASCADE;

--
-- Constraints for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `vacancy_ibfk_3` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`grade_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vacancy_ibfk_1` FOREIGN KEY (`vac_publisher_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `vacancy_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
