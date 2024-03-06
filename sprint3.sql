# Nivell 1

# Exercici 1
CREATE TABLE IF NOT EXISTS  credit_card  (
   id VARCHAR(15) PRIMARY KEY,
   iban VARCHAR(50),
   pin varchar(4),
   cvv int,
   exp_date date,
   act_date date
);

alter table credit_card rename column exp_date to expiring_date;
alter table credit_card add column pan varchar(50) not null;
alter table credit_card drop column act_date;

ALTER TABLE `transactions`.`credit_card` 
CHANGE COLUMN `expiring_date` `expiring_date` VARCHAR(10) NULL DEFAULT NULL ;

alter table transaction
    add FOREIGN key FK_credit_card_id(credit_card_id)
    references credit_card(id);

# Exercici 2
select *
from credit_card 
where id = 'CcU-2938';
update credit_card  set iban = 'TR323456312213576817699999'  where id = 'CcU-2938';

# Exercici 3

INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, timestamp, amount, declined)
VALUES ( '108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', '999', '829.999', '-117.999', '2021-04-21 08:51:28','111.11', '0');

 alter table transaction drop constraint transaction_ibfk_1;
 

# Exercici 4
alter table credit_card drop column pan;

#Nivell 2
#Exercici 1
DELETE FROM transaction
    WHERE ID = '02C6201E-D90A-1859-B4EE-88D2986D3B02';
 
#Exercici 2
create view VistaMarketing
	as select company_name, phone, country, avg(amount) as mitjana_compra
	from company 
	join transaction on company.id = transaction.company_id
	group by company_id
    order by mitjana_compra desc
;
select * from VistaMarketing;

#Exercici 3
select * from VistaMarketing
where country = 'Germany';

