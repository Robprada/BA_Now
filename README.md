# Experience Hub

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
