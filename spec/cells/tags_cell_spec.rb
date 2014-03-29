require 'spec_helper'

describe "Tags Cell" do
  before(:each) do
    @tags_cell = cell(Blogocalypse::Tags, @post)
  end

  describe "#show" do
    it "renders" do
      Blogocalypse::TagsCell.any_instance.should_receive(:render)

      @tags_cell.show
    end
  end

  describe "#edit" do
    it "pulls the form passed in as an instance variable" do
      fake_form = double
      Blogocalypse::TagsCell.any_instance.stub(:render)

      @tags_cell.edit :form => fake_form
      @tags_cell.instance_variable_get(:@form).should == fake_form
    end
  end
end
