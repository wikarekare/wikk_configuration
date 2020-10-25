module WIKK
  require 'json'
  require "wikk_json" #gem version

  #Reads json configuration and provides access to the configuration data
  #as method calls.
  #  @attr_accessor pjson [Hash] Raw hash created from reading the json file  
  class Configuration
    VERSION = '0.1.3'
  
    attr_accessor :pjson
    
    # Creates an instance of Configuration from a json file
    #
    # @param [String|Hash] filename The Json file or a Ruby Hash, equivalent to the json
    # @return [Configuration]
    def initialize(filename="#{File.dirname(__FILE__)}/../conf/config.json")
      if filename.class == Hash
        @filename = nil
        @pjson = filename
      else
        @filename = filename 
        json = File.read(filename)
        @pjson = JSON.parse(json)
      end
    end
  
    # Provides a test for a method named after a json configuration item exists
    #
    # @note We need to define respond_to? as well as method_missing to satisfy tests in some libraries.
    # @param symbol [Symbol,String]  The method name we need to test exists
    # @param include_private [Boolean]  Extend the test to private methods
    # @return [Boolean] true if the method exists
    def respond_to?(symbol, include_private = false)
      (@pjson[s = symbol.to_s] != nil) || (s[-1,1] == '=' && @pjson[s[0..-2]] != nil) || super(symbol, include_private)
    end

    # Default handler to map json configuration names to method names
    #
    # @note Be aware of the possibility of name conflicts between built in class methods an configuration items defined in the json file)
    # @param symbol [symbol,String] The method name that maps to a json configuration item
    # @param args [Array] Not used, but would hold arguments to the method call. Should be zero length for our methods.
    # @param block [Block] Not used, but would be a code block supplied to the method. 
    # @return [Object] the data associated with the json name, (hence method name) in the configuration file.
    def method_missing(symbol , *args, &block)
      s = symbol.to_s
      if @pjson[s] != nil
        return @pjson[s]
      elsif s[-1,1] == "="
        @pjson[s[0..-2]] = args[0]
      else
        super
      end     
    end
    
    # Write Json config file. Either over the original, or a new file.
    #
    # @param filename [String] overrides @filename, if creating a new file.
    def save(filename = nil)
      filename ||= @filename
      if filename != nil
        File.open(filename , "w+") do |fd|
          fd.write(@pjson.to_j)
        end
      end
    end
  
    # Config to string
    #
    # @return [String] the configuration
    def to_s
      @pjson.to_s
    end
  
  end
end
