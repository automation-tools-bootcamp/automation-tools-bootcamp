require 'spec_helper'

describe 'device-mapper::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
