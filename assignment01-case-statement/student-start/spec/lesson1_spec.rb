require 'rspec'
require 'rspec/its'

describe "lesson1" do

  context "check results" do
    result=`ruby assignment01-solution.rb`.chomp!

    it "unexpected output" do
      expect(result).to eq("I guess nothing matched... But why?")
    end
  end

  context "check implementation" do
    srcCode = File.open("assignment01-solution.rb", "r").read

    it "remove if clause" do
      expect(srcCode).not_to include("if")
    end

    it "remove elsif clause" do
      expect(srcCode).not_to include("elsif")
    end

    it "remove elsif clause" do
      expect(srcCode).not_to include("elsif")
    end

    it "missing case" do
      expect(srcCode).to include("case")
    end
  end
end
