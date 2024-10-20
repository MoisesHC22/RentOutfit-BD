# Base de datos - RentOutfit

## Descripción
La base de datos `RentOutfit` está diseñada para gestionar el almacenamiento de la información relacionada con la renta de Vestimenta y disfraces. Contiene datos sobre usuarios, cuentas, alquileres, pagos, establecimientos, y reseñas de productos.

## Requisitos previos
Para ejecutar la base de datos necesitas:

- SQL Server 2022
- Microsoft SQL Server Management Studio (SSMS)
- .NET Core para la API que interactúa con la base de datos

## Lista de tablas
### 1. Usuarios
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| usuarioID                       | int (Identity)  |
| email                           | varchar(50)     |
| contrasena                      | varchar(255)    |
| rolID                           | date            |
| token                           | varchar(50)     |
| tokenValidacion                 | varchar(50)     |
| ultimaModificacionUsuario       | datetime        |

### 2. Detalle Rol
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| detalleRolID                    | int (Identity)  |
| nombreRol                       | varchar(50)     |
| ultimaModificacionDtRol         | datetime        |

### 3. Roles
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| rolID                           | int (Identity)  |
| detalleRolID                    | int             |
| usuarioID                       | int             |
| ultimaModificacionRol           | datetime        |

### 4. Clientes
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| clienteID                       | int (Identity)  |
| nombreCliente                   | varchar(50)     |
| apellidoPaterno                 | varchar(50)     |
| apellidoMaterno                 | varchar(50)     |
| linkImagenPerfil                | varchar(250)    |
| usuarioID                       | int             |
| telefono                        | varchar(10)     |
| direccionID                     | int             |
| generoID                        | int             |
|ultimaModificacionCliente        | datetime        |

### 5. Géneros
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| generoID                        | int (Identity)  |
| nombreGenero                    | varchar(50)     |
| ultimaModificacionGenero        | datetime        |

### 6. Establecimientos
| Columna                          | Tipo de dato    |
|----------------------------------|-----------------|
| establecimientosID               | int (Identity)  |
| clienteID                        | int             |
| nombreEstablecimiento            | varchar(50)     |
| direccionID                      | int             |
| ultimaModificacionEstablecimiento| datetime        |
| linkImagenEstablecimiento        | varchar(250)    |

### 7. Direcciones
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| direccionID                     | int (Identity)  |
| codigoPostal                    | varchar(5)      |
| colonia                         | varchar(50)     |
| calle                           | varchar(50)     |
| noInt                           | int             |
| noExt                           | int             |
| ultimaModificacionDireccion     | datetime        |
| estadoID                        | int             |
| municipio                       | varchar(50)     |

### 8. Estados
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| estadoID                        | int (Identity)  |
| nombreEstado                    | varchar(50)     |
| ultimaModificacionEstado        | datetime        |

### 9. Municipios
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| municipioID                     | int (Identity)  |
| nombreMunicipio                 | varchar(150)     |
| estadoID                        | int             |
| ultimaModificacionMunicipio     | datetime        |

### 10. Estilos
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| estiloID                        | int (Identity)  |
| nombreEstilo                    | varchar(50)     |
| ultimaModificacionEstilos       | datetime        |

### 11. Pedidos
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| pedidoID                        | int (Identity)  |
| fechaPedido                     | date            |
| clienteID                       | int             |
| total                           | decimal(18,2)   |
| pedidosEstatus                  | bit             |
| ultimaModificacionPedidos       | datetime        |

### 12. Detalle Venta
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| datalleVentaID                  | int (Identity)  |
| vestimentaID                    | int             |
| precioTotal                     | decimal(18,2)   |
| cantidad                        | int             |
| pedidoID                        | int             |
| incidenciaID                    | int             |
| ultimaModificacionDV            | datetime        |

### 13. Incidencias
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| incidenciaID                    | int (Identity)  |
| fechaIncidencia                 | datetime        |
| descripcion                     | text            |
| incidenciaEstatus               | bit             |
| ultimaModificacionIncidencia    | datetime        |

### 14. Vestimentas
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| vestimentaID                    | int (Identity)  |
| nombrePrenda                    | varchar(50)     |
| precioPorDia                    | decimal(18,2)   |
| stock                           | int             |
| fechaDePublicacion              | date            |
| estiloID                        | int             |
| linkImagenVes                   | varchar(250)    |
| tallaID                         | int             |
| establecimientoID               | int             |
| ultimaModificacionUsuario       | datetime        |
| vestimentaEstatus               | bit             |
| descripcion                     | string(500)     |

### 15. Tallas
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| tallaID                         | int (Identity)  |
| nombreTalla                     | varchar(50)     |
| ultimaModificacionUsuario       | datetime        |

### 16. Chats
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| chatID                          | int (Identity)  |
| clienteID                       | int             |
| establecimientoID               | int             |
| fechaInicio                     | date            |
| ultimaModificacionChat          | datetime        |
| mensajeID                       | int             |

### 17. Mensajes
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| mensajeID                       | int (Identity)  |
| contenido                       | text            |
| fechaEnvio                      | datetime        |
| ultimaModificacionUsuario       | datetime        |

### 18. ImagenesVes
| Columna                         | Tipo de dato    |
|---------------------------------|-----------------|
| imagenesVesID                   | int (Identity)  |
| imagen1                         | varchar(250)    |
| imagen2                         | varchar(250)    |
| imagen3                         | varchar(250)    |
| ultimaModificacionImgVes        | datetime        |



## Este proyecto está vinculado con estos otros repositorios
 Tipo | Repositorio
------------- | -------------
 Backend | [Repositorio de APIS](https://github.com/MoisesHC22/RentOutfit-Apis)
 Frontend Web | [Repositorio de Web](https://github.com/MoisesHC22/RentOutfit-web)
Frontend Móvil | [Repositorio de Móvil](https://github.com/MoisesHC22/RentOutfit-movil)

## Diagrama de base de datos

[![Rent-Outfit-BD.png](https://i.postimg.cc/vTN3Vh50/Rent-Outfit-BD.png)](https://postimg.cc/zHTCmnth)
