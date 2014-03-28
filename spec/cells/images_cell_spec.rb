require 'spec_helper'

describe "Images Cell" do
  before(:each) do
    @images      = build_list(:image, 2)
    @images_cell = cell(Blogocalypse::Images, @images)
  end

  describe "#image_cells" do
    it "uses persisted images" do
      fake_images = double
      fake_persisted_images = double
      Blogocalypse::ImagesCell.any_instance.should_receive(:persisted_images).and_return(fake_images)
      fake_images.should_receive(:map).and_return(fake_persisted_images)

      @images_cell.image_cells.should == fake_persisted_images
    end

    it "it creates a list of post cells for each of its post models" do
      Blogocalypse::ImagesCell.any_instance.stub(:persisted_images).and_return(@images)

      images_cells = @images_cell.image_cells

      images_cells[0].model.should == @images[0]
      images_cells[1].model.should == @images[1]
    end
  end

  describe "#pick" do
    it "renders" do
      Blogocalypse::ImagesCell.any_instance.should_receive(:render)
      @images_cell.pick
    end
  end
end
