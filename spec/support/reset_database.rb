# Deletes the sqlite3 database specified in the app's config
# and runs the db:migrate rake tasks to rebuild the database schema.
def reset_spec_database
  raise "Cannot reset the spec database because config[:database][:database] is not defined." unless
    CASServer::Server.config[:database] && CASServer::Server.config[:database][:database]

  FileUtils.rm_f(CASServer::Server.config[:database][:database])
  
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = Logger::ERROR
  ActiveRecord::Migration.verbose = false
  ActiveRecord::Migrator.migrate("db/migrate")
end
