# db/migrations/001_create_tables.rb

Sequel.migration do
  up do
    # Tabla COMPANIES: Parámetros globales de la empresa
    create_table :companies do
        primary_key :id, type: :serial
        String :name, null: false
        Integer :base_hours, null: false
        
        # CAMBIO CLAVE: Usamos el tipo :time
        column :lunch_start, :time 
        column :lunch_end, :time
    end

    # Tabla PROFILES: Cuentas de usuario
    create_table :profiles do
        primary_key :id, type: :serial
        String :user_role, size: 50, null: false
        String :email, null: false, unique: true
        foreign_key :company_id, :companies, null: false
    end

    # Tabla EMPLOYEES: Modela al trabajador
    create_table :employees do
        primary_key :id, type: :serial
        String :dni, size: 20, null: false
        String :full_name, null: false
        foreign_key :profile_id, :profiles, unique: true
        foreign_key :company_id, :companies, null: false
        # Restricción: DNI debe ser único por empresa
        index [:dni, :company_id], unique: true
    end

    # Tabla GEOFENCES: Zonas geográficas válidas
    create_table :geofences do
        primary_key :id, type: :serial
        foreign_key :company_id, :companies, null: false
        String :name, null: false
        Float :latitude, null: false
        Float :longitude, null: false
        Integer :radius, null: false
    end

    # Tabla ATTENDANCE_RECORDS: Marcas
    create_table :attendance_records do
        primary_key :id, type: :serial
        foreign_key :employee_id, :employees, null: false
        # Usamos :timestamptz para PostgreSQL
        DateTime :record_time, type: 'timestamp with time zone', null: false
        String :record_type, size: 50, null: false
        Float :latitude
        Float :longitude
        # Índice para búsquedas rápidas (Sequel ya crea el índice para unique)
        index [:employee_id, :record_time], unique: true
    end

    # Tabla NOTIFICATIONS: Avisos
    create_table :notifications do
        primary_key :id, type: :serial
        foreign_key :company_id, :companies, null: false
        foreign_key :employee_id, :employees
        String :message, text: true, null: false
        DateTime :created_at, type: 'timestamp with time zone', default: Sequel::CURRENT_TIMESTAMP, null: false
        TrueClass :is_read, default: false, null: false
    end
  end

  down do
    # Las migraciones 'down' se usan para revertir (opcional pero recomendado)
    drop_table :notifications
    drop_table :attendance_records
    drop_table :geofences
    drop_table :employees
    drop_table :profiles
    drop_table :companies
  end
end