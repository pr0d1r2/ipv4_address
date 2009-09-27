$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ipv4_address'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end
