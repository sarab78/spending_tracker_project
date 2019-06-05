DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;
DROP TABLE budget;


CREATE TABLE tags
(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE merchants
(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL4 primary key,
  merchant_id INT4 REFERENCES merchants(id),
  tag_id INT4 REFERENCES tags(id),
  amount INT4,
  timestamp VARCHAR
);

CREATE TABLE budgets
(
  id SERIAL4 primary key,
  amount INT8
);
