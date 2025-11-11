require 'sequel'
require 'logger'
require 'pg' 

# Configuración de la conexión a PostgreSQL
DB = Sequel.connect(
  adapter: 'postgres',
  database: 'assist_flow_db',
  host: 'localhost',
  user: 'postgres',
  password: 'admin', 
  port: 5433
)

# Configuración de logging para desarrollo
DB.loggers << $stdout if defined?(Sinatra::Base) && Sinatra::Base.development?