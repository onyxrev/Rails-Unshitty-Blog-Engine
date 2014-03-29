require 'spec_helper'

describe "View Model" do
  describe "#initialize" do
    it "initializes a router into an instance variable" do
      fake_router = double
      Blogocalypse::Router.should_receive(:new).and_return(fake_router)

      view_model = Blogocalypse::ViewModel.new({})
      view_model.instance_variable_get(:@router).should == fake_router
    end
  end
end
