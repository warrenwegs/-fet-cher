require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all'

require 'pry' if development?

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s



configure do

  set :instagram_key, '2227106820.1fb234f.914b7e6a1e114dbebe0b2a2952d51f1a&'

  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  set :views, File.join(Sinatra::Application.root, "app", "views")
  
end

require APP_ROOT.join('config', 'database')

require APP_ROOT.join('app', 'actions')
