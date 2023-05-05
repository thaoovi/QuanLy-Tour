create database qltour
use qltour
create table tour
(
	idtour varchar(10) primary key not null,
	tentour nvarchar(100) not null,
	ngaydi datetime,
	ngayve datetime,
	mota nvarchar(800),
	idnoixuatphat varchar(10),
	iddiemden varchar(10),
	idhotel varchar(10),
	idphuongtien varchar(10),
	constraint chk_ngaydingayve check(ngayve >= ngaydi)
)
create table TourOrder
(
	iddondathang varchar(10),
	idkhachhang varchar(10),
	idtour varchar(10),
	ngaydat datetime,
	ngaytratien datetime,
	sove int,
	giatien float,
	giamgia float,
	primary key (iddondathang,idkhachhang,idtour)
)
create table employee
(
	idnhanvien varchar(10) primary key,
	hotenNV nvarchar(100),
	sdt char(11),
	idchucvu varchar(10)
)
create table departure_point
(
	idnoixuatphat varchar(10) primary key,
	noixuatphat nvarchar(200)
)
create table destination
(
	iddiemden varchar(10) primary key,
	tendiemden nvarchar(200)
)
create table customer
(
	idkhachhang varchar(10) primary key,
	hotenKH nvarchar(100),
	ngaysinh datetime check((year(getdate())-year(ngaysinh)) >=18),
	sdt char(11) not null,
	email varchar(100)
)
create table transportation
(
	idphuongtien varchar(10) primary key,
	phuongtien nvarchar(50),
	succhua int
)
create table hotel
(
	idhotel varchar(10) primary key,
	tenhotel nvarchar(50),
	diachi nvarchar(200),
	hotline char(11)
)
create table assignment
(
	idnhanvien varchar(10),
	idtour varchar(10),
	primary key (idnhanvien,idtour)
)
create table position
(
	idchucvu varchar(10) primary key,
	chucvu nvarchar(50)
)
alter table tour add constraint fk_noixuatphat foreign key(idnoixuatphat) references departure_point(idnoixuatphat);
alter table tour add constraint fk_diemden foreign key(iddiemden) references destination(iddiemden);
alter table tour add constraint fk_hotel foreign key(idhotel) references hotel(idhotel);
alter table tour add constraint fk_phuongtien foreign key(idphuongtien) references transportation(idphuongtien);
alter table tourorder add constraint fk_to_tour foreign key(idtour) references tour(idtour);
alter table tourorder add constraint fk_khachhang foreign key(idkhachhang) references customer(idkhachhang);
alter table assignment add constraint fk_nhanvien foreign key(idnhanvien) references employee(idnhanvien);
alter table assignment add constraint fk_tour foreign key(idtour) references tour(idtour);
alter table employee add constraint fk_chucvu foreign key(idchucvu) references position(idchucvu);
set dateformat DMY;
--Thêm dữ liệu bảng transportation
insert into transportation values ('XE16',N'xe 16 chỗ','16');
insert into transportation values ('XE30',N'xe 30 chỗ','30');
insert into transportation values ('XE45',N'xe 45 chỗ','45');
insert into transportation values ('XEGN',N'xe giường nằm','40');
insert into transportation values ('MB',N'máy bay','100');
--Thêm dữ liệu bảng hotel
insert into hotel values ('KS01','Ocean Place Resort',N'192 Nguyễn Đình Chiểu, Phường Hàm Tiến, Thành phố Phan Thiết','02523757799');
insert into hotel values ('KS02','Glory',N'84A Trần Phú, Lộc Thọ, Nha Trang','02583524258');
insert into hotel values ('KS03','Mayflower Hotel Hanoi',N'11 Phố Hàng Rươi, Hàng Mã, Hoàn Kiếm, Hà Nội','02435331111');
insert into hotel values ('KS04','Kings Hotel Dalat',N'Số 10 Đường Bùi Thị Xuân, Phường 2, Thành phố Đà Lạt','02633551551');
insert into hotel values ('KS05','Sun Beach Hotel',N'i1 Thái Văn Lung, Phường 2, Thành phố Vũng Tầu, Bà Rịa - Vũng Tàu','0908380993');
insert into hotel values ('KS06',N'Dương Đông Hotel',N'Tổ 3, Ấp, Cửa Lấp, huyện Phú Quốc, Kiên Giang','0842294788');
insert into hotel values ('KS07',N'Sala Tuy Hòa Beach Hotel',N'51 Độc Lập, Phường 7, Tuy Hòa, Phú Yên','02573686666');
insert into hotel values ('KS08','Sapa Centre Hotel',N'Số 10 Cầu Mây, Thành phố Sapa','0986299885');
insert into hotel values ('KS09',N'The Secret Côn Đảo',N'Số 08 Đường Tôn Đức Thắng, Côn Đảo, Bà Rịa - Vũng Tàu','02543837888');
insert into hotel values ('KS10',N'Khách sạn Thanh Trúc Cà Mau',N'113 Ngô Quyền, Phường 1, Thành phố Cà Mau','0919896146');
--Thêm dữ liệu bảng destination
insert into destination values('DD01',N'Sân bay Nội Bài')
insert into destination values('DD02',N'Bến xe Mũi Né')
insert into destination values('DD03',N'Bến xe phía Bắc Nha Trang')
insert into destination values('DD04',N'Đất Mũi')
insert into destination values('DD05',N'Sân bay Côn Sơn')
insert into destination values('DD06',N'Bến xe khách Vũng Tàu')
insert into destination values('DD07',N'Sapa')
insert into destination values('DD08',N'Sân bay Quốc tế Phú Quốc')
insert into destination values('DD09',N'Sân bay Tuy Hòa')
insert into destination values('DD10',N'Bến xe liên tỉnh Đà Lạt')
insert into destination values('DD11',N'Sân bay Cần Thơ')
insert into destination values('DD12',N'Bến tàu Hà Tiên')
--Thêm dữ liệu bảng departure_point
insert into departure_point values('DXP01',N'TPHCM')
insert into departure_point values('DXP02',N'Hà Nội')
insert into departure_point values('DXP03',N'Đà Nẵng')
insert into departure_point values('DXP04',N'Vũng Tàu')
--Thêm dữ liệu bảng position
insert into position values ('QL', N'Quản lý')
insert into position values ('HDV', N'Hướng dẫn viên')
insert into position values ('TX', N'Tài xế')
--Thêm dữ liệu bảng employee
insert into employee values('NV001', N'Đinh Bá Tiến', '0949694085', 'HDV')
insert into employee values('NV002', N'Nguyễn Thanh Tùng', '0962503260', 'TX')
insert into employee values('NV003', N'Trần Thanh Tâm', '0125509516', 'QL')
insert into employee values('NV004', N'Nguyễn Mạnh Hưng', '0621485162', 'TX')
insert into employee values('NV005', N'Vương Ngọc Quyền', '0469394970', 'HDV')
insert into employee values('NV006',N'Trần Hồng Quang','0253530675','QL')
insert into employee values('NV007',N'Lê Thị Nhàn','0898297924','HDV')
insert into employee values('NV008',N'Thái Văn Sang','0594858123','QL')
insert into employee values('NV009',N'Nguyễn Văn Triệu','0125326482','TX')
insert into employee values('NV010',N'Nguyễn Thị Vân','0938133356','HDV')
--Thêm dữ liệu bảng tour
insert into tour values ('01',N'TOUR TPHCM - MŨI NÉ','03/10/2022','05/10/2022',N'3 ngày 2 đêm, Quý khách được tham quan Bàu Trắng - Lâu đài Rượu Vang','DXP01','DD02','KS01','XE16');
insert into tour values ('02',N'TOUR TPHCM - MIỀN TÂY','04/10/2022','05/10/2022',N'2 ngày 2 đêm, Đoàn đến Đất Mũi; Cột mốc tọa độ quốc gia, Panô biểu tượng mũi Cà Mau và Cột mốc Đường Hồ Chí Minh; Nhà thờ Tắc Sậy; Nhà máy phong điện; Nhà công tử Bạc Liêu; Chùa Som Rong','DXP01','DD04','KS10','XE30');
insert into tour values ('03',N'TOUR TPHCM - NHA TRANG','12/10/2022','14/10/2022',N'3 ngày 3 đêm, Quý khách được tham quan Đảo Bình Hưng - Tháp Bà Ponagar - Chùa Long Sơn - Nhà Yến; Du ngoạn Vịnh Nha Trang - Lặn ngắm San Hô - Khu giải trí  Vinpearl Land; Mua sắm dặc sản - Vườn Nho - Sài Gòn.','DXP01','DD03','KS02','XE45');
insert into tour values ('04',N'TOUR TPHCM - CẦN THƠ - CÔN ĐẢO','10/10/2022','13/10/2022',N'4 ngày 3 đêm, Quý khách được tham quan Nhà Cổ Bình Thủy và Đình Bình Thủy; Chùa Đất Sét; Địa ngục trần gian Côn Sơn; Chuồng cọp kiểu Pháp; viếng Nghĩa Trang Hàng Dương; Bãi Đầm Trầu','DXP01','DD05','KS09','MB');
insert into tour values ('05',N'TOUR HÀ NỘI - MIỀN TÂY','05/10/2022','08/10/2022',N'4 ngày 3 đêm, Quý khách được tham quan Nhà công tử Bạc Liêu; nhà máy Điện Gió Bạc Liêu; đất Mũi Cà Mau; Rừng Tràm Trà Sư; chợ Nổi Cái Răng','DXP02','DD11','KS10','MB');
insert into tour values ('06',N'TOUR ĐÀ NẴNG - NHA TRANG','16/10/2022','18/10/2022',N'3 ngày 3 đêm, Quý khách được tham quan Đảo Điệp Sơn; Trung tâm Ngọc Trai Long Beach Pearl Nha Trang; Vinpearl Land – Hòn Ngọc Việt','DXP03','DD03','KS02','XE30');
insert into tour values ('07',N'TOUR VŨNG TÀU - SAPA','01/10/2022','04/10/2022',N'4 ngày 3 đêm, Đoàn tham quan: Khu du lịch Hàm Rồng, với Cổng Trời,Sân Mây; Hồ Hoàn Kiếm với Đền Ngọc Sơn, Văn Miếu Quốc Tử Giám– Trường đại học đầu tiên của Việt Nam.','DXP04','DD07','KS08','MB')
insert into tour values ('08',N'TOUR TPHCM - PHÚ QUỐC','20/10/2022','22/10/2022',N'3 ngày 3 đêm, Quý khách được tham quan: Chùa Phù Dung, Chùa Tam Bửu, Lăng Mạc Cửu, Thạch Động Thôn Vân; Dinh Cậu; Grand World Phú Quốc; Hòn Gầm Ghì','DXP01','DD12','KS06','XEGN');
insert into tour values ('09',N'TOUR TPHCM - HÀ NỘI','16/10/2022','18/10/2022',N'3 ngày 3 đêm, Quý khách được tham quan tham quan: Hồ Hoàn Kiếm với Đền Ngọc Sơn, Văn Miếu Quốc Tử Giám; Hồ Tây với Đền Quán Thánh,Chùa Trấn Quốc','DXP01','DD01','KS03','MB');
insert into tour values ('10',N'TOUR ĐÀ NẴNG - HÀ NỘI','19/10/2022','24/10/2022',N'6 ngày 5 đêm, Quý khách được tham quan tham quan:Hồ Hoàn Kiếm với Đền Ngọc Sơn, Văn Miếu Quốc Tử Giám; Hồ Tây với Đền Quán Thánh,Chùa Trấn Quốc','DXP03','DD01','KS03','MB');
insert into tour values ('11',N'TOUR HÀ NỘI - PHÚ YÊN','24/10/2022','27/10/2022',N'4 ngày 3 đêm, Quý khách được tham quan tháp Nhạn; vịnh Vân Phong; Khu di tích Vũng Rô; Khu di tích Vũng Rô','DXP02','DD09','KS07','MB');
insert into tour values ('12',N'TOUR TPHCM- VŨNG TÀU','22/10/2022','23/10/2022',N'2 ngày 1 đêm, Quý khách được tham quan Đồi cừu Long Hải; bãi trước biển Vũng Tàu; Núi Minh Đạm','DXP01','DD06','KS05','XE16');
insert into tour values ('13',N'TOUR HÀ NỘI - PHÚ QUỐC','23/10/2022','28/10/2022',N'6 ngày 5 đêm, Quý khách được tham quan: Chùa Phù Dung, Chùa Tam Bửu, Lăng Mạc Cửu, Thạch Động Thôn Vân; Dinh Cậu; Grand World Phú Quốc; Hòn Gầm Ghì','DXP02','DD08','KS06','MB');
insert into tour values ('14',N'TOUR ĐÀ NẴNG - SAPA','05/10/2022','08/10/2022',N'4 đêm 3 ngày, Đoàn tham quan: Khu du lịch Hàm Rồng, với Cổng Trời,Sân Mây; Hồ Hoàn Kiếm với Đền Ngọc Sơn, Văn Miếu Quốc Tử Giám– Trường đại học đầu tiên của Việt Nam.','DXP03','DD07','KS08','MB');
insert into tour values ('15',N'TOUR TPHCM - ĐÀ LẠT','12/10/2022','14/10/2022',N'3 ngày 3 đêm, Quý khách được tham quan Cổng trời Đà Lạt View - Cánh đồng hoa (Cầu Vàng, Cầu tình yêu) - Nông trại cún Puppy Farm - Chùa Linh Phước - Ga Đà Lạt','DXP01','DD10','KS04','XEGN');
--Thêm dữ liệu bảng assignment
insert into assignment values('NV001','11')
insert into assignment values('NV001','12')
insert into assignment values('NV001','15')
insert into assignment values('NV001','02')
insert into assignment values('NV001','05')
insert into assignment values('NV002','10')
insert into assignment values('NV002','14')
insert into assignment values('NV002','04')
insert into assignment values('NV002','07')
insert into assignment values('NV002','09')
insert into assignment values('NV003','10')
insert into assignment values('NV003','14')
insert into assignment values('NV003','04')
insert into assignment values('NV003','07')
insert into assignment values('NV003','09')
insert into assignment values('NV004','01')
insert into assignment values('NV004','13')
insert into assignment values('NV004','03')
insert into assignment values('NV004','06')
insert into assignment values('NV004','08')
insert into assignment values('NV005','01')
insert into assignment values('NV005','13')
insert into assignment values('NV005','03')
insert into assignment values('NV005','06')
insert into assignment values('NV005','08')
insert into assignment values('NV006','01')
insert into assignment values('NV006','13')
insert into assignment values('NV006','03')
insert into assignment values('NV006','06')
insert into assignment values('NV006','08')
insert into assignment values('NV007','10')
insert into assignment values('NV007','14')
insert into assignment values('NV007','04')
insert into assignment values('NV007','07')
insert into assignment values('NV007','09')
insert into assignment values('NV008','11')
insert into assignment values('NV008','12')
insert into assignment values('NV008','15')
insert into assignment values('NV008','02')
insert into assignment values('NV008','05')
insert into assignment values('NV009','11')
insert into assignment values('NV009','12')
insert into assignment values('NV009','15')
insert into assignment values('NV009','02')
insert into assignment values('NV009','05')
--Thêm dữ liệu bảng customer
insert into customer values ('KH001', N'Huỳnh Thanh Phong', '11/08/1974', '0774834712', 'htp@gmail.com')
insert into customer values ('KH002', N'Đặng Ngọc Thủy', '06/06/1977', '0337167885', 'dnt@gmail.com')
insert into customer values ('KH003', N'Trần Hữu Dự', '18/05/1966', '08158131412', 'thd@gmail.com')
insert into customer values ('KH004', N'Phạm Thị Hoàng', '08/05/1985', '0698598156', 'pth@gmail.com')
insert into customer values ('KH005', N'Trần Anh Tuấn', '28/11/1986', '0480388428', 'tat@gmail.com')
insert into customer values ('KH006', N'Nguyễn Khánh Linh','05/02/1991','0903060745','linh91@gmail.com')
--Thêm dữ liệu bảng TourOrder
insert into TourOrder values ('1','KH003','02','30/09/2022 17:00:58','02/10/2022 17:15:16','30','1690000','0.3')
insert into TourOrder values ('2','KH001','05','03/10/2022 09:40:55','03/10/2022 13:02:16','10','5990000','0.3')
insert into TourOrder values ('3','KH004','03','03/10/2022 12:11:14','05/10/2022 22:59:43','4','1690000','0.0')
insert into TourOrder values ('4','KH005','03','07/10/2022 19:41:49','08/10/2022 19:00:25','2','1690000','0.0')
insert into TourOrder values ('5','KH003','15','08/10/2022 09:30:47','10/10/2022 18:47:05','35','1990000','0.35')
insert into TourOrder values ('6','KH002','09','10/10/2022 16:47:23','12/10/2022 05:10:09','15','1998000','0.15')
insert into TourOrder values ('7','KH001','11','10/10/2022 20:25:23',null,'15','3490000','0.3')
insert into TourOrder values ('8','KH006','10','09/10/2022 07:00:32',null,'5','5000000','0.03')
SELECT * FROM tour
SELECT * FROM employee
SELECT * FROM customer
SELECT * FROM transportation
SELECT * FROM departure_point
SELECT * FROM destination
SELECT * FROM position
SELECT * FROM assignment
SELECT * FROm hotel
SELECT * FROM TourOrder

--xóa dữ liệu ở bảng employee
delete from employee where idnhanvien = 'NV010'
--update dữ liệu vào bảng TourOrder
update TourOrder set ngaytratien = '10/10/2022 22:08:53' where iddondathang = '7'
update TourOrder set ngaytratien = '08/10/2022 22:59:43' where iddondathang = '3'
update TourOrder set ngaydat='01/10/2022 09:40:55' where idtour ='05'

--Truy vấn nhiều bảng (phép kết)
/* Hiển thị tên những tour đã được phân công cho từng nhân viên*/
select idnhanvien,tentour from assignment a
left join tour t
on a.idtour=t.idtour
/*Hiển thị tên nhân viên của từng tour*/
select idtour,hotenNV from employee e
right join assignment a
on e.idnhanvien=a.idnhanvien
order by idtour
/*Hiển thị tên điểm đến của từng tour*/
select idtour,tentour,tendiemden from tour t
left join destination d
on t.iddiemden=d.iddiemden
/*Hiển thị tên tour của từng đơn đặt hàng*/
select iddondathang, idkhachhang, tentour from tour t
right join TourOrder tr
on tr.idtour=t.idtour

--Truy vấn tính toán
/*Tìm những đơn hàng có giá vé (đã bao gồm giảm giá) > 40 triệu. Hiển thị iddondathang,idkhachhang,idtour,giatiendabaogomgiamgia*/
select iddondathang,idkhachhang,idtour,((giatien*sove)*(1-giamgia)) as giatiendabaogomgiamgia from TourOrder t
where ((giatien*sove)*(1-giamgia)) > '40000000'
/*Tìm những khách hàng có tuổi >50. Hiển thị idkhachhang,hotenKH,tuoi*/
select idkhachhang,hotenKH,(year(getdate())-year(ngaysinh)) as tuoi from customer
where (year(getdate())-year(ngaysinh)) > '50'
/*Tìm những tour có số ngày đi lớn hơn 3, nhỏ hơn 5. Hiển thị idtour,tentour,songay*/
select idtour,tentour,DATEDIFF(DAY,ngaydi,ngayve+1) as songay from tour
where DATEDIFF(DAY,ngaydi,ngayve+1) between '3' and '5'
/*Tìm những đơn hàng có số tiền giảm giá > 1000000. Hiển thị iddondathang,idkhachhang,idtour,sotienduocgiamgia*/
select iddondathang,idkhachhang,idtour,(giatien*sove*giamgia) as sotienduocgiamgia from TourOrder t
where (giatien*sove*giamgia) > '1000000'

--Truy vấn gom nhóm có điều kiện (having)
/*Tính số lượng tour theo điểm xuất phát với số lượng tour phải lớn hơn hoặc bằng 2. Hiển thị noixuatphat, soluongtour*/
select d.noixuatphat,count(t.idtour) as soluongtour from tour t, departure_point d
where t.idnoixuatphat=d.idnoixuatphat
group by d.noixuatphat
having count(t.idtour)>=2
/*Tính số lượng tour theo khách sạn với số lượng tour phải lớn hơn hoặc bằng 2. Hiển thị tenhotel, diachi soluongtour*/
select h.tenhotel,count(t.idtour) as soluongtour from tour t, hotel h
where t.idhotel=h.idhotel
group by h.tenhotel
having count(t.idtour)>=2
/*Tính tổng số vé theo các tour với tổng số vé phải lớn hơn 20.*/
select idtour,sum(sove) as N'Tổng số vé' from TourOrder
group by idtour
having sum(sove)>20
/*Tính số lượng khách hàng theo tuổi với tuổi lớn hơn 40*/
select count(idkhachhang) as soluongkhachhang,(year(getdate())-year(ngaysinh)) as tuoi from customer
group by (year(getdate())-year(ngaysinh))
having (year(getdate())-year(ngaysinh)) > 40

--Truy vấn con
/*Tìm những khách hàng đặt hàng với số lượng vé lớn hơn hoặc bằng 10. Hiển thị idkhachhang, hotenKH, sdt, email.*/
select c.idkhachhang,c.hotenKH,c.sdt,c.email from customer c
where idkhachhang in (select idkhachhang from TourOrder where sove >= '10')
/*Tìm những nhân viên của tour 10. Hiển thị idnhanvien, hotenNV, sdt*/
select e.idnhanvien,e.hotenNV,e.sdt from employee e
where idnhanvien in (select idnhanvien from assignment where idtour = '10')
/*Tìm những khách hàng đặt vé tour 03. Hiển thị idkhachhang,hotenKH,ngaysinh,sdt,email*/
select * from customer c
where idkhachhang in (select idkhachhang from TourOrder where idtour = '03')
/*Tìm những nhân viên có chức vụ HDV, làm tại tour 01,02,03. Hiển thị idnhanvien,hotenNV,sdt,idchucvu*/
select * from employee 
where idchucvu='HDV'and idchucvu in (select idchucvu from assignment where idtour in ('01','02','03'))


/*Table function: 
Tạo function khi nhập độ tuổi bắt đầu và độ tuổi kết thúc, trả về bảng hiển thị id khách hàng và tuổi của khách hàng nằm giữa 2 độ tuổi đó*/
create function Cus_Age
(
	@start_age int,
	@end_age int
)
returns table
as
return
	select idkhachhang, (year(getdate())-year(ngaysinh)) as Tuoi
	from customer
	where (year(getdate())-year(ngaysinh)) between @start_age and @end_age
/*Thực thi hàm Cus_Age*/
select * from Cus_Age (20,40)

/*Table function đa câu lệnh: Tạo function trả về bảng bao gồm nhân viên và khách hàng của các tour.
Hiển thị id của nhân viên hoặc khách hàng đó; idtour mà NV hoặc KH đó tham gia và cho biết danh tính là NV hay KH*/
create function TourList()
returns @tourlist table
(
	IDKH_NV varchar(10),
	ID_tour varchar(10),
	DanhTinh nvarchar(50)
)
as
begin
	insert into @tourlist
	select idkhachhang, idtour, 'Khach Hang' from TourOrder;

	insert into @tourlist
	select idnhanvien, idtour, 'Nhan Vien' from assignment;
	return;
end;
/*Thực thi hàm TourList()*/
select * from TourList()
order by ID_tour

/*Tạo procedure cho biết trạng thái của đơn hàng: 
Nếu thời gian thanh toán quá 3 ngày sau khi đặt thì Vé sẽ bị hủy, ngược lại thì Đặt vé thành công
Nếu thời gian đặt vé còn trống thì Đơn hàng chưa hoàn tất
Nếu nhập sai mã đơn hàng thì hiển thị Mã đơn hàng không tồn tại*/
create proc sp_OrderStatus
(
	@ID_dondathang varchar(10)
)
as
begin
	if exists
	(
		select iddondathang from TourOrder
		where DATEDIFF(Day,ngaydat,ngaytratien)>3 and iddondathang = @ID_dondathang
	)
	begin
		print N'Vé đã bị hủy vì quá hạn thanh toán.';
	end
	else
	if exists
	(
		select iddondathang from TourOrder
		where DATEDIFF(Day,ngaydat,ngaytratien)<=3 and iddondathang = @ID_dondathang
	)
	begin
		print N'Đặt vé thành công.';
	end
	if exists
	(
		select iddondathang from TourOrder
		where DATEDIFF(Day,ngaydat,ngaytratien) is null and iddondathang = @ID_dondathang
	)
	begin
		print N'Đặt vé chưa thành công. Quý khách vui lòng thanh toán trong vòng 3 ngày sau khi đặt.';
	end
	if not exists
	(
		select iddondathang from TourOrder
		where iddondathang = @ID_dondathang
	)
	begin
		print N'Mã đơn hàng không tồn tại';
	end
end;

/*Thực hiện procedure sp_OrderStatus*/
--TH1: Đặt vé thành công
exec sp_OrderStatus '1';
--TH2: Vé bị hủy
exec sp_OrderStatus '3';
--TH3: Đơn hàng chưa hoàn tất
exec sp_OrderStatus '8';
--TH4: Mã đơn hàng không tồn tại
exec sp_OrderStatus 'abc';

/*Tạo user và phân quyền cho các nhân viên quản lý*/
create login QuanLy with password = '123'
create login QuanLy2 with password = '123'
create login QuanLy3 with password = '123'

create user NV003 for login QuanLy
create user NV006 for login QuanLy2
create user NV008 for login QuanLy3

grant select,update,insert,delete on assignment to NV003
grant select,update,insert,delete on assignment to NV006
grant select,update,insert,delete on assignment to NV008

/*Liệt kê thông tin của tất cả các tour*/
SELECT * FROM tour
/*Liệt kê ID, tên, địa chỉ, số điện thoại của các khách sạn*/
SELECT * FROM hotel
/*Liệt kê ID nhân viên, họ tên nhân viên của tất cả các nhân viên*/
SELECT idnhanvien, hotenNV 
FROM employee
/*Liệt kê ID, họ tên, số điện thoại của tất cả khách hàng*/
SELECT idkhachhang, hotenKH, sdt
from customer

/*Liệt kê ID, tên tour, ngày đi, ngày về của các tour xuất phát từ TP HCM*/
select tentour, ngaydi, ngayve
from tour
where tentour like '%TPHCM%'
/*Liệt kê ID nhân viên, họ tên nhân viên của các nhân viên là tài xế*/
select idnhanvien, hotenNV
from employee
where idchucvu like 'TX'
/*Liệt kê thông tin của các tour đi Nha Trang bằng xe 30 chỗ*/
select * from tour
where iddiemden = 'DD03' and idphuongtien = 'XE30'
/*Liệt kê thông tin của các tour xuất phát từ TP HCM và đi trong 2 ngày*/
select *
from tour
where idnoixuatphat like 'DXP01' and DATEDIFF(DAY,ngaydi,ngayve+1)='2'

--Truy vấn có gom nhóm (group by)
/*Tính số lượng tour của mỗi điểm đến*/
select iddiemden, count(idtour) as 'soluongtour'
from tour
group by iddiemden
/*Tính số lượng vé đã được đặt của các tour*/
select idtour, sum(sove) as 'tongsove'
from TourOrder
group by idtour
/*Tính số lượng tour được phân của mỗi nhân viên*/
select distinct b.idnhanvien, count(idtour) as sotourthamgia
from employee b full outer join assignment a on a.idnhanvien=b.idnhanvien
group by b.idnhanvien
/*Tính tổng thành tiền của những đơn hàng*/
select iddondathang, sum(giatien*sove*(1-giamgia)) as 'Thanhtien'
from TourOrder
group by iddondathang

--Truy vấn có sử dụng phép giao, hội, trừ
/*Phép giao: Liệt kê những tour đã được đặt*/
select idtour, tentour
from tour
where idtour in (select idtour
from tour
intersect
select idtour 
from TourOrder)
/*Phép giao: Liệt kê những tour chưa trả tiền và tên khách hàng đặt những tour đó*/
select iddondathang, idtour, customer.idkhachhang, customer.hotenKH, ngaydat
from TourOrder, customer
where ngaytratien is null and customer.idkhachhang= TourOrder.idkhachhang

/*Phép hội: Liệt kê các tour đã được đặt*/
select distinct t.idtour, tentour
from tour t, TourOrder tord
where t.idtour = tord.idtour and t.idtour in (select idtour
from tour
union
select idtour 
from TourOrder)
/*Phép trừ: Liệt kê những tour chưa được đặt*/
select distinct t.idtour, tentour
from tour t
where t.idtour in (select  idtour
from tour
except
select idtour 
from TourOrder)

--Truy vấn chéo
/*Lập bảng tổng số vé mỗi khách phải trả*/
SELECT idkhachhang,
[01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15]
FROM
(select distinct customer.idkhachhang, idtour, sove
from TourOrder, customer
where TourOrder.idkhachhang = customer.idkhachhang) AS BangNguon
PIVOT
(
sum(sove)
FOR idtour IN ([01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15])
) AS BangChuyen;

/*Lập bảng số lượng tiền các tour mà khách hàng đã đặt*/
SELECT idkhachhang,
[01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15]
FROM
(select distinct customer.idkhachhang, idtour, (sove * giatien*(1-giamgia))
as tongtien
from TourOrder, customer
where TourOrder.idkhachhang = customer.idkhachhang) AS BangNguon
PIVOT
(
sum(tongtien)
FOR idtour IN ([01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15])
) AS BangChuyen;
/*Lập bảng phân công nhân viên vào các tour, (đánh số 1 nếu nhân viên được phân công vào tour)*/
select idnhanvien,
[01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15]
from
(select distinct employee.idnhanvien, idtour
from employee, assignment
where employee.idnhanvien= assignment.idnhanvien) as BangNguon
PIVOT
(count(idtour)
for idtour IN ([01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15]) 
) as BangChuyen;
/*Lập bảng tổng ngày làm việc theo tour của mỗi nhân viên*/
select idnhanvien,
[01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15]
from
(select distinct employee.idnhanvien, tour.idtour, DATEDIFF(DAY,ngaydi,ngayve+1) as songaydi
from employee, assignment, tour
where employee.idnhanvien= assignment.idnhanvien and tour.idtour=assignment.idtour) as BangNguon
PIVOT
(sum(songaydi)
for idtour IN ([01],[02],[03],[04],[05],[06],[07],[08],[09],[10],[11],[12],[13],[14],[15]) 
) as BangChuyen;

/*Tạo procedure sao lưu và phục hồi dữ liệu (using master)*/
create procedure Backupdatabase
as
begin
--Create cursor
declare @name nvarchar(50);
declare @path nvarchar(256);
declare @filename nvarchar (256);
declare @filedate nvarchar (20);

set @path = 'c:\backup\';
select @filedate=CONVERT(varchar(20), getdate(), 112)
print @filedate

--Define cursor
declare db_cursor cursor for
select name
from master.dbo.sysdatabases
where name not in ('master', 'model','msdb', 'tempdb', 'qlduannhanvien', 'qlnhanvien2')
open db_cursor
fetch next from db_cursor into @name
while @@FETCH_STATUS = 0
begin
	set @filename = @path + @name + '_' + @filedate + '.bak.';
	backup database @name to disk = @filename
	fetch next from db_cursor into @name
end 
close db_cursor
deallocate db_cursor
end
--gọi procedure backup
exec Backupdatabase

/*Tạo function tính tổng thành tiền cho mỗi đơn hàng*/
go
create function dbo.Tongthanhtien
(
	@sove int, 
	@giatien dec(12,2), 
	@giamgia dec(12,2)
)
returns dec(12,2)
as
begin
	return @giatien*@sove*(1-@giamgia);
end
go
/*gọi hàm*/
select distinct iddondathang, customer.idkhachhang, hotenKH, idtour, dbo.Tongthanhtien(sove, giatien, giamgia) as tongthanhtien
from TourOrder, customer
where customer.idkhachhang=TourOrder.idkhachhang

/*Tạo function tính số ngày đi của mỗi tour*/
go
create function dbo.Songaydi
(
	@ngaydi datetime,
	@ngayve datetime
)
returns int
as
begin
	return day(@ngayve)-day(@ngaydi);
end;
--gọi hàm
select distinct idtour, tentour, dbo.Songaydi(ngaydi, ngayve) as N'Số ngày đi'
from tour

/*Ràng buộc số lượng tour tối đa mỗi nhân viên tham gia*/
-- 1 nhân viên không tham gia quá 5 tour
go
create trigger sotourtoida on assignment for insert
as
if 
(select count(a.idnhanvien)
from assignment a, inserted b
where a.idnhanvien = b.idnhanvien)>6
begin
	print N'Số tour mỗi nhân viên tham gia không quá 6'
	rollback tran
end

/*Ràng buộc số vé được phép đặt không vượt quá sức chứa của phương tiện phục vụ tour đó và tự cập nhật số vé còn lại khi thực hiện lệnh insert, update, delete*/
--tính số vé còn lại
alter table tour add soveconlai int
update tour set soveconlai = succhua
from tour a, transportation b
where a.idphuongtien =b.idphuongtien
update tour set soveconlai = soveconlai - tongsove 
from TourOrder a, transportation b, tour c,(select idtour, sum(sove) as tongsove
from TourOrder c
group by c.idtour) as bangtam
where c.idtour = a.idtour and c.idphuongtien = b.idphuongtien
and c.idtour = bangtam.idtour
--update
--Nếu cập nhật số vé vượt quá sức chứa thì thông báo đã vượt quá sức chứa
go
create trigger soveconlaisauupdate on TourOrder
for update
as
declare @t int
select @t = count(*)
from tour a, deleted b, inserted c
where a.idtour = b.idtour and a.idtour = c.idtour and a.soveconlai + b.sove -c.sove <0
if(@t>0)
	begin
		print N'Số vé được đặt đã vượt quá sức chứa của phương tiện'
		rollback tran
	end
else 
	begin
		update tour set soveconlai = succhua - tongsove 
from TourOrder a, transportation b, tour c,(select idtour, sum(sove) as tongsove
from TourOrder c
group by c.idtour) as bangtam
where c.idtour = a.idtour and c.idphuongtien = b.idphuongtien
and c.idtour = bangtam.idtour
	end
--update soveconlai sau insert
go
create trigger soveconlaisauinsert on TourOrder
for insert
as
declare @t int
select @t = count(*)
from tour a, inserted c
where a.idtour = c.idtour and a.soveconlai -c.sove <0
if(@t>0)
	begin
		print N'Số vé được đặt đã vượt quá sức chứa của phương tiện'
		rollback tran
	end
else 
	begin
		update tour set soveconlai = soveconlai - sove from inserted
		where tour.idtour = inserted.idtour
	end
-- delete
--Tăng số lượng vé còn lại khi xóa đơn đặt hàng
go
create trigger soveconlaisaudelete on TourOrder
for delete 
as
begin
	update tour set soveconlai = soveconlai + sove from deleted
	where tour.idtour = deleted.idtour
end

/*Tạo procedure sao lưu*/
create procedure SaoLuuDuLieu(@tencsdl nvarchar(200),@tentaptin nvarchar(200))
as
begin
	backup database @tencsdl to disk = @tentaptin
end
--Gọi procedure sao lưu 
exec SaoLuuDuLieu 'qltour', 'c:\backup\qltour.bak'

/*Phục hồi cơ sở dữ liệu khi bị xóa hoàn toàn*/
go
create procedure PhucHoiCSDL (@tencsdl nvarchar(100),@tenpath nvarchar(256))
as
begin 
	restore database @tencsdl from disk = @tenpath
end
--Thực thi lệnh phục hồi
exec PhucHoiCSDL'qltour', 'c:\backup\qltour.bak'

/*restore lại khi còn 2 file mdf và ldf*/
if not exists (select name from sysdatabases where name ='qltour')
	exec sp_attach_db 'qltour','c:\backup\qltour.mdf','c:\backup\qltour_log.ldf'
/*restore lại khi còn 2 file mdf*/
if not exists (select name from sysdatabases where name = 'qltour')
	exec sp_attach_single_file_db 'QLT','c:\backup\qltour.mdf'
