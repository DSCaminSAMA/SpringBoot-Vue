/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.6.12-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `tb_goods` (
	`id` bigint (20),
	`title` varchar (3000),
	`price` varchar (300),
	`image` varchar (3000),
	`brand` varchar (300)
); 
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('691300','三星 B9120 钛灰色 联通3G手机 双卡双待双通','3699','http://img10.360buyimg.com/n1/s450x450_jfs/t3457/294/236823024/102048/c97f5825/58072422Ndd7e66c4.jpg','三星');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('738388','三星 Note II (N7100) 云石白 联通3G手机','1699.00','http://img10.360buyimg.com/n1/s450x450_jfs/t3457/294/236823024/102048/c97f5825/58072422Ndd7e66c4.jpg','三星');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('741524','三星 Note II (N7100) 钛金灰 联通3G手机','1699.00','http://img10.360buyimg.com/n1/s450x450_jfs/t3457/294/236823024/102048/c97f5825/58072422Ndd7e66c4.jpg','三星');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('816448','三星 Note II (N7100) 钻石粉 联通3G手机','1699.00','http://img10.360buyimg.com/n1/s450x450_jfs/t3457/294/236823024/102048/c97f5825/58072422Ndd7e66c4.jpg','三星');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('974401','苹果(Apple) iPhone 5s (A1533) 16GB 银色 电信3G手机','4099.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3160/284/298314156/78089/fd106c0c/57b00f93Nc77f215f.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('975641','苹果(Apple) iPhone 5s (A1533) 16GB 金色 电信3G手机','4099.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3160/284/298314156/78089/fd106c0c/57b00f93Nc77f215f.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('976898','苹果 iPhone 4S 8G 白色 联通3G手机','1999.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3712/359/495301542/119558/da44ceda/580cb3adN14e04e47.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1057740','苹果(Apple) iPhone 5s (A1530) 16GB 深空灰色 移动联通4G手机','4129.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3160/284/298314156/78089/fd106c0c/57b00f93Nc77f215f.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1057741','苹果(Apple) iPhone 5s (A1530) 16GB 银色 移动联通4G手机','4119.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3160/284/298314156/78089/fd106c0c/57b00f93Nc77f215f.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1057746','苹果(Apple) iPhone 5s (A1530) 16GB 金色 移动联通4G手机','4119.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3160/284/298314156/78089/fd106c0c/57b00f93Nc77f215f.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1124089','华为 Ascend P7 (P7-L00) 黑色 联通4G手机 双卡双待双通','2388.00','http://img12.360buyimg.com/n1/s450x450_jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg','华为');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1124090','华为 Ascend P7 (P7-L00) 白色 联通4G手机 双卡双待双通','2388.00','http://img12.360buyimg.com/n1/s450x450_jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg','华为');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1124331','华为 Ascend P7 (P7-L05/L07) 黑色 移动4G手机','2388.00','http://img12.360buyimg.com/n1/s450x450_jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg','华为');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1124332','华为 Ascend P7 (P7-L05/L07) 白色 移动4G手机','2388.00','http://img12.360buyimg.com/n1/s450x450_jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg','华为');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1124365','华为 Ascend P7 (P7-L09) 白 电信4G手机 双卡双待双通','2388.00','http://img12.360buyimg.com/n1/s450x450_jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg','华为');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1124369','华为 Ascend P7 (P7-L09) 黑 电信4G手机 双卡双待双通','2388.00','http://img12.360buyimg.com/n1/s450x450_jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg','华为');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217493','苹果（Apple）iPhone 6 (A1589) 16GB 金色 移动4G手机','5088.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217494','苹果（Apple）iPhone 6 (A1589) 16GB 深空灰色 移动4G手机','4999.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217499','苹果（Apple）iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机','5288.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217500','苹果（Apple）iPhone 6 (A1586) 16GB 深空灰色 移动联通电信4G手机','5288.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217501','苹果（Apple）iPhone 6 (A1586) 16GB 银色 移动联通电信4G手机','5288.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217508','苹果（Apple）iPhone 6 (A1586) 64GB 金色 移动联通电信4G手机','5988.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217509','苹果（Apple）iPhone 6 (A1586) 64GB 深空灰色 移动联通电信4G手机','5988.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217510','苹果（Apple）iPhone 6 (A1586) 64GB 银色 移动联通电信4G手机','5988.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217516','苹果（Apple）iPhone 6 (A1586) 128GB 金色 移动联通电信4G手机','6488.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217517','苹果（Apple）iPhone 6 (A1586) 128GB 深空灰色 移动联通电信4G手机','6488.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217518','苹果（Apple）iPhone 6 (A1586) 128GB 银色 移动联通电信4G手机','6488.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217524','苹果（Apple）iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机','6088.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217525','苹果（Apple）iPhone 6 Plus (A1524) 16GB 深空灰色 移动联通电信4G手机','5888.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217526','苹果（Apple）iPhone 6 Plus (A1524) 16GB 银色 移动联通电信4G手机','5988.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217533','苹果（Apple）iPhone 6 Plus (A1524) 64GB 深空灰色 移动联通电信4G手机','6788.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217534','苹果（Apple）iPhone 6 Plus (A1524) 64GB 银色 移动联通电信4G手机','6788.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217539','苹果（Apple）iPhone 6 Plus (A1524) 128GB 金色 移动联通电信4G手机','7388.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217540','苹果（Apple）iPhone 6 Plus (A1524) 128GB 深空灰色 移动联通电信4G手机','7388.00','http://img11.360buyimg.com/n1/s450x450_jfs/t3286/138/5179502023/67325/93373553/585b52b7N8d296f80.jpg','苹果');
insert into `tb_goods` (`id`, `title`, `price`, `image`, `brand`) values('1217541','三星 S10','5999','/upload/20190507145539下载.jpg','三星');
