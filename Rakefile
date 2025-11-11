# Rakefile

# Cargas iniciales y configuración
require './config/database'
require 'sequel/extensions/migration'
require 'rake'

# Define la ruta ABSOLUTA a la carpeta de migraciones
MIGRATIONS_DIR = File.expand_path('db/migrations', __dir__)

# Tarea de SEEDING (Nivel Superior)
desc "Populate the database with initial data (INSERTs)"
task :seed do
  # Aquí se usa File.read para obtener el contenido del SQL
  SQL_SEED_CONTENT = File.read(File.expand_path('db/seeds.sql', __dir__))
  
  # DB.run ejecuta el SQL puro
  DB.run(SQL_SEED_CONTENT) 
  
  puts " Database seeded successfully."
end

# NAMESPACE :db
namespace :db do
  # Tarea db:migrate
  desc "Migrates the database to the current version"
  task :migrate do
    Sequel.extension :migration
    
    # Esta línea buscará archivos .rb o .sql:
    Sequel::Migrator.run(DB, MIGRATIONS_DIR) 
    puts "Database migration complete."
  end

  # Tarea db:setup (Opción B)
  # Depende de :migrate y :seed.
  # La tarea :migrate se ejecuta primero para asegurar que las tablas existan.
  # La tarea :seed se ejecuta inmediatamente después para poblar.
  desc "Execute migrate and seed for a full database setup"
  task :setup => [:migrate, :seed] do
    puts "Database setup and seeding complete."
  end
end