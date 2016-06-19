#!/usr/local/bin/ruby
# -*- ruby -*-

require 'rubygems'
require 'hoe'
Hoe.plugin :yard

Hoe.spec 'wikk_configuration' do 
  self.readme_file = "README.md"
  self.developer( "Rob Burrowes","r.burrowes@auckland.ac.nz")
  remote_rdoc_dir = '' # Release to root
  
  self.yard_title = 'wikk_configuration'
  self.yard_options = ['--markup', 'markdown', '--protected']
end


#Validate manfest.txt
#rake check_manifest

#Local checking. Creates pkg/
#rake gem

#create doc/
#rake docs  
#In directory docs/
#scp -r . rbur004@rubyforge.org:/var/www/gforge-projects/versioncheck/

#Copy up to rubygem.org
#rake release VERSION=1.0.1
