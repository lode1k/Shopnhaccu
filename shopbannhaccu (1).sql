-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 13, 2021 lúc 03:27 AM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopbannhaccu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `hovaten` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `hovaten`, `username`, `password`) VALUES
(1, 'Phan Anh Hiếu', 'hieu28', '123456'),
(3, 'Đinh Ngọc Định', 'dinh98', '123456'),
(5, 'V? Tu?n Thành', 'thanh', '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbldanhmuc`
--

CREATE TABLE `tbldanhmuc` (
  `id` int(11) NOT NULL,
  `tieude` varchar(50) NOT NULL,
  `mota` varchar(100) NOT NULL,
  `trangthai` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbldanhmuc`
--

INSERT INTO `tbldanhmuc` (`id`, `tieude`, `mota`, `trangthai`) VALUES
(3, 'Đàn Piano', 'Đàn bền,đẹp', 0),
(4, 'Đàn Organ', 'Đàn nhập khẩu nước ngoài', 1),
(5, 'Đàn guitar', 'Xịn', 1),
(6, 'Trống', 'Nhập khẩu quốc tế', 1),
(10, 'Kèn-Sáo', 'Chất lượng cao', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblhdchitiet`
--

CREATE TABLE `tblhdchitiet` (
  `idhd` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `dongia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblhdchitiet`
--

INSERT INTO `tblhdchitiet` (`idhd`, `idsp`, `soluong`, `dongia`) VALUES
(19, 6, 2, 15000000),
(19, 7, 1, 11000000),
(19, 15, 1, 15000000),
(20, 2, 1, 13000),
(20, 3, 1, 17000),
(20, 6, 2, 15000000),
(21, 3, 1, 17000),
(22, 14, 1, 14050000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblhoadon`
--

CREATE TABLE `tblhoadon` (
  `id` int(11) NOT NULL,
  `ngaytao` timestamp NOT NULL DEFAULT current_timestamp(),
  `tongtien` float NOT NULL,
  `nguoinhan` varchar(100) NOT NULL,
  `diachinhan` varchar(100) NOT NULL,
  `sdt` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblhoadon`
--

INSERT INTO `tblhoadon` (`id`, `ngaytao`, `tongtien`, `nguoinhan`, `diachinhan`, `sdt`, `email`) VALUES
(19, '2020-11-05 01:55:36', 56000000, 'Đinh Ngọc Đinh', 'Ninh Bình', '0123456789', 'phamhuyen1011971a@gmail.com'),
(20, '2020-11-05 03:10:43', 30030000, 'Nguyễn Tiến Dũng', 'Tô Hiệu', '0123456789', 'titatitoe@gmail.com'),
(21, '2020-11-05 09:27:41', 17000, 'Phạm Văn Đạt', 'Thanh Oai', '0366030582', 'phamhuyen1011971a@gmail.com'),
(22, '2020-12-08 09:16:50', 14050000, 'Nguy?n Ti?n D?ng', 'Tô Hi?u', '0123456789', 'phamhuyen1011971a@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblnews`
--

CREATE TABLE `tblnews` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `tieude` varchar(255) NOT NULL,
  `tintuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblnews`
--

INSERT INTO `tblnews` (`id`, `image`, `tieude`, `tintuc`) VALUES
(2, 'tieude.jpg', 'Nhận 90 ngày truy cập không giới hạn tại TruFire khi mua Martin Guitar', 'Nhận 90 ngày học guitar miễn phí trên website học guitar lớn nhất thế giới TrueFire khi mua Martin guitar. TrueFire là website học đàn guitar lớn nhất thế giới...'),
(3, 'tieude.jpg', 'Nhận 90 ngày truy cập không giới hạn tại TruFire khi mua Martin Guitar', 'Nhận 90 ngày học guitar miễn phí trên website học guitar lớn nhất thế giới TrueFire khi mua Martin guitar. TrueFire là website học đàn guitar lớn nhất thế giới...');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblsanpham`
--

CREATE TABLE `tblsanpham` (
  `id` int(11) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `mota` varchar(500) NOT NULL,
  `idloai` int(11) NOT NULL,
  `nhacc` varchar(100) NOT NULL,
  `soluong` int(11) NOT NULL,
  `giatien` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `home` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblsanpham`
--

INSERT INTO `tblsanpham` (`id`, `ten`, `mota`, `idloai`, `nhacc`, `soluong`, `giatien`, `image`, `home`) VALUES
(2, 'Kawai ND-21', 'Tiêu chuẩn sản xuất của hãng Kawai – Nhật Bản', 3, 'Nhật Bản', 3, 13000, 'piano1.jpg', 0),
(3, 'Kawai K-300', 'Đàn nhập khẩu nước ngoài', 3, 'Nhật Bản', 1, 17000, 'piano2.jpg', 0),
(6, 'Pearl Roadshow RS525SC/C', 'Hàng chất lượng cao', 6, 'Nhật Bản', 5, 15000000, 'trong1.png', 1),
(7, 'Nuvo N510JW', 'Nuvo N510JW đem đến cho bé một chiếc kèn saxophone với âm thanh hấp dẫn và màu sắc bắt mắt. Đây sẽ là một chiếc kèn mà bạn không nên bỏ lỡ để giúp bé khám phá thế giới âm nhạc. Thiết kế gọn nhẹ', 10, 'Nhật Bản', 10, 11000000, 'ken1.jpg', 1),
(8, 'Kawai GL-30', 'Đàn Piano Kawai GL-30 cho ra đời một đặc tính âm thanh phong phú, tràn đầy sức sống của một chiếc Grand cổ điển quy mô lớn hơn. Với kích thước linh hoạt, GL-30 phù hợp với mọi không gian gia đình hay bất kỳ phòng thu nào.', 3, 'Nhật Bản', 7, 359000000, 'piano3.jpg', 0),
(9, 'Kohler  KC-115EB', 'Đàn Piano Kohler & Campbell KC-115EB là thương hiệu Mỹ, được sản xuất tại Indonesia. Cây đàn được sản xuất với các công nghệ tiên tiến, hiện đại, tạo nên chất lượng và độ bền.', 3, 'Indonesia', 100, 62900000, 'piano4.jpg', 0),
(10, 'Organ Roland E-09', 'THIẾT KẾ PHONG CÁCH', 4, 'Roland', 150, 11000000, 'organ1.jpg', 0),
(11, 'Casiotone CT-S200', 'Đàn Organ Casiotone CT-S200 là một trong những mẫu đàn Organ/Keyboard mới nhất 2019. Với thiết kế gọn nhẹ, nhiều tính năng hiện đại cây đàn hứa hẹn là “chiến binh” mang đến sự hứng thú cho tất cả người chơi.', 4, 'US', 140, 3870000, 'organ2.jpg', 0),
(12, 'Casio CT-X800 ', 'Đàn organ Casio CT-X800 thuộc dòng CT-X Series của Casio. Đàn có thiết kế màn hình LCD rõ ràng, hữu ích, có đèn nền giúp người chơi thuận tiện khi trình diễn hoặc tập đàn.', 4, 'England', 150, 5700000, 'organ3.jpg', 0),
(13, 'Casio SA-46', 'Đàn Organ Casio SA-46, SA47 là sự lựa chọn thông minh, giúp bé bước đầu tập làm quen với đàn. Với thiết kế linh hoạt, Casio SA-46 giúp bé di chuyển dễ dàng, sẵn sàng đồng hành cùng bé mọi lúc mọi nơi.', 4, 'Indonesia', 5, 1390000, 'organ4.jpg', 0),
(14, 'Jackson DK2M Dinky', 'DK2M Pro Series Dinky ™ có thân máy dày hơn, cổ bằng bu-lông được gia cố bằng than chì phẳng với gót chân bao quanh, ngón tay hình bán kính 24-băn khoăn (12 \"-16\") (gỗ hồng đậm trên mô hình Bạch Tuyết . Cầu Floyd Rose®, phần cứng màu đen và khóa dây đeo Dunlop®.', 5, 'Nhật Bản', 90, 14050000, 'guita1.jpg', 0),
(15, 'Fender American Vintage 72', 'Cây guitar Fender\'s American Vintage \'72 Telecaster Thinline gợi lên một cách chân thực một thành viên lịch sử của gia đình Telecaster. Các chi tiết đầu thập niên 70 chính xác bao gồm một tấm cổ ba bu-lông với điều chỉnh Micro-Tilt, đai ốc thanh đạn và bộ điều chỉnh kiểu F F phong cách cổ điển với các chạm bao gồm cổ héo Fender Wide Range và cầu bán tải được thiết kế lại và lồng tiếng cho âm thanh thậm chí giống như những chiếc xe bán tải của thập niên 1970.', 5, 'England', 150, 15000000, 'guita2.jpg', 1),
(16, 'Takamine TC135SC', 'Đàn Guitar Takamine TC1355SC nổi bật với kiểu dáng Classic. Đây là dáng đàn được những người chơi yêu thích Guitar ưa chuộng.', 5, 'Malaysia', 120, 50000000, 'guita3.jpg', 0),
(17, 'Jackson JS32T', 'Đàn Jackson js series rhoads js32t với nguồn nguyên liệu gỗ quý được sử dụng, sản phẩm này mang lại một chất lượng âm thanh tốt nhất.', 5, 'Nhật Bản', 55, 28000000, 'guita4.jpg', 0),
(18, 'Pearl Export EXX725SP/C', 'Bộ công cụ đã tạo ra hàng ngàn huyền thoại trống đang trở lại và mở ra một thế giới hoàn toàn mới và cải tiến. Có sẵn trong các phiên bản sơn phủ hoặc sơn mài, bộ trống Export mới của Pearl được xây dựng mạnh mẽ hơn bao giờ hết để mang đến sự bền bỉ vượt thời gian giúp người chơi trống có được một khởi đầu vững chắc.', 6, 'Indonesia', 15, 168000000, 'trong2.jpg', 0),
(19, 'Roland TD-25KVX', 'Roland TD-25KVX + MDS-STD + KD-220 được trang bị công nghệ cao cấp từ dòng TD-30 trở thành sự lựa chọn tuyệt vời từ những tay trống chuyên nghiệp trên toàn thế giới.', 6, 'Dubai', 28, 170000000, 'trong3.jpg', 0),
(20, 'Roland TD-11K', 'Được tăng cường với sức mạnh SuperNATURAL power, bộ trống TD-11K V-Drum V-Compact Series mang lại một trải nghiệm chơi tự nhiên, âm thanh thực cho những tay trống ở mọi trình độ và phù hợp với túi tiền.', 6, 'Dubai', 180, 196000000, 'trong4.jpg', 0),
(21, 'N410DWGN', 'NUVO TooT là công cụ chị em của DooD. Đối với một đứa trẻ đã sẵn sàng để tiến bộ từ máy ghi âm, đây là bước tiếp theo hoàn hảo để cuối cùng chơi sáo.', 10, 'England', 500, 16000000, 'ken2.jpg', 0),
(22, 'N410DBBK', 'NUVO TooT là công cụ chị em của DooD. Đối với một đứa trẻ đã sẵn sàng để tiến bộ từ máy ghi âm, đây là bước tiếp theo hoàn hảo để cuối cùng chơi sáo.', 10, 'Nga', 412, 10000000, 'ken3.jpg', 0),
(23, 'Selmer BS650', 'Kèn Saxophones Selmer BS650 ra đời dựa trên những công nghệ sản xuất hiện đại, tiên tiến nhất. Với thiết kế màu vàng đồng tạo nên vẻ đẹp sang trọng, quyến rũ cho chiếc kèn.', 10, 'Nhật Bản', 220, 22000000, 'ken4.jpg', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbldanhmuc`
--
ALTER TABLE `tbldanhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblhdchitiet`
--
ALTER TABLE `tblhdchitiet`
  ADD PRIMARY KEY (`idhd`,`idsp`),
  ADD KEY `idsp` (`idsp`);

--
-- Chỉ mục cho bảng `tblhoadon`
--
ALTER TABLE `tblhoadon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblnews`
--
ALTER TABLE `tblnews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblsanpham`
--
ALTER TABLE `tblsanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idloai` (`idloai`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbldanhmuc`
--
ALTER TABLE `tbldanhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tblhoadon`
--
ALTER TABLE `tblhoadon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `tblnews`
--
ALTER TABLE `tblnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tblsanpham`
--
ALTER TABLE `tblsanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tblsanpham`
--
ALTER TABLE `tblsanpham`
  ADD CONSTRAINT `tblsanpham_ibfk_1` FOREIGN KEY (`idloai`) REFERENCES `tbldanhmuc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
