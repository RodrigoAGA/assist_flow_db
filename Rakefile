# Rakefile
require './config/database'
require 'sequel/extensions/migration'
require 'rake'

# Define la ruta ABSOLUTA a la carpeta de migraciones
MIGRATIONS_DIR = File.expand_path('db/migrations', __dir__)

namespace :db do
  desc "Migrates the database to the current version"
  task :migrate do
    Sequel.extension :migration
    
    # LÍNEA DE DIAGNÓSTICO ACTUALIZADA:
    # Ahora muestra los archivos .rb (el nuevo formato)
    puts "Archivos .rb detectados: #{Dir.glob(File.join(MIGRATIONS_DIR, '*.rb'))}" 
    
    # Esta línea buscará automáticamente archivos .rb o .sql:
    Sequel::Migrator.run(DB, MIGRATIONS_DIR) 
    puts "Database migration complete."
  end

  desc "Create tables, populate with initial data"
  task :setup => :migrate do
    puts "Database setup complete."
  end
end