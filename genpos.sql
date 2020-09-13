-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2020 at 10:22 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `genpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE `accomodation` (
  `id` int(11) NOT NULL,
  `room` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `passport` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `vehicle` varchar(100) DEFAULT NULL,
  `amount` float NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `receptionist` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  `cashbookUpdate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `unit_cost` float NOT NULL,
  `units_sold` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `VAT` float NOT NULL DEFAULT 0,
  `sale_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basket`
--

INSERT INTO `basket` (`id`, `sale_id`, `product_name`, `unit_cost`, `units_sold`, `price`, `VAT`, `sale_by`) VALUES
(1, 1, 'toshiba 15\"', 37500, 1, 37500, 5175, 'jackie'),
(2, 2, 'acer 15\"', 37500, 1, 37500, 0, 'jackie');

-- --------------------------------------------------------

--
-- Table structure for table `cashbook`
--

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `openingAmount` float NOT NULL,
  `credit` float NOT NULL,
  `debit` float NOT NULL,
  `Balance` float NOT NULL,
  `method` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `description`, `openingAmount`, `credit`, `debit`, `Balance`, `method`, `date`) VALUES
(1, 'Refund', 0, 0, -37500, -37500, 'cash', '2017-10-03 10:54:34'),
(2, 'Cash income sales and accomodation', -37500, 5175, 0, -32325, 'CASH', '2017-10-03 10:54:48'),
(3, 'Cheque income sales and accomodation', -32325, 0, 0, -32325, 'CHEQUE', '2017-10-03 10:54:50'),
(4, 'Mpesa income sales and accomodation', -32325, 0, 0, -32325, 'MPESA', '2017-10-03 10:54:52'),
(5, 'Cash income sales and accomodation', -32325, 37500, 0, 5175, 'CASH', '2017-10-03 10:59:19'),
(6, 'Cheque income sales and accomodation', 5175, 0, 0, 5175, 'CHEQUE', '2017-10-03 10:59:21'),
(7, 'Mpesa income sales and accomodation', 5175, 0, 0, 5175, 'MPESA', '2017-10-03 10:59:23'),
(8, 'Cash income sales and accomodation', 5175, 0, 0, 5175, 'CASH', '2020-09-06 21:34:07'),
(9, 'Cheque income sales and accomodation', 5175, 0, 0, 5175, 'CHEQUE', '2020-09-06 21:34:11'),
(10, 'Mpesa income sales and accomodation', 5175, 0, 0, 5175, 'MPESA', '2020-09-06 21:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `Category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Category`) VALUES
(9, 'accessories'),
(6, 'bags'),
(3, 'database'),
(1, 'laptops'),
(5, 'peripherals'),
(8, 'Printer peripherals'),
(7, 'Printers'),
(4, 'software'),
(2, 'storage devices');

-- --------------------------------------------------------

--
-- Table structure for table `creditors`
--

CREATE TABLE `creditors` (
  `id` int(11) NOT NULL,
  `creditor` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `description` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(25) NOT NULL DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `debts`
--

CREATE TABLE `debts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `receiptno` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `second_name`, `user_name`, `user_type`, `password`, `date`) VALUES
(1, 'ben', 'rwara', 'ben', 'Admin', '1234', '2017-05-06 16:11:06'),
(3, 'Rwara', 'Jack', 'jackie', 'User', '12345', '2017-05-12 20:36:21'),
(4, 'peter', 'kingori', 'peter', 'Admin', 'peter', '2017-07-25 19:28:40'),
(5, 'dennis ', 'warungu', 'dennis', 'User', 'dennis', '2017-07-25 19:29:17'),
(6, 'rwara', 'kamau', 'rwara', 'Reception', '123456', '2017-08-10 13:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `inventory_item` varchar(100) NOT NULL,
  `number` decimal(10,0) NOT NULL,
  `unit_measure` varchar(25) NOT NULL,
  `unit_cost` float NOT NULL,
  `total_cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_ops`
--

CREATE TABLE `inventory_ops` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `units_in` float DEFAULT NULL,
  `units_out` float DEFAULT NULL,
  `remaining_units` int(11) NOT NULL,
  `Cost` float NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Transaction_by` varchar(100) NOT NULL,
  `Transaction_with` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemlots`
--

CREATE TABLE `itemlots` (
  `Lotid` int(11) NOT NULL,
  `LotDate` date NOT NULL,
  `Item` int(250) NOT NULL,
  `Qty` float NOT NULL,
  `UnitPrice` float NOT NULL,
  `LotExpiry` date NOT NULL,
  `Supplier` varchar(250) NOT NULL,
  `LotBp` float NOT NULL,
  `LotSp` float NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product` varchar(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `supplier_phone` varchar(100) NOT NULL,
  `supplier_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` int(100) NOT NULL,
  `unit_measure` varchar(100) NOT NULL,
  `lowLevel` int(11) NOT NULL DEFAULT 0,
  `Store_qty` float NOT NULL DEFAULT 0,
  `Shelf_qty` float NOT NULL,
  `Profit%` float NOT NULL,
  `VAT%` float DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_category`, `unit_measure`, `lowLevel`, `Store_qty`, `Shelf_qty`, `Profit%`, `VAT%`, `date`, `deleted`) VALUES
(12, 'keyboard', 1, 'Piece', 0, 0, 0, 2, 0.1, '2020-09-11 22:58:19', 0),
(13, 'backpack', 2, 'Piece', 2, 0, 0, 2, 0.16, '2020-09-11 22:58:25', 0),
(14, 'mouse', 9, 'Piece', 2, 0, 0, 2, 0.16, '2020-09-11 23:28:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `description` varchar(250) NOT NULL,
  `payment_Method` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receiptno`
--

CREATE TABLE `receiptno` (
  `id` int(11) NOT NULL,
  `Receipt_No` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room` varchar(100) NOT NULL,
  `room_type` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roomtypes`
--

CREATE TABLE `roomtypes` (
  `Type` varchar(100) NOT NULL,
  `Amount` float NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `unit_cost` float DEFAULT NULL,
  `units_sold` float DEFAULT NULL,
  `total_cost` float DEFAULT NULL,
  `sale_by` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `method` varchar(100) NOT NULL DEFAULT 'cash',
  `payment` int(11) NOT NULL DEFAULT 0,
  `VAT` float NOT NULL DEFAULT 0,
  `cashbookUpdate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_id`, `product_name`, `unit_cost`, `units_sold`, `total_cost`, `sale_by`, `date`, `method`, `payment`, `VAT`, `cashbookUpdate`) VALUES
(1, 1, 'toshiba 15\"', 37500, 1, 5175, 'jackie', '2017-10-03 10:54:53', 'CASH', 1, 5175, 1),
(2, 2, 'acer 15\"', 37500, 1, 37500, 'jackie', '2017-10-03 10:59:24', 'CASH', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Mobile` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Town` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `Name`, `Mobile`, `Email`, `Town`) VALUES
(1, 'rwara', '+254715694798', 'bennyrwara@gmail.com', 'nyeri'),
(2, 'thukus', '+254715694798', 'bennyrwara@gmail.com', 'nanyuki');

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `id` int(11) NOT NULL,
  `UOM` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`id`, `UOM`) VALUES
(1, 'Piece'),
(2, 'Carton');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashbook`
--
ALTER TABLE `cashbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Category` (`Category`),
  ADD UNIQUE KEY `Category_2` (`Category`),
  ADD UNIQUE KEY `Category_3` (`Category`);

--
-- Indexes for table `creditors`
--
ALTER TABLE `creditors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debts`
--
ALTER TABLE `debts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `password_2` (`password`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_ops`
--
ALTER TABLE `inventory_ops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemlots`
--
ALTER TABLE `itemlots`
  ADD PRIMARY KEY (`Lotid`,`LotDate`,`Item`,`Qty`,`LotExpiry`,`Supplier`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_name` (`product_name`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiptno`
--
ALTER TABLE `receiptno`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room`);

--
-- Indexes for table `roomtypes`
--
ALTER TABLE `roomtypes`
  ADD PRIMARY KEY (`Type`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomodation`
--
ALTER TABLE `accomodation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `creditors`
--
ALTER TABLE `creditors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debts`
--
ALTER TABLE `debts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_ops`
--
ALTER TABLE `inventory_ops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itemlots`
--
ALTER TABLE `itemlots`
  MODIFY `Lotid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receiptno`
--
ALTER TABLE `receiptno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uom`
--
ALTER TABLE `uom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
