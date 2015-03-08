require 'spec_helper'

describe 'aufs::package' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
