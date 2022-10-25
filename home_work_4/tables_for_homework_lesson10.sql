CREATE TABLE veterinarian (
    veterinarian_id INT unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) DEFAULT NULL
);

INSERT INTO veterinarian (veterinarian_id, name) 
VALUES (1, 'John Adams'),
(2, 'Steve Burton'),
(3, 'Jossie Atkinson'),
(4, 'Rob Baker');


CREATE TABLE pet (
  id_pet INT unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  species ENUM('dog', 'cat', 'horse') NOT NULL,
  breed VARCHAR(30) NOT NULL,
  name VARCHAR(45) UNIQUE DEFAULT NULL,
  pet_owner VARCHAR(45) DEFAULT NULL,
  weight FLOAT DEFAULT NULL,
  veterinarian_id INT unsigned DEFAULT NULL,
  FOREIGN KEY (veterinarian_id) REFERENCES veterinarian (veterinarian_id)
);


INSERT INTO pet (species,breed,name,pet_owner,weight, veterinarian_id) VALUES
	 ('cat','American Bobtail','Bubbles','Roy Keane',6.0, 1),
	 ('cat','American Bobtail','Cheddar','Adam Nevell',6.5, 2),
	 ('cat','American Curl','Fishbait','Joe Ginness',7.1,3),
	 ('cat','American Curl','Jiggles','Patty O''Furniture',6.4,1),
	 ('cat','Birman Cat','Katy Purry','Paddy O''Furniture',5.4,3),
	 ('cat','Chartreux Cat','Kit-Kat','Joe Ginness',5.3,4),
	 ('cat','Chartreux Cat','Meowise','Paddy O''Furniture',6.3,4),
	 ('cat','Chartreux Cat','Puddy Tat','Joe Ginness',5.9,3),
	 ('cat','Chartreux Cat','Skimbleshanks','Allie Grater',4.99,2),
	 ('cat','Chartreux Cat','Sushi','Paddy O''Furniture',5.1,1),
	 ('horse','Castillonnais','Tucker','Anne T. Dote',315.0,2),
	 ('horse','Campeiro','Chukie','Ivan Itchinos',300.8,4),
	 ('horse','Campeiro','Luke','Manny Jah',311.2,4),
	 ('dog','Labrador Retriever','Panda','Roman Cheese',33.0,3),
	 ('dog','mongrel dog','Tatoshka','Roman Cheese',9.0,2),
	 ('dog','mongrel dog','Lisichka','Roman Cheese',9.0,2),
	 ('cat','alley cat','Iriska','Roman Cheese',5.0,1),
	 ('cat','British Shorthair','Daniel','Mary Key',7.1,1);
