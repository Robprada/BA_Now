# Nombre del Proyecto: Buenas Experiencias
- Url de webapp en Heroku: [https://ba-now-robprada-5b27cdfed0bb.herokuapp.com/](https://ba-now-robprada-5b27cdfed0bb.herokuapp.com/)

## Plataforma de Experiencias Turísticas

### 1. Arquitectura del Proyecto

#### Diagrama de Base de Datos

```mermaid
erDiagram
  Users ||--o{ Experiences : "creates (has_many)"
  Users ||--o{ Bookings : "has_many"
  Users ||--o{ Reviews : "has_many"
  Experiences ||--o{ Bookings : "has_many"
  Experiences ||--o{ Reviews : "has_many"
  Experiences ||--o{ Photos : "has_many_attached"
  Users {
    string email PK
    string encrypted_password
    string username
    string municipality
  }
  Experiences {
    bigint id PK
    string title
    text description
    integer price
    integer availability
    string address
    float latitude
    float longitude
  }
  Bookings {
    bigint id PK
    datetime booking_date
    time hour
    integer tickets
  }
  Reviews {
    bigint id PK
    integer rating
    text comments
  }
```
### 2. Características Principales

#### Autenticación y Autorización
- Sistema de usuarios completo usando Devise
- Inicio de sesión con Google
- Roles diferenciados (creadores de experiencias y usuarios)
- Gestión de perfiles personalizados

#### Gestión de Experiencias
- CRUD completo para experiencias turísticas
- Sistema de reservas
- Geolocalización con Geocoder
- Almacenamiento de imágenes con Cloudinary
- Sistema de reseñas y valoraciones
- Busqueda de experiencias con AJAX
- Alertas personalizadas con SweetAlert2
- Paginación de las experiencias usando Bootstrap4 y Kaminari
