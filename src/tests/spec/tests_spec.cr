require "./spec_helper"

describe Tests do
  # TODO: Write tests

  # it "works" do
  #   false.should eq(true)
  # end

  it "does a thing", focus: true do
    banner.should eq("Banner Text")
  end

  it "does another thing" do
    banner.should_not eq("Banner Text!")
  end

  describe "does a couple of things" do
  
    it "first thing" do
      banner_size.should eq(11)
    end

    it "second thing" do
      banner_size.should_not eq(12)
    end
  
  end

end
