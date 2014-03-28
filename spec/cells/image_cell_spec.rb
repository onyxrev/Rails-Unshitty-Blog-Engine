require 'spec_helper'

describe "Image Cell" do
  before(:each) do
    @image      = build(:image)
    @image_cell = cell(Blogocalypse::Image, @image)
  end

  describe "#pick" do
    it "renders" do
      Blogocalypse::ImageCell.any_instance.should_receive(:render)
      @image_cell.pick
    end
  end

  describe "#pick" do
    it "renders" do
      Blogocalypse::ImageCell.any_instance.should_receive(:render)
      @image_cell.pick
    end
  end

  describe "#new" do
    it "renders" do
      Blogocalypse::ImageCell.any_instance.should_receive(:render)
      @image_cell.pick
    end

    it "builds a new image" do
      fake_image = double
      Blogocalypse::Image.should_receive(:new).and_return(fake_image)
      Blogocalypse::ImageCell.any_instance.stub(:render)

      @image_cell.new
      @image_cell.instance_variable_get(:@image).should == fake_image
    end
  end
end
