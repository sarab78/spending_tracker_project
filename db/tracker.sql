DROP TABLE merchants;
DROP TABLE transactions;
DROP TABLE tags;


CREATE TABLE tags
(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE merchants
(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL8 primary key,
  merchant_id INT8 REFERENCES merchants(id),
  tags_id INT8 REFERENCES tags(id),
  amount INT8
);
