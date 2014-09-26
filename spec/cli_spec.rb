require 'spec_helper'
require 'pingdom/cli'

describe Pingdom::Cli::CLI do
  before do
  end

  it "should stdout sample" do
    output = capture_stdout do
      Pingdom::Cli::CLI.start(['sample'])
    end
    output.should == "This is your new task\n"
  end

  after do
  end
end
