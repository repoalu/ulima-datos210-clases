//Dataset Restaurantes
//mongoimport --host localhost --port 27017 --db datasets --collection restaurantes --drop --file d:/id/restaurant.json

//Comprobar resultados
db.restaurantes.find();

//Filtro por codigo postal
db.restaurantes.find({postcode: "0QR"});

//Filtro por calificacion (rating)
db.restaurantes.find({rating: {$gte: 6}});

//Dataset Titanic
//mongoimport --host localhost --port 27017 --db datasets --collection titanic --drop --file d:/id/titanic.csv --type csv --headerline

//Filtro para obtener las personas de sexo femenino que estan en primera clase
db.titanic.find({Sex: "female", Pclass: 1});
