#!/usr/local/bin/ruby
require_relative '../lib/wikk_configuration.rb' #For preinstall testing
#require 'wikk_configuration.rb' #For post install testing
require 'pp'
include WIKK

#Provides a self test of this class, by reading the test configuration file.
#  and attempting to access configuration items as methods. 
def test(config_file)
  puts "creating config from '#{config_file}'"
  config = Configuration.new(config_file)
  
  puts "******Should be there*********"
  puts "base_directories is defined? #{config.respond_to?(:base_directory)}"
  puts "base_directories is: '#{config.base_directory}'"
  puts "******Should NOT be there*********"
  puts "not_there is defined? #{config.respond_to?(:not_there)}"
  puts "******Array*********"
  puts "hello is of class: #{config.hello.class}"
  puts "config.hello[0] => #{config.hello[0]}"
  puts "******Hash*********"
  puts "world is of class: #{config.world.class}"
  puts "config.world['1'] => #{config.world['1']}"
  puts "******Boolean*********"
  puts "boolean is of class: #{config.boolean.class}"
  puts "config.boolean => #{config.boolean}"
  puts "******String*********"
  puts "string is of class: #{config.string.class}"
  puts "config.string => #{config.string}"
  puts "******Numeric*********"
  puts "numeric is of class: #{config.numeric.class}"
  puts "config.numeric => #{config.numeric}"
  puts "****** Dump config using to_s *********"
  pp config
end

puts "Start"
begin
  test('conf.json')
rescue Exception => error
  puts "Error: error"
end
puts "End"



