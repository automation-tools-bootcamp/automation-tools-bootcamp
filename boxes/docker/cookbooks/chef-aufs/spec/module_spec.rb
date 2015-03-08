require 'spec_helper'

describe 'aufs::module' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
