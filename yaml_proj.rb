require 'yaml'
require 'minitest/utils'
require 'minitest/autorun'
require "pry-byebug"

module App
  class Environment
    def self.load!
      environment = ENV['APP_ENV']||'development'
      options = YAML.load_file('/config.yaml')[environment]
      root_uri = options["root_uri"]
      database_uri = options["database_uri"]

      new root_uri, database_uri
    end

    def initialize root_uri, database_uri
      @root_uri = root_uri
      @database_uri = database_uri
    end
  end



  class App
    def self.load
      @environment ||= Environment.load!
    end
  end

  class EnvironmentTest < MiniTest::Test
    def test_loads_the_environment
      environment = Environment.load!
      assert_equal "http://localhost:2938", environment.root_uri
    end
  end
end