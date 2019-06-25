INSERT INTO Car (VIN, Manufacturer, Model, Year, Color) VALUES 
	('ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red'),
	('RKXVNNIHLVVZOUB4M','Ford','Fusion','2018','White'),
	('HKNDGS7CU31E9Z7JW','Toyota','RAV4','2018','Silver'),
	('DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray'),
	('DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country','2019','Gray');

INSERT INTO Customer (CustomerID, Name, PhoneNumber, Email, Adress, City, StateProvince, Country, ZipPostalCode) VALUES 
	('10001','Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid','Madrid', 'Spain','28045'),
	('20001','Abraham Lincoln', '+13059077086', '-', '120 SW 8th St', 'Miami','Florida','United States','33130'),
	('30001','Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée', 'Paris','Île-de-France','France','75008');

INSERT INTO SalesPerson (StaffID,Name, Store) VALUES 
	('00001','Petey Cruiser','Madrid'),
	('00002','Anna Sthesia','Barcelona'),
	('00003','Paul Molive','Berlin'),
	('00004','Gail Forcewind','Paris'),
	('00005','Paige Turner','Mimia'),
	('00006','Bob Frapples','Mexico City'),
	('00007','Walter Melon', 'Amsterdam'),
	('00008','Shonda Leer','São Paulo');

INSERT INTO Invoice (InvoiceID, DateInvoices, ID_Car, CustomerID, StaffID) VALUES 
	('852399038','2018-08-22','1','2','3'), /* mes index commencent à 1 et pas 0 comment faire pour changer ça ?*/
	('731166526','2019-12-31','5','1','5'),
	('271135104','2019-01-22','3','3','7');