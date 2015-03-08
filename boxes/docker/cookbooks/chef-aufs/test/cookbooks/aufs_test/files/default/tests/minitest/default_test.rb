require File.expand_path('../support/helpers', __FILE__)

describe_recipe 'aufs_test::default' do
  include Helpers::AufsTest
end
