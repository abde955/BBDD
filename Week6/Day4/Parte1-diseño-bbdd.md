# 1. Esquema de Base de Datos

## Tablas y Relaciones

### Hotel

- **ID_Hotel** (Primary Key)
- Nombre
- Dirección
- Teléfono

### Habitación

- **ID_Habitacion** (Primary Key)
- **ID_Hotel** (Foreign Key)
- Número
- Tipo (e.g., Sencilla, Doble, Suite)
- Precio_Noche

### Cliente

- **ID_Cliente** (Primary Key)
- Nombre
- Teléfono
- Correo_Electronico

### Reserva

- **ID_Reserva** (Primary Key)
- **ID_Cliente** (Foreign Key)
- **ID_Habitacion** (Foreign Key)
- Fecha_Checkin
- Fecha_Checkout

### Servicio

- **ID_Servicio** (Primary Key)
- Nombre
- Costo

### Cliente_Servicio (Tabla intermedia para la relación muchos a muchos)

- **ID_Cliente** (Foreign Key)
- **ID_Servicio** (Foreign Key)
- Fecha_Utilizacion

## Relaciones

### Uno a Muchos

- **Hotel a Habitación**: Un hotel puede tener muchas habitaciones.
- **Cliente a Reserva**: Un cliente puede hacer muchas reservas.
- **Habitación a Reserva**: Una habitación puede tener muchas reservas (en diferentes períodos).

### Muchos a Muchos

- **Cliente y Servicio**: Un cliente puede utilizar varios servicios y un servicio puede ser utilizado por varios clientes.


