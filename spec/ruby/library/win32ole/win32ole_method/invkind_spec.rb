require_relative "../../../spec_helper"
platform_is :windows do
  verbose, $VERBOSE = $VERBOSE, nil

  require 'win32ole'

  describe "WIN32OLE_METHOD#invkind" do
    before :each do
      ole_type = WIN32OLE_TYPE.new("Microsoft Scripting Runtime", "File")
      @m_file_name = WIN32OLE_METHOD.new(ole_type, "name")
    end

    it "raises ArgumentError if argument is given" do
      -> { @m_file_name.invkind(1) }.should raise_error ArgumentError
    end

    it "returns expected value for Scripting Runtime's 'name' method" do
      @m_file_name.invkind.should == 2
    end

  end

ensure
  $VERBOSE = verbose
end
