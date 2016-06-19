# wikk_configuration

* http://rbur004.github.com/configuration/
* Source https://github.com/wikarekare/configuration
* Gem https://rubygems.org/gems/wikk_configuration

## DESCRIPTION:

Ruby class to read json configuration files, and present the top level values as method calls

## FEATURES/PROBLEMS:



## SYNOPSIS:

	require 'configuration'
	include WIKK
  @config = Configuration.new(config_file) #Where config_file is a json file.
    
  eg. config_file with json types
  {
    "array": [ 0, 1, 2, 3 , 4 ],
    "hash": { "0": 0, "1": 1, "2": 2 },
    "boolean": true,
    "string": "string",
    "numeric": 1.2345
  }
  
  Results in Ruby variables of classes:
  
  @config.array.class => Array
  @config.hash.class => Hash
  @config.boolean.class => TrueClass
  @config.string.class => String
  @config.numeric.class => Float
  
  Only top level hash names are converted to methods. 
  Be careful not to use a hash key that would conflict with a local method in Class.
	
## REQUIREMENTS:


## INSTALL:

* sudo gem install wikk_configuration

## LICENSE:

Copyright (c) 2016, wikarekare
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of configuration nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
