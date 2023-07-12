# core and stlibs

require 'pp'
require 'fileutils'
require 'uri'
require 'json'
require 'yaml'

require 'logger'    # Note: use for ActiveRecord::Base.logger -- remove/replace later w/ LogUtils::Logger ???


# 3rd party gems / libs
require 'props'           # see github.com/rubylibs/props
require 'logutils'        # see github.com/rubylibs/logutils


require 'active_record'   ## todo: add sqlite3? etc.

## add more activerecords addons/utils
# require 'tagutils'
require 'activerecord/utils'
require 'props/activerecord'      # includes ConfDb (ConfDb::Model::Prop, etc.)
require 'logutils/activerecord'   # includes LogDb (LogDb::Model::Log, etc.)



# our own code
require_relative 'version'   # always goes first

require_relative 'models/forward'

require_relative 'models/inscribe'
require_relative 'models/blob'
require_relative 'models/collection'
require_relative 'models/generative'


require_relative 'schema'      

require_relative 'cache'


###
# og (ordgen) helpers
require_relative 'og'



module OrdDb

  def self.create
    CreateDb.new.up
    ConfDb::Model::Prop.create!( key: 'db.schema.ord.version', 
                                 value: Ordlite::VERSION )
  end

  def self.create_all
    LogDb.create    # add logs table
    ConfDb.create   # add props table
    OrdDb.create
  end

  def self.auto_migrate!
    ### todo/fix:
    ##    check props table and versions!!!!!

    # first time? - auto-run db migratation, that is, create db tables
    unless LogDb::Model::Log.table_exists?
      LogDb.create     # add logs table
    end

    unless ConfDb::Model::Prop.table_exists?
      ConfDb.create    # add props table
    end

    unless OrdDb::Model::Inscribe.table_exists?
      OrdDb.create
    end
  end # method auto_migrate!



  def self.connect( config={} )

    if config.empty?
      puts "ENV['DATBASE_URL'] - >#{ENV['DATABASE_URL']}<"

      ### change default to ./ord.db ?? why? why not?
      db = URI.parse( ENV['DATABASE_URL'] || 'sqlite3:///ord.db' )

      if db.scheme == 'postgres'
        config = {
          adapter: 'postgresql',
          host: db.host,
          port: db.port,
          username: db.user,
          password: db.password,
          database: db.path[1..-1],
          encoding: 'utf8'
        }
      else # assume sqlite3
       config = {
         adapter: db.scheme, # sqlite3
         database: db.path[1..-1] # ord.db (NB: cut off leading /, thus 1..-1)
      }
      end
    end

    puts "Connecting to db using settings: "
    pp config
    ActiveRecord::Base.establish_connection( config )
    # ActiveRecord::Base.logger = Logger.new( STDOUT )
  end


  def self.setup_in_memory_db

    # Database Setup & Config
    ActiveRecord::Base.logger = Logger.new( STDOUT )
    ## ActiveRecord::Base.colorize_logging = false  - no longer exists - check new api/config setting?

    self.connect( adapter:  'sqlite3',
                  database: ':memory:' )

    ## build schema
    OrdDb.create_all
  end # setup_in_memory_db (using SQLite :memory:)

end  # module OrdDb


# say hello
puts Ordlite.banner     ## if defined?($RUBYCOCOS_DEBUG) && $RUBCOCOS_DEBUG
