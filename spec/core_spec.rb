require 'spec_helper'
require 'pingdom/cli'

describe Pingdom::Cli::Core do
  before do
    @core = Core.new
  end

  it "core not nil" do
    @core.should_not nil
  end

  after do
  end
end
