use master
Drop Database Qldasv
----------
create database Qldasv
GO
use Qldasv
GO
CREATE TABLE Khoa
(
	MaKhoa varchar(10) not null,
	TenKhoa nVarchar(50) NOT NULL,
	CONSTRAINT PK_Khoa PRIMARY KEY(MaKhoa)
)
GO
CREATE TABLE Lop
(
	MaLop varchar(10) not null,
	TenLop nVarchar(50) NOT NULL,
	MaKhoa varchar(10) not null,
	CONSTRAINT PK_Lop PRIMARY KEY(MaLop),
	CONSTRAINT FK_Khoa_Lop FOREIGN KEY(MaKhoa) REFERENCES Khoa(MaKhoa)
)
GO
CREATE TABLE SinhVien
(
	Masv varchar(10) not null,
	HoTen nVarchar(50) NOT NULL,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	Diachisv nVarchar(200),
	Dienthoaisv Varchar(50),	
	Ngaysinh DATETIME,
	MaLop varchar(10) not null,
	CONSTRAINT PK_Sinhvien PRIMARY KEY(Masv),
	CONSTRAINT FK_Sinhvien_Lop FOREIGN KEY(MaLop) REFERENCES Lop(MaLop)
)
GO
CREATE TABLE Giangvien
(
	Magv varchar(10) not null,
	HoTen nVarchar(50) NOT NULL,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	Diachigv nVarchar(200),
	Dienthoaigv Varchar(50),	
	Ngaysinh DATETIME,
	MaKhoa varchar(10) not null,
	CONSTRAINT PK_Giangvien PRIMARY KEY(Magv),
	CONSTRAINT FK_Khoa_Giangvien FOREIGN KEY(MaKhoa) REFERENCES Khoa(MaKhoa)
)
GO
CREATE TABLE Mon
(
	MaMon varchar(6) not null,
	TenMon nVarchar(50) NOT NULL,
	CONSTRAINT PK_Mon PRIMARY KEY(MaMon)
)
GO
CREATE TABLE BaoCao
(
	Masv varchar(10) not null,
	MaMon varchar(6) not null,
	Magv varchar(10) not null,
	Noidung nvarchar(300) not null,
	linkdemo varchar(100) not null,
	filedemo nvarchar (200) not null,
	CONSTRAINT PK_BaoCao PRIMARY KEY(Masv,MaMon),
	CONSTRAINT FK_SV FOREIGN KEY (Masv) REFERENCES SinhVien(Masv),
	CONSTRAINT FK_Mon FOREIGN KEY (MaMon) REFERENCES Mon(MaMon),
	CONSTRAINT FK_DoAn_Giangvien FOREIGN KEY(Magv) REFERENCES Giangvien(Magv)

)
GO
CREATE TABLE Loai
(
	MaLoai varchar(15) not null,
	TenLoai nVarchar(50) NOT NULL,
	CONSTRAINT PK_Loai PRIMARY KEY(MaLoai)
)

CREATE TABLE KhoaHoc
(
	Makhoahoc varchar(6) not null,
	Tenkhoahoc nvarchar (100) not null,
	Nguoidang nvarchar (50) not null,
	Noidung nvarchar (1000) not null,
	hinhanh varchar(20) not null,
	Ngaydang DATETIME,
	MaLoai varchar(15) not null,
	CONSTRAINT PK_Khoahoc PRIMARY KEY(Makhoahoc),
	CONSTRAINT FK_Khoahoc_Loai FOREIGN KEY (MaLoai) REFERENCES Loai(MaLoai)

)
GO
CREATE TABLE Baihoc
(
	Mabaihoc varchar(6) not null,
	TenBaihoc nvarchar (100) not null,
	Ngaydang DATETIME,
	Makhoahoc varchar(6) not null,
	CONSTRAINT PK_Baihoc PRIMARY KEY(Mabaihoc),
	CONSTRAINT FK_Baihoc_Khoahoc FOREIGN KEY (Makhoahoc) REFERENCES KhoaHoc(Makhoahoc)
)
GO
CREATE TABLE Video_baihoc
(
	Mavideo INT IDENTITY(1,1),
	Tenvideo nvarchar (100) not null,
	linkvideo varchar (1000) not null,
	Mabaihoc varchar(6) not null,
	CONSTRAINT PK_Video PRIMARY KEY(Mavideo),
	CONSTRAINT FK_Baihoc_video FOREIGN KEY (Mabaihoc) REFERENCES Baihoc(Mabaihoc)
)
GO
CREATE TABLE SV_KH
(
	Makhoahoc varchar(6) not null,
	Masv varchar(10) not null,
	CONSTRAINT PK_SV_KH PRIMARY KEY(Makhoahoc,Masv),
	CONSTRAINT FK_Sinhvien FOREIGN KEY (Masv) REFERENCES SinhVien(Masv),
	CONSTRAINT FK_Khoahoc FOREIGN KEY (Makhoahoc) REFERENCES KhoaHoc(Makhoahoc)
)
GO
CREATE TABLE Test
(
	Matest INT IDENTITY(1,1),
	Tentest nvarchar (200) not null,
	Makhoahoc varchar(6) not null,
	CONSTRAINT PK_Test PRIMARY KEY(Matest),
	CONSTRAINT FK_Test_KH FOREIGN KEY (Makhoahoc) REFERENCES KhoaHoc(Makhoahoc)

)
GO
CREATE TABLE Cauhoi
(
	MaCauhoi INT IDENTITY(1,1),
	TenCauhoi nvarchar (200) not null,
	Matest INT,
	CauA nvarchar (200) not null,
	CauB nvarchar (200) not null,
	CauC nvarchar (200) not null,
	CauD nvarchar (200) not null,
	Traloi nvarchar (200) not null,
	CONSTRAINT PK_Cauhoi PRIMARY KEY(MaCauhoi),
	CONSTRAINT FK_Test_Cauhoi FOREIGN KEY (Matest) REFERENCES Test(Matest)

)
GO
select * from Video_baihoc
select * from Baihoc
select * from Mon
select * from Lop
select * from SinhVien
select * from KhoaHoc
select * from Loai
select * from SV_KH
select * from BaoCao where Masv='1611060219'
-----Khoa------
INSERT Khoa(MaKhoa,TenKhoa) VALUES ('HUTECHCNTT',N'Cong Nghe Thong Tin')
----Lop------
INSERT Lop (MaLop,TenLop,MaKhoa) VALUES('16DTHA2001','16DTHA2','HUTECHCNTT')
----SinhVien-----
INSERT SinhVien(Masv,HoTen,Matkhau,Email,Diachisv,Dienthoaisv,Ngaysinh,MaLop)
VALUES('1611060219',N'Nguyen Trung Phung','phung1','phung070374@gmail.com','asvavavdv','0345655350','07/03/1998','16DTHA2001')

INSERT SinhVien(Masv,HoTen,Matkhau,Email,Diachisv,Dienthoaisv,Ngaysinh,MaLop)
VALUES('1611060973',N'Nghiêm Quốc Anh Minh','123','nghiemminh1904@gmail.com','asvavavdv','01639895154','07/03/1998','16DTHA2001')

INSERT SinhVien(Masv,HoTen,Matkhau,Email,Diachisv,Dienthoaisv,Ngaysinh,MaLop)
VALUES('1511060442',N'Huỳnh Trần Công Danh','123','trandanh364@gmail.com','asvavavdv','0961050993','07/03/1998','16DTHA2001')

INSERT SinhVien(Masv,HoTen,Matkhau,Email,Diachisv,Dienthoaisv,Ngaysinh,MaLop)
VALUES('1611060162',N'Võ Bá Long','123','hutvobalong@gmail.com','asvavavdv','0926252667','07/03/1998','16DTHA2001')
----GiangVien-----
INSERT Giangvien (Magv,HoTen,Matkhau,Email,Diachigv,Dienthoaigv,Ngaysinh,MaKhoa)
VALUES('CNTTGV0001',N'Nguyen Kim Hung','123','jackyhung@gmai.com','afafafa','01645655350','05/01/1998','HUTECHCNTT')
-----Mon----
INSERT Mon(MaMon,TenMon) VALUES('DACN01',N'Do An Chuyen Nganh')
INSERT Mon(MaMon,TenMon) VALUES('DACS01',N'Do An Co So')
INSERT Mon(MaMon,TenMon) VALUES('DATN01',N'Do An Tot Nghiep')
INSERT Mon(MaMon,TenMon) VALUES('DATT01',N'Do An Thuc Tap')
------Loai------
INSERT Loai(MaLoai,TenLoai) VALUES('C#',N'C#')
INSERT Loai(MaLoai,TenLoai) VALUES('C++',N'C#')
INSERT Loai(MaLoai,TenLoai) VALUES('JQUERY',N'JQUERY')
INSERT Loai(MaLoai,TenLoai) VALUES('ASP.NET',N'ASP.NET')
INSERT Loai(MaLoai,TenLoai) VALUES('PHP',N'PHP')
INSERT Loai(MaLoai,TenLoai) VALUES('ANGULER',N'ANGULER')
INSERT Loai(MaLoai,TenLoai) VALUES('JAVA',N'JAVA')
------KhoaHoc-----
INSERT KhoaHoc(Makhoahoc,Tenkhoahoc,Nguoidang,Noidung,hinhanh,Ngaydang,MaLoai)
VALUES ('CSD001',N'Cơ sở dữ liệu',N'Nguyen Trung Phung',N'aasfasfafafasf','fgwgw','11/29/2019','C#')
INSERT KhoaHoc(Makhoahoc,Tenkhoahoc,Nguoidang,Noidung,hinhanh,Ngaydang,MaLoai)
VALUES ('NML001',N'Nhập môn lập trình',N'Nguyen Trung Phung',N'aasfasfafafasf','fgwgw','11/29/2019','C#')
INSERT KhoaHoc(Makhoahoc,Tenkhoahoc,Nguoidang,Noidung,hinhanh,Ngaydang,MaLoai)
VALUES ('KNA001',N'Khởi nghiệp',N'Nguyen Trung Phung',N'aasfasfafafasf','fgwgw','11/29/2019','C#')
INSERT KhoaHoc(Makhoahoc,Tenkhoahoc,Nguoidang,Noidung,hinhanh,Ngaydang,MaLoai)
VALUES ('HTT001',N'Hệ thống thông tin',N'Nguyen Trung Phung',N'Hệ thống thông tin là một hệ thống bao gồm các yếu tố có quan hệ với nhau cùng làm nhiệm vụ thu thập, xử lý, lưu trữ và phân phối thông tin và dữ liệu và cung cấp một cơ chế phản hồi để đạt được một mục tiêu định trước.[1][2][3]
Các tổ chức có thể sử dụng các hệ thống thông tin với nhiều mục đích khác nhau. Trong việc quản trị nội bộ, hệ thống thông tin sẽ giúp đạt được sự thông hiểu nội bộ, thống nhất hành động, duy trì sức mạnh của tổ chức, đạt được lợi thế cạnh tranh. Với bên ngoài, hệ thống thông tin giúp nắm bắt được nhiều thông tin về khách hàng hơn hoặc cải tiến dịch vụ, nâng cao sức cạnh tranh, tạo đà cho sự phát triển.','fgwgw','11/29/2019','C#')
INSERT KhoaHoc(Makhoahoc,Tenkhoahoc,Nguoidang,Noidung,hinhanh,Ngaydang,MaLoai)
VALUES ('NNC001',N'Nhanh như chớp',N'Nguyen Trung Phung',N'aasfasfafafasf','fgwgw','11/29/2019','C#')
INSERT KhoaHoc(Makhoahoc,Tenkhoahoc,Nguoidang,Noidung,hinhanh,Ngaydang,MaLoai)
VALUES ('ASP001',N'Lập Trình ASP.NET ',N'Nguyen Trung Phung',N'aasfasfafafasf','fgwgw','11/29/2019','C#')

-----------BaoCao------------
INSERT BaoCao(Masv,MaMon,Magv,Noidung,linkdemo,filedemo)
VALUES ('1611060219','DACN01','CNTTGV0001',N'fhgafgakfkjahfjakhfjafjkagbfbfakjbvjb','afafafa',N'ffqfwfwfwfwfwfw')
INSERT BaoCao(Masv,MaMon,Magv,Noidung,linkdemo,filedemo)
VALUES ('1611060219','DACS01','CNTTGV0001',N'fhgafgakfkjahfjakhfjafjkagbfbfakjbvjb','afafafa',N'ffqfwfwfwfwfwfw')
INSERT BaoCao(Masv,MaMon,Magv,Noidung,linkdemo,filedemo)
VALUES ('1611060219','DATN01','CNTTGV0001',N'fhgafgakfkjahfjakhfjafjkagbfbfakjbvjb','afafafa',N'ffqfwfwfwfwfwfw')
INSERT BaoCao(Masv,MaMon,Magv,Noidung,linkdemo,filedemo)
VALUES ('1611060219','DATT01','CNTTGV0001',N'fhgafgakfkjahfjakhfjafjkagbfbfakjbvjb','afafafa',N'ffqfwfwfwfwfwfw')

--------BaiHoc------
INSERT Baihoc(Mabaihoc,TenBaihoc,Ngaydang,Makhoahoc)
VALUES ('BH0001',N'Bài 1: Giới thiệu SQL và SQL server ','06/16/2019','CSD001')
----------Video_baihoc-------
INSERT Video_baihoc(Tenvideo,linkvideo,Mabaihoc)
VALUES (N'[Khóa học sử dụng SQL server] - Bài 1: Giới thiệu SQL và SQL server','https://youtu.be/2fanjSYVElY','BH0001')
