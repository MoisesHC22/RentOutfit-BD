USE [RentOutfit]
GO

/******
Testeo de errores para Store procedure para registrar un nuevo cliente.
Script Date: 03/10/2024 11:48:14 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

    -- Testeo correctos para insertar clientes 
    EXEC [dbo].[sp_registrar_cliente]
       @email = 'clientes@ejemplo.com',
       @contrasena = 'contrasena456',
       @token = 'token456',
       @nombreCliente = 'Alberto',
       @apellidoPaterno = 'Riquez',
       @apellidoMaterno = 'Guzman',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234599',
       @generoID = 1,
       @codigoPostal = '55657',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'El llano';

   EXEC [dbo].[sp_registrar_cliente]
       @email = 'Fatima23@ejemplo.com',
       @contrasena = 'contrasena123',
       @token = 'token123',
       @nombreCliente = 'Fatima',
       @apellidoPaterno = 'Gomez',
       @apellidoMaterno = 'Carrillo',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551134501',
       @generoID = 2,
       @codigoPostal = '55600',
       @colonia = 'Patron',
       @calle = 'Segunda',
       @noInt = 1,
       @noExt = 7,
       @estadoID = 16,
       @municipio = 'Jojutla';

   EXEC [dbo].[sp_registrar_cliente]
       @email = 'PabloMiAngelitoMix@ejemplo.com',
       @contrasena = 'contrasena789',
       @token = 'token789',
       @nombreCliente = 'Pablo',
       @apellidoPaterno = 'Jaramillo',
       @apellidoMaterno = 'Peña',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '7712034572',
       @generoID = 3,
       @codigoPostal = '51999',
       @colonia = 'Paseos de la mora',
       @calle = 'Castaño',
       @noInt = 1,
       @noExt = 128,
       @estadoID = 12,
       @municipio = 'Tula de Allende';

   -- Asignar rol de administrador a un cuenta
   UPDATE Roles
   SET detalleRolID = 3
   WHERE rolID = 3;


   -- Validar los requerimientos nulos
   EXEC [dbo].[sp_registrar_cliente]
       -- @email = 'cliente@ejemplo.com', -- Se omite el email
       @contrasena = 'contrasena123',
       @token = 'token123',
       @nombreCliente = 'Juan',
       @apellidoPaterno = 'Pérez',
       @apellidoMaterno = 'González',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234567',
       @generoID = 1,
       @codigoPostal = '12345',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'El llano';

   -- Validar un requerimiento inexistente
   EXEC [dbo].[sp_registrar_cliente]
       @email = 'cliente@ejemplo.com',
       @contrasena = 'contrasena123',
       @token = 'token123',
       @nombreCliente = 'Juan',
       @apellidoPaterno = 'Pérez',
       @apellidoMaterno = 'González',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234567',
       @generoID = 999, -- Valor inexistente en la tabla Géneros
       @codigoPostal = '12345',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'El llano';

	-- Validar un estado y municipio que no coinciden
    EXEC [dbo].[sp_registrar_cliente]
       @email = 'cliente@ejemplo.com',
       @contrasena = 'contrasena123',
       @token = 'token123',
       @nombreCliente = 'Juan',
       @apellidoPaterno = 'Pérez',
       @apellidoMaterno = 'González',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234567',
       @generoID = 1,
       @codigoPostal = '12345',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'El lano';

	-- Validar un correo existente
    EXEC [dbo].[sp_registrar_cliente]
       @email = 'clientes@ejemplo.com',
       @contrasena = 'contrasena654',
       @token = 'token654',
       @nombreCliente = 'Guzman',
       @apellidoPaterno = 'Pérez',
       @apellidoMaterno = 'Chavez',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234565',
       @generoID = 1,
       @codigoPostal = '12345',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'El llano';



/******
Testeo del Stored procedure para dar de alta un nuevo vendedor.
Script Date: 05/10/2024 10:53:12 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Testeo correctamente
EXEC [dbo].[sp_DardeAlta_Vendedor]
@usuarioID = 2

--Testeo de un registro inexistente
EXEC [dbo].[sp_DardeAlta_Vendedor]
@usuarioID = 99



/******
Testeo para mostrar uno o más clientes con el Stored procedure.   
Script Date: 07/10/2024 02:30:59 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Si el usuario no tiene rol de administrador, solo va a poder ver su propia información.

   -- Ejemplo 1
   EXEC [dbo].[sp_mostrar_cliente]
   @usuarioID = 1;

   -- Ejemplo 2
   EXEC [dbo].[sp_mostrar_cliente]
   @usuarioID = 2;


-- Si el usuario tiene el rol de administrador, va a poder ver todas las cuentas.
  EXEC [dbo].[sp_mostrar_cliente]
  @usuarioID = 3;


  -- Error de datos nulos
  EXEC [dbo].[sp_mostrar_cliente]

  -- Error de datos inexistentes
  EXEC [dbo].[sp_mostrar_cliente]
  @usuarioID = 99;


  
/******
Testeo del Store procedure para actualizar un cliente.
Script Date: 04/10/2024 03:43:56 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Testeo correcto 
EXEC [dbo].[sp_actualizar_cliente]
  @usuarioID = 1,
  @email = 'clientes@ejemplo.com',
  @token = 'token456',
  @nombreCliente = 'Alberto',
  @apellidoPaterno = 'Riquez',
  @apellidoMaterno = 'Guzman',
  @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
  @telefono = '5551234599',
  @generoID = 1,
  @codigoPostal = '55657',
  @colonia = 'Centro',
  @calle = 'Primera',
  @noInt = 101,
  @noExt = 202,
  @estadoID = 1,
  @municipio = 'Aguascalientes';


-- Error de usar otro correo que registro otro usuario
EXEC [dbo].[sp_actualizar_cliente]
  @usuarioID = 1,
  @email = 'Fatima23@ejemplo.com',
  @token = 'token456',
  @nombreCliente = 'Alberto',
  @apellidoPaterno = 'Riquez',
  @apellidoMaterno = 'Guzman',
  @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
  @telefono = '5551234599',
  @generoID = 1,
  @codigoPostal = '55657',
  @colonia = 'Centro',
  @calle = 'Primera',
  @noInt = 101,
  @noExt = 202,
  @estadoID = 1,
  @municipio = 'Aguascalientes';

-- Error de un municipio y estado que no coinciden
EXEC [dbo].[sp_actualizar_cliente]
  @usuarioID = 1,
  @email = 'clientes@ejemplo.com',
  @token = 'token456',
  @nombreCliente = 'Alberto',
  @apellidoPaterno = 'Riquez',
  @apellidoMaterno = 'Guzman',
  @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
  @telefono = '5551234599',
  @generoID = 1,
  @codigoPostal = '55657',
  @colonia = 'Centro',
  @calle = 'Primera',
  @noInt = 101,
  @noExt = 202,
  @estadoID = 1,
  @municipio = 'Tula de Allende';



  /******
Testeo del Store procedure para consultar todos los generos.
Script Date: 04/10/2024 06:58:19 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

EXEC [dbo].[sp_consultar_generos]



  /******
Testeo del Store procedure para iniciar sesion.
Script Date: 07/10/2024 01:48:16 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Testeo correcto
EXEC [dbo].[sp_Iniciar_Sesion]
@email = 'PabloMiAngelitoMix@ejemplo.com',
@contrasena = 'contrasena789'


-- Testeo incorrecto sobre el correo
EXEC [dbo].[sp_Iniciar_Sesion]
@email = 'PabloMiAngelitoMix@ejemplo.co',
@contrasena = 'contrasena789'

-- Testeo incorrecto sobre la Contraseña
EXEC [dbo].[sp_Iniciar_Sesion]
@email = 'PabloMiAngelitoMix@ejemplo.com',
@contrasena = 'contrasena78'



/******
Testeo del stored procedure para consultar todos los municipios.
Script Date: 04/10/2024 05:50:34 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

EXEC [dbo].[sp_consultar_estados];



/******
Testeo del stored procedure para consultar los municipio de un estado en especifico.
Script Date: 04/10/2024 06:20:29 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

EXEC [dbo].[sp_consultar_municipios]
@estadoID = 19;



/******
Testeo del Stored procedure para dar de alta un establecimiento.
Script Date: 06/10/2024 01:58:16 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Testeo para un cuenta que no se dio alta como vendendedor
EXEC [dbo].[sp_DarDeAlta_Establecimiento]
     @usuarioID = 1,
     @nombreEstablecimiento = 'A toda facha',
     @codigoPostal = '44445',
     @colonia = 'Centro',
     @calle = 'Segunda',
     @noInt = 59,
     @noExt = 654,
     @estadoID = 1,
     @municipio = 'El llano';


-- Testeo correctamente
EXEC [dbo].[sp_DarDeAlta_Establecimiento]
     @usuarioID = 7,
     @nombreEstablecimiento = 'Ropa tumbada',
     @codigoPostal = '44445',
     @colonia = 'Centro',
     @calle = 'Segunda',
     @noInt = 59,
     @noExt = 654,
     @estadoID = 1,
     @municipio = 'Aguascalientes';



/******
Testeo del Stored procedure para consultar las tallas.   
Script Date: 13/10/2024 12:15:19 a. m. 
Autor: Bryan Hernández Garcia       
Contacto: bryanhernandez1103@gmail.com
******/

EXEC [dbo].[sp_consultar_tallas]



/******
Testeo del Stored procedure para consultar los estilos.
Script Date: 13/10/2024 02:59:43 p. m. 
Autor: Bryan Hernández Garcia      
Contacto: bryanhernandez1103@gmail.com
******/

EXEC [dbo].[sp_consultar_estilos]



/******
Testeo del Stored procedure para obtener el token para recuperar la contraseña.
Script Date: 14/10/2024 06:23:33 p. m. 
Autor: Bryan Hernández Garcia      
Contacto: bryanhernandez1103@gmail.com
******/

-- Testeo correcto
EXEC [dbo].[sp_olvideLaContrasena_Email]
     @email = 'clientes@ejemplo.com';


-- Error al mandar un correo inexistente

 EXEC [dbo].[sp_olvideLaContrasena_Email]
 @email = 'clientes@ejemplo.co';

 -- Error de no mandar un correo
  EXEC [dbo].[sp_olvideLaContrasena_Email];



/******
Testeo del Stored procedure para validar el token para recuperar la contraseña.
Script Date: 14/10/2024 06:30:07 p. m. 
Autor: Bryan Hernández Garcia      
Contacto: bryanhernandez1103@gmail.com
******/

-- Testeo correcto
EXEC [dbo].[sp_olvideLaContrasena_Token]
@email = 'clientes@ejemplo.com',
@token = 'token456';


-- Error de mandar un campo nulo
EXEC [dbo].[sp_olvideLaContrasena_Token]
@email = 'clientes@ejemplo.com';

-- Error de mandar un campo inexistente
EXEC [dbo].[sp_olvideLaContrasena_Token]
@email = 'clientes@ejemplo.com',
@token = 'token45';



/******
Testeo del Stored procedure para actualizar la contraseña.
Script Date: 14/10/2024 06:35:41 p. m. 
Autor: Bryan Hernández Garcia      
Contacto: bryanhernandez1103@gmail.com
******/

-- Testeo Correcto
EXEC [dbo].[sp_olvideLaContrasena_Actualizacion]
@email = 'clientes@ejemplo.com',
@contrasena = 'Contraseña9123';


-- Error de mandar un correo inexistente
EXEC [dbo].[sp_olvideLaContrasena_Actualizacion]
@email = 'clientes@ejemplo.co',
@contrasena = 'Contraseña123';

-- Error de mandar un campo nulo
EXEC [dbo].[sp_olvideLaContrasena_Actualizacion]
@email = 'clientes@ejemplo.com';
