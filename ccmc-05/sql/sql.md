# SQLとは？

データベースに蓄積されているレコードを効率よく再利用するためのプログラミング言語をSQLという（Structured Query Language）。

データベースを操作するには以下の３種類の言語がある：

	1. データ定義言語（Data Definition Language）─ データベース定義およびテーブル定義を行うための言語
	2. データ操作言語（Data Manupilate Language）─ レコードを抽出したり編集するための言語
		 CRUD操作を実現する。
	3. データ制御言語（Data Control Language）─ レコードにアクセスするための権限を操作する言語
		 権限を付与したり削除するような管理を実現する。

# CRUD操作

## CRUD操作とは

	データベースに格納するデータ（レコード）に対して行う操作

	1. Creste ─ テーブルへレコードを挿入する
	2. Read ─ テーブルからレコードを読み出す
	3. Update ─ テーブルに格納されているレコードを更新する
	4. Delete ─ テーブルからレコードを削除する

	データベースにおけるレコード操作は以上の４つの操作しかない。

## SQL文

	1. Create ─ INSERT文（insert statement）
		【書式】insert into table_name [(field_name_1, field_name_2, ..., field_name_n)] values (field_value_1, field_value_2, ..., field_value_n);

		・フィールドfield_name_nに設定する値はfield_value_nに対応する。
		・すべてのフィールドに値を設定する場合はvalues句の前にフィールド名リストを省略することができる。

		ex）membersテーブルに、id「007」、名前「ジェームズ・ボンド」、性別「男性」からなるレコードを挿入する場合
				insert into mebers (id, name, gender) values ('007', 'ジェームズ・ボンド', '男性');
	
	2. Read ─ SELECT文（select statement）
		【書式】select (*|field_name_1, field_name_2, ..., field_name_n) from table_name [where ....[order by [(ASC|DESC)]]];

		・selectに続けて抽出するフィールドを「,」区切りで指定する。ただし、すべてのフィールドを指定する場合は「*」で省略することができる。
		・WHERE句（where phrase）抽出するレコードを指定するための条件
		・ORDER By句（order by phrase）抽出したレコードの並べ替えを指定する（ASC：昇順、DESC：降順）。

		ex）itemsテーブルからid「1001」のレコードを抽出する場合
				select * from items where id = 1001;
	
	3. Update ─ UPDATE文（update statement）
		【書式】update table_name set field_name_1 = field_value_1, field_name_2 = field_value_2, ..., field_name_n = field_value_n [where ...];

		・WHERE句　更新対象となるレコードの条件（更新対象の条件を指定しない場合はすべてのレコードの指定フィールドが更新されてしまうので注意）
	
		ex.1）employeesテーブルのid「E18001」の社員の住所を「alaska」に変更する場合
				update employees set address = 'alaska' where id = 'E18001';

		ex.2）employeesテーブルのsalaryフィールドを一律25%アップする場合
				update employees set salary = salary * 1.25;

	4. Delete ─ DELETE文（delete statement）
		【書式】delete from table_name [where ...];

		・WHERE句　削除対象となるレコードの条件（多くの場合はテーブルの主キーを指定するが、指定されない場合はテーブルのすべてのレコードが削除されるので注意）

		ex）productsテーブルからid「P-00023」を削除する場合
				delete from products where id = 'P-00023';
