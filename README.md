<div class="documentation-container container mt-5">
  <h1 class="text-center mb-4">Experience Hub</h1>
  <h2 class="text-center mb-5">Plataforma de Experiencias Turísticas</h2>
  <div class="row">
    <div class="col-12">
      <h3 class="mb-4">1. Arquitectura del Proyecto</h3>
      <div class="card mb-4">
        <div class="card-header">
          <h4>Diagrama de Base de Datos</h4>
        </div>
        <div class="card-body">
          <div class="mermaid">
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
          </div>
        </div>
      </div>
      <h3 class="mb-4">2. Características Principales</h3>
      <div class="card mb-4">
        <div class="card-body">
          <h4>Autenticación y Autorización</h4>
          <ul>
            <li>Sistema de usuarios completo usando Devise</li>
            <li>Roles diferenciados (creadores de experiencias y usuarios)</li>
            <li>Gestión de perfiles personalizados</li>
          </ul>
          <h4>Gestión de Experiencias</h4>
          <ul>
            <li>CRUD completo para experiencias turísticas</li>
            <li>Sistema de reservas</li>
            <li>Geolocalización con Geocoder</li>
            <li>Almacenamiento de imágenes con Cloudinary</li>
            <li>Sistema de reseñas y valoraciones</li>
          </ul>
        </div>
      </div>
      <!-- Continúa con las demás secciones siguiendo el mismo patrón -->
    </div>
  </div>
</div>

# app/assets/stylesheets/documentation.scss
.documentation-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  h1 {
    color: #2563eb;
    font-size: 2.5rem;
  }
  h2 {
    color: #4b5563;
    font-size: 1.8rem;
  }
  h3 {
    color: #1f2937;
    font-size: 1.5rem;
    border-bottom: 2px solid #e5e7eb;
    padding-bottom: 10px;
    margin-top: 30px;
  }
  .card {
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

    .card-header {
      background-color: #f3f4f6;
      border-bottom: 1px solid #e5e7eb;
    }
  }
  ul {
    list-style-type: none;
    padding-left: 0;
    li {
      padding: 8px 0;
      border-bottom: 1px solid #f3f4f6;
      &:last-child {
        border-bottom: none;
      }
    }
  }
  code {
    background-color: #f3f4f6;
    padding: 2px 4px;
    border-radius: 4px;
    font-size: 0.9em;
  }
}
