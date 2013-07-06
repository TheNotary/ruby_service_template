# Require in your libraries here
require 'ruby_service_template/strings'
require 'ruby_service_template/logger'
require 'ruby_service_template/version'
require 'ruby_service_template/installer.rb'
require 'ruby_service_template/service_main'


config = RubyServiceTemplate.get_configuration_settings


module RubyServiceTemplate
  extend Logger
  
  def self.help
    puts "This is ipfixer_client, a little client... see the docs"  # refactor to strings.rb.help
  end
  
  def self.client_svc
    DemoDaemon.mainloop
  end
  
  def self.install
    i = Installer.new 
    i.install 
  end
  
  def self.uninstall
    i = Installer.new
    i.uninstall
  end
  
  def self.start
    if IpfixerClient::Installer.service_installed?
      puts "We can start"
      if WINDOWS
        result = `sc start #{SERVICE_NAME}`
        puts result
      elsif LINUX
        # FIXME:  Write logic
      elsif OSX
        # FIXME:  Write logic
      end
    else
      puts "The service is not yet installed, please run the command `ipfixer install`"
    end
  end
  
  def self.stop
    if IpfixerClient::Installer.service_installed?
      puts "We can stop"
      if WINDOWS
        result = `sc stop #{SERVICE_NAME}`
        puts result
      elsif LINUX
        # FIXME:  Write logic
      end
    else
      puts "The service is not yet installed"
    end
  end
  
end
