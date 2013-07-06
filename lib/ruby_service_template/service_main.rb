require 'rubygems'
require 'win32/daemon' if RUBY_PLATFORM =~ /mingw32/
require 'daemons' if RUBY_PLATFORM =~ /linux/
if RUBY_PLATFORM =~ /linux/
  class Daemon
    
  end
end
require 'socket'
require 'net/http' 
require 'fileutils'

module RubyServiceTemplate
  include Win32 if RUBY_PLATFORM =~ /mingw32/
  
  begin
    class DemoDaemon < Daemon  # http://stackoverflow.com/questions/163497/running-a-ruby-program-as-a-windows-service
      
      def service_main
        your, data = init_service

        while running?
            my_logger "#{Time.now}:  Hello World" if DEBUG_MODE
          end
          
          sleep STANDARD_INTERVAL
        end
      end

      def service_stop
        File.open(LOG_FILE, "a"){ |f| f.puts "***Service stopped #{Time.now}" }
        exit!  # the guy I took the code from might have found the exit! command useful... I can't find a use for it.  Wait.. I think it can't stop if you leave it out now... still undecided....
      end
      
      # Does initialization preparations for the service.  
      # returns an array of [host_name, '']
      def init_service
        handle_missing_specifications and exit! if missing_specifications_detected
        ['your', 'data']
      end
      
      # To run, the daemon needs to have an IP Lookup address, and
      # an IP_FIXER_HUB specified in the config.  If those aren't 
      # found, we need to exit
      def missing_specifications_detected
        # FIXME:  Write propper logic for this
        #(IP_FIXER_HUB.nil? || IP_LOOKUP_URL.nil?) ? true : false
      end
      
      def handle_missing_specifications
        File.open(LOG_FILE,'a+') do |f|
          f.puts " ***YAML FILE PROBLEM DETECTED, IP_FIXER_HUB or IP_LOOKUP_URL was nil.  You can't run this service with out a server to contact, or a way of looking up your IP: " 
          f.puts "#{IP_FIXER_HUB} ... #{IP_LOOKUP_URL}" 
          f.puts "Check your conf file at c:\\it\\ipfixer\\conf\\conf.yml"
        end
        true
      end

      def handle_invalid_ip(current_ip)
        my_logger "**ERROR:  Recieved an invalid ip."
        my_logger "  current_ip:  #{current_ip}"
        sleep STANDARD_INTERVAL
        true
      end
      
      def sleep(x) # for stub testing...
        Kernel.sleep x
      end
      
      def my_logger(text)
        IpfixerClient.my_logger(text)
      end

    end


  rescue Exception => err
    File.open(LOG_FILE,'a+'){ |f| f.puts " ***Daemon failure #{Time.now} err=#{err} " }
    raise
  end

end
