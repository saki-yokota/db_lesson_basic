show databases;

use db_lesson;

show tables;

-- Q1
create table departments (
  department_id int unsigned auto_increment primary key not null,
  name varchar(20) not null,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

desc departments;

-- Q2
alter table people add department_id int unsigned null after email;

-- Q3
insert into departments (name)
values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

insert into people (name, email, department_id, age, gender)
values
('田中 海斗', 'ktanaka@gizumo.jp', 1, 26, 1),
('高橋 彩香', 'atakahashi@gizumo.jp', 1, 23, 2),
('伊藤 直樹', 'nito@gizumo.jp', 1, 38, 1),
('中村 真理子', 'mnakamura@gizumo.jp', 2, 34, 2),
('山本 剛志', 'tyamamoto@gizumo.jp', 2, 46, 1),
('小林 恵美', 'ekobayashi@gizumo.jp', 2, 41, 2),
('加藤 浩二', 'kkato@gizumo.jp', 2, 55, 1),
('渡辺 敦子', 'aeatanabe@gizumo.jp', 3, 52, 2),
('石田 清', 'kishida@gizumo.jp', 4, 68, 1),
('藤田 和子', 'kfujita@gizumo.jp', 5, 64, 2);

insert into reports (person_id, content)
values
(22, '本日は既存顧客とのオンライン商談を2件行い、新商品の提案に前向きな反応をいただきました。'),
(23, '展示会での反響をもとに見込み顧客へアプローチを行い、3件のアポイントを獲得しました。'),
(24, 'チーム内の営業進捗を集計・共有し、月末に向けた戦略ミーティングを実施しました。'),
(25, '新しい教育支援システムの仕様レビューを行い、修正点を設計チームにフィードバックしました。'),
(26, '建築関連のCADツール改善に向けたアルゴリズムの検証を行い、性能向上を確認しました。'),
(27, '人材管理システムのUI改善案をまとめ、社内レビュー会でプレゼンを行いました。'),
(28, '生産ライン管理ソフトの動作テストを行い、工場側との調整事項を整理しました。'),
(29, '月次決算処理を進め、経費精算に関する不備3件を各部に連絡しました。'),
(30, '新卒採用向け説明会の資料を更新し、OB・OG訪問の調整を行いました。'),
(31, '社内サーバーのバックアップ設定を再確認し、定期メンテナンススケジュールを見直しました。');

-- Q4
update people set department_id = 3 where age between 10 and 30;
update people set department_id = 4 where age > 30 and gender = 2;
update people set department_id = 5 where age > 40 and age < 50 and gender = 1;
update people set department_id = 1 where age is null;

-- Q5
select name, age from people where gender = 1 order by age desc;

-- Q6 SELECT `name`, `email`, `age` FROM `people` WHERE `department_id` = 1 ORDER BY  `created_at`;
作成日時順で部署が営業の人の名前とメールアドレスと年齢をpeopleというテーブルから取得する。

-- Q7
select name from people where (gender = 2 and age between 20 and 29) or (gender = 1 and age between 40 and 49);

-- Q8
select * from people where department_id = 1 order by age asc;

-- Q9
select avg(age) as average_age from people where department_id = 2 group by gender = 2;

-- Q10
select p.name, p.department_id, r.content from people p join reports r using (person_id);

-- Q11
select p.name, p.department_id, r.content from people p left outer join reports r using (person_id);