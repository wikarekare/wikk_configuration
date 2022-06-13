#!/usr/local/bin/ruby
require_relative '../lib/wikk_configuration.rb' # For preinstall testing
# require 'wikk_configuration.rb' #For post install testing
require 'pp'
include WIKK

# Provides a self test of this class, by reading the test configuration file.
#  and attempting to access configuration items as methods.
def test(config_file)
  puts "creating config from '#{config_file}'"
  config = Configuration.new(config_file)

  puts '****** Dump config using to_s *********'
  pp config
  puts
  puts
  puts '******Should be there*********'
  puts "base_directories is defined? #{config.respond_to?(:base_directory)}"
  puts "base_directories= is defined? #{config.respond_to?(:base_directory=)}"
  puts "base_directories is: '#{config.base_directory}'"
  puts '******Should NOT be there*********'
  puts "not_there is defined? #{config.respond_to?(:not_there)}"
  puts '******Array*********'
  puts "hello is of class: #{config.hello.class}"
  puts "config.hello[0] => #{config.hello[0]}"
  puts '******Hash*********'
  puts "world is of class: #{config.world.class}"
  puts "config.world['1'] => #{config.world['1']}"
  puts '******Boolean*********'
  puts "boolean is of class: #{config.boolean.class}"
  puts "config.boolean => #{config.boolean}"
  puts '******String*********'
  puts "string is of class: #{config.string.class}"
  puts "config.string => #{config.string}"
  puts '******Numeric*********'
  puts "numeric is of class: #{config.numeric.class}"
  puts "config.numeric => #{config.numeric}"
  puts
  puts '******Alter Numeric value and fetch again*********'
  config.numeric = 1001
  puts "config.numeric => #{config.numeric}"
  puts config.pjson
  puts
  puts
  puts
  hash_source = { # Ruby equivalent of the json.
    'base_directory' => '/usr/local/random',
    'hello' => [ 0, 1, 2, 3, 4 ],
    'world' => { '0' => 0, '1' => 1, '2' => 2 },
    'boolean' => true,
    'string' => 'string',
    'numeric' => 1.2345,
    'deep' => { 'array' => [ 0, 1, 2, 3, 4 ], 'hash' => { '0' => 0, '1' => 1, '2' => 2 } },
    'deeper' => { 'hash' => { 'array' => [ 0, 1, 2, 3, 4 ] } }
  }
  puts 'creating config from hash'
  config_hash_source = Configuration.new(hash_source)
  puts '****** Dump config using to_s *********'
  pp config
  puts '******Numeric from hashed source *********'
  puts "numeric is of class: #{config_hash_source.numeric.class}"
  puts "config_hash_source.numeric => #{config_hash_source.numeric}"
end

def test_save(config_file)
  puts "test_save: creating config from '#{config_file}'"
  config = Configuration.new(config_file)
  config.save(__dir__ + '/conf_out')
end

puts 'Start'
begin
  test(__dir__ + '/conf.json')
rescue StandardError => e
  puts "Error: #{e}"
end
begin
  test_json = {
    base_directory: '/usr/local/random',
    hello: [ 0, 1, 2, 3, 4 ],
    world: { '0': 0, '1': 1, '2': 2 },
    boolean: true,
    string: 'string',
    numeric: 1.2345,
    deep: { array: [ 0, 1, 2, 3, 4 ], hash: { '0': 0, '1': 1, '2': 2 } },
    deeper: { hash: { array: [ 0, 1, 2, 3, 4 ] } }
  }
  test_save(test_json)
rescue StandardError => e
  puts "Error: #{e}"
end
puts 'End'
