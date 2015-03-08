# Helpers module
module Helpers
  # Helpers::DeviceMapperTest module
  module DeviceMapperTest
    require 'chef/mixin/shell_out'
    include Chef::Mixin::ShellOut
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources
  end
end
