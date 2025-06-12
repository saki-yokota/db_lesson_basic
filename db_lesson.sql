SHOW DATABASES;

USE db_lesson;

SHOW TABLES;

-- Q1
CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DESC departments;

-- Q2
ALTER TABLE people
ADD department_id INT UNSIGNED NULL AFTER email;

-- Q3
INSERT INTO departments (name)
VALUES
    ('営業'),
    ('開発'),
    ('経理'),
    ('人事'),
    ('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
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

INSERT INTO reports (person_id, content)
VALUES
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
UPDATE people
SET department_id = 3
WHERE age BETWEEN 10 AND 30;

UPDATE people
SET department_id = 4
WHERE age > 30 AND gender = 2;

UPDATE people
SET department_id = 5
WHERE age > 40 AND age < 50 AND gender = 1;

UPDATE people
SET department_id = 1
WHERE age IS NULL;

-- Q5
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

-- Q6
SELECT name, email, age
FROM people
WHERE department_id = 1
ORDER BY created_at;

-- Q7
SELECT name
FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
   OR (gender = 1 AND age BETWEEN 40 AND 49);

-- Q8
SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC;

-- Q9
SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2 AND gender = 2;

-- Q10
SELECT p.name, d.name, r.content
FROM people p
INNER JOIN reports r USING (person_id)
INNER JOIN departments d USING (department_id);

-- Q11
SELECT p.name
FROM people p
LEFT JOIN reports r USING (person_id)
WHERE r.person_id IS NULL;

-- Q　大文字と小文字を書き分けなければいけない理由はなんでしょうか？
識別子（テーブル名・カラム名など）は、データベースの設定やOSによって
大文字・小文字が区別される場合があり、また、人間が読みやすくするために
書き分けることが推奨されているため。