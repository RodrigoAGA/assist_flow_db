# controllers/application_controller.rb

require 'sinatra/base'
require 'sinatra/json'

class ApplicationController < Sinatra::Base
  # Configuraciones básicas
  configure do
    set :bind, '0.0.0.0'
    set :port, 9292 # Puerto donde correrá el servidor
    set :public_folder, File.expand_path('../public', __dir__)
    set :views, File.expand_path('../views', __dir__)
    set :default_content_type, :json # Respuesta por defecto será JSON

    # Configuraciones para desarrollo
    set :logging, true
    set :dump_errors, true
    set :show_exceptions, true
  end

  # Punto de entrada principal para pruebas
  get '/' do
    'Welcome to the Mobile Programming Backend API!'
  end
end