configure do

  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  if development?

    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  else
    set :database, ENV['DATABASE_URL']
  end

  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = FIle.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
