LOG_FILE = "C:\\Program Files\\ruby_service_template\\log.txt"
LOG_FOLDER = File.dirname LOG_FILE
LONG_DURATION = 1000
STANDARD_INTERVAL = 500
DEBUG_MODE = true
WINDOWS = RUBY_PLATFORM =~ /mingw32/ ? true : false
LINUX = RUBY_PLATFORM =~ /linux/ ? true : false

SERVICE_NAME = 'ipfixer_svc'
SERVICE_DESC = 'A service that helps keep track of remote infrastructure.'


module RubyServiceTemplate
  # FIXME:  move stuff into this namespace
end

