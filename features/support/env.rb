require 'cucumber'
require 'factory_bot'
require 'faker'
require 'dotenv/load'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'pry'
require 'pry-nav'
require 'pry-remote'
require 'report_builder'
require 'rspec'
require 'json_matchers/rspec'

require_relative 'data/models/booking_model'

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/environments/#{ENV['ENV_TYPE']}.yml"))

JsonMatchers.schema_root = File.join(Dir.pwd, 'features/support/data/schemas')

World(FactoryBot::Syntax::Methods)

DATA =
  if ENV['DEV']
    YAML.load_file('features/support/config/environments/dev.yml')
  elsif ENV['QA']
    YAML.load_file('features/support/config/environments/qa.yml')
  else
    YAML.load_file('features/support/config/environments/dev.yml')
  end
