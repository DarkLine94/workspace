/**
 * データベースの初期化
 *  データベース名：reviewdb
 *  接続ユーザ：reviewdb_admin@localhost
 *  接続パスワード：admin123
 */ 
drop database if exists reviewdb;
drop user if exists reviewdb_admin@localhost;
create database reviewdb character set utf8;
grant all privileges on reviewdb.* to 'reviewdb_admin'@'localhost' identified by 'admin123'; 

use reviewdb;

/**
 * テーブル定義群：詳細の定義についてはデータベース定義書を参照。
 */
-- テーブル群の初期化：既存のテーブルであれば削除しておく
drop table if exists reviews;
drop table if exists restaurants;
drop table if exists areas;

-- 地域テーブルの定義
create table areas (
  id tinyint unsigned not null unique auto_increment, 
  name varchar(10) not null, 
  created timestamp not null,
  primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- restaurantsテーブル
create table restaurants (
  id mediumint unsigned not null unique auto_increment,
  name varchar(100) not null, 
  detail text, 
  image varchar(100) unique, 
  area tinyint unsigned not null, 
  created timestamp not null,
  primary key(id),
  foreign key(area) references areas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- レビュテーブル
create table reviews (
  id mediumint unsigned not null unique auto_increment,
  restaurant mediumint unsigned not null, 
  comment text, 
  reviewer varchar(100), 
  rating tinyint unsigned not null, 
  created timestamp not null, 
  primary key(id), 
  foreign key(restaurant) references restaurants(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/** サンプルレコードの投入 */
-- 地域の登録
delete from areas;
-- insert into areas (name) values ('-- 地域を選んで下さい --');
insert into areas (name) values ("福岡");
insert into areas (name) values ("神戸");
insert into areas (name) values ("伊豆");

-- レストランの登録
delete from restaurants;
insert into restaurants (name, detail, image, area ) 
  							 values ('Wine Bar ENOTECA', '常時10種類以上の赤・白ワインをご用意しています。\n記念日にご来店ください。', 'restaurant_1.jpg', 2);
insert into restaurants (name, detail, image, area ) 
								 values ('スペイン料理 ポルファボール！', '味が自慢。スペイン現地で学んだシェフが出す味は本物です。', 'restaurant_2.jpg', 3);
insert into restaurants (name, detail, image, area ) 
								 values ('パス・パスタ', '本当のパスタを味わうならパス・パスタで！\n休日の優雅なランチタイムに是非どうぞ。', 'restaurant_3.jpg', 1);
insert into restaurants (name, detail, image, area ) 
								 values ('レストラン「有閑」', '広い店内で、お昼の優雅なひと時を過ごしませんか？', 'restaurant_4.jpg', 2);
insert into restaurants (name, detail, image, area ) 
								 values ('ビストロ「ルーヴル」', '高層ビル42階のビストロで、県内が一望できる。恋人とのひと時をここで過ごしませんか。', 'restaurant_5.jpg', 1);
insert into restaurants (name, detail, image, area ) 
								 values ('海沿いのレストラン La Mer', '海が見える、海沿いのレストランです。', 'restaurant_6.jpg', 2);
insert into restaurants (name, detail, image, area ) 
								 values ('レストラン さくら', '四季折々の自然を楽しむ伊豆市に、ひっそりと佇む隠れ家レストラン。\n旅行でいらっしゃった方も、お近くの方も、お気軽にお立ち寄りください。', 'restaurant_7.jpg', 3);

-- レビュの登録
delete from reviews;
insert into reviews (restaurant, reviewer, comment, rating) 
						 values (7, 'totsuka', '常連の者で、いつも夫婦で伺っています。席数が少ないので予約した方が安心ですが、その分落ち着いて食事できますよ。コースのメインは基本的にシェフにお任せ。来るたびに、新しい味との出会いを楽しめるお店です。', 4);
insert into reviews (restaurant, reviewer, comment, rating) 
						 values (7, 'oie', '説明の通り、喧騒を外れた場所にひっそりとあるレストランでした。伊豆市には初めて来ましたが、本当に桜がきれいですね。何よりも空気がきれいで、いいリフレッシュになりました。', 5);