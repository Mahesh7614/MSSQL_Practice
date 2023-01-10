CREATE TABLE invoices (
  id int IDENTITY PRIMARY KEY,
  customer_id int NOT NULL,
  total decimal(10, 2) NOT NULL DEFAULT 0 CHECK (total >= 0)
);

CREATE TABLE invoice_items (
  id int primary key,
  invoice_id int  NOT NULL,
  item_name varchar(100) NOT NULL,
  amount decimal(10, 2) NOT NULL CHECK (amount >= 0),
  tax decimal(4, 2) NOT NULL CHECK (tax >= 0),
  FOREIGN KEY (invoice_id) REFERENCES invoices (id)
);

BEGIN TRANSACTION;
INSERT INTO invoices (customer_id, total)
VALUES (100, 0);
INSERT INTO invoice_items (id, invoice_id, item_name, amount, tax)
VALUES (10, 1, 'Keyboard', 70, 0.08),
       (20, 1, 'Mouse', 50, 0.08);
IF(@@ERROR > 0)  
BEGIN  
    ROLLBACK TRANSACTION   -- changes are not saved
END  
ELSE  
BEGIN  
   COMMIT TRANSACTION   -- changes are saved
END  