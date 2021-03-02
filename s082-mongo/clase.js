

--1
db.usuarios.insert(
    {  nombre: "Manuel",
        apellido: "Vargas",
        usuario: "mvargas",
        edad: 35,
        ciudad: "Arequipa"        
     }
);

documento =    {
                            nombre: "Ana",
                            apellido: "Cespedes",
                            usuario: "acespedes",
                            ciudad: "Lima"
                        };



--2
db.usuarios.find();

--3
db.usuarios.findOne();
                        
db.usuarios.findOne({ciudad: "Lima"});

--5
db.usuarios.find({edad: 35}).count();

--6
db.usuarios.count();

--7
db.usuarios.insert({nombre: "Pedro", apellido: "Rodriguez", usuario: "prodriguez", edad: 40, ciudad: "Lima"});

db.usuarios.insert({nombre: "Juana", apellido: "Castillo", usuario: "jcastillo", edad: 29, ciudad: "Lima"});

db.usuarios.insert({nombre: "Maria", apellido: "Melendez", usuario: "mmelendez", edad: 23, ciudad: "Tacna"});

db.usuarios.insert({nombre: "Jose", apellido: "Urcia", usuario: "jurcia", edad: 36, ciudad: "Arequipa"});


--8
db.usuarios.find(         {
                                        apellido: "Vargas"
                                  }
                        );

--9
db.usuarios.find(         {
                                        ciudad: "Arequipa",
                                        edad: 36
                                  }
                        );

--10
db.usuarios.find(       {
                                    $or: [  {ciudad: "Arequipa"}, {ciudad: "Tacna"} , {edad: 29} ] 
    
                                }
                        );
                                  

--11
db.usuarios.find(       {
                                    ciudad: {  $in: ["Arequipa", "Tacna"]  }
                                 }
                        );

--12
db.usuarios.find(       {
                                    edad: { $gte: 35 }
                                 }
                        );







 
  







