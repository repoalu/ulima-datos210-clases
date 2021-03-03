// 0
// Trabajando con JSON

emp01 =     {    nombre: "Manuel",
                        apellido: "Vargas",
                        usuario: "mvargas",
                        edad: 35,
                        ciudad: "Arequipa",
                        activo: true,
                        direccion: { 
                                            calle: "Jr. Huascar",
                                            numero: 1248,
                                            distrito: "Jesus Maria"
                                         } ,
                         pasatiempos: ["musica", "lectura", "ajedrez" ]
                     };

print(emp01.nombre + " " + emp01.apellido);

print(emp01.direccion);

dir = emp01.direccion;

print(dir.calle + "  " + dir.numero + " - " + dir.distrito);
                     
print(emp01.pasatiempos[0]);
print(emp01.pasatiempos[1]);
                     
//1
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

db.usuarios.insert(documento);


//2
db.usuarios.find();

//3
db.usuarios.findOne();
                        
db.usuarios.findOne({ciudad: "Lima"});

//5
db.usuarios.find({edad: 35}).count();

//6
db.usuarios.count();

//7
emp02 = {nombre: "Pedro", apellido: "Rodriguez", usuario: "prodriguez", edad: 40, ciudad: "Lima"};
emp03 = {nombre: "Juana", apellido: "Castillo", usuario: "jcastillo", edad: 29, ciudad: "Lima"};
emp04 = {nombre: "Maria", apellido: "Melendez", usuario: "mmelendez", edad: 23, ciudad: "Tacna"};
emp05 = {nombre: "Jose", apellido: "Urcia", usuario: "jurcia", edad: 36, ciudad: "Arequipa"};

lista_emp = [emp02, emp03, emp04, emp05];

db.usuarios.insertMany(lista_emp);


//8
db.usuarios.find(         {
                                        apellido: "Vargas"
                                  }
                        );

//9
db.usuarios.find(         {
                                        ciudad: "Arequipa",
                                        edad: 36
                                  }
                        );

//10
db.usuarios.find(       {
                                    $or: [  {ciudad: "Arequipa"}, {ciudad: "Tacna"} , {edad: 29} ] 
    
                                }
                        );
                                  

//11
db.usuarios.find(       {
                                    ciudad: {  $in: ["Arequipa", "Tacna"]  }
                                 }
                        );

//12
db.usuarios.find(       {
                                    edad: { $gte: 36 }
                                 }
                        );

//13
documento = {nombre: "Cesar", apellido: "Panta", usuario: "cpanta"} ;
db.usuarios.insert(documento);

db.usuarios.update(      {  usuario: "cpanta" }, 
                                    { nombre: "Cesar", apellido: "Panta", usuario: "cpanta", edad: 35, ciudad: "Huanuco"} 
                             );

db.usuarios.find({  usuario: "cpanta" });

//14
db.usuarios.update(      {  usuario: "cpanta" }, 
                                    { $set: { edad: 42 } } 
                             );
                                
//Actualizar a 29 la edad de aquellos usuarios que vivan en Lima o tengan menos de 30 anios.
db.usuarios.updateMany(      {$or: [ {edad: {$lt: 30}}, {ciudad: "Lima"}] } , 
                                            { $set: { edad: 29 } } 
                                    );

//Agregar atributos al documento
db.usuarios.update(      {  usuario: "cpanta" }, 
                                    { $set: { extra1: "valor1", extra2: "valor2" } } 
                             );

//Quitar atributos del documento
db.usuarios.update(      {  usuario: "cpanta" }, 
                                    { $unset: { extra1: 1, extra2: 1 } } 
                             );

db.usuarios.find();

//16
db.usuarios.remove({usuario: "cpanta"});

db.usuarios.drop();
