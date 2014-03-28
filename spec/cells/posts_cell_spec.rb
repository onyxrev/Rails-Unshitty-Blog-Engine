require 'spec_helper'

describe "Posts Cell" do
  before(:each) do
    @posts      = build_list(:post, 2)
    @posts_cell = cell(Blogocalypse::Posts, @posts)
  end

  describe "#post_cells" do
    it "it creates a list of post cells for each of its post models" do
      post_cells = @posts_cell.post_cells

      post_cells[0].model.should == @posts[0]
      post_cells[1].model.should == @posts[1]
    end
  end

  describe "#posts" do
    it "returns the posts" do
      @posts_cell.posts.should == @posts
    end
  end

  describe "#show" do
    it "renders" do
      Blogocalypse::PostsCell.any_instance.should_receive(:render)
      @posts_cell.show
    end
  end
end
