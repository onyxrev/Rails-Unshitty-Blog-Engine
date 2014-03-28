require 'spec_helper'

describe "Comments Cell" do
  before(:each) do
    @comments_cell = cell(Blogocalypse::Comments, @post)
  end

  describe "#show" do
    it "renders nothing if there's no disqus shortname" do
      Blogocalypse::CommentsCell.any_instance.stub(:disqus_shortname)
      Blogocalypse::CommentsCell.any_instance.should_not_receive(:render)

      @comments_cell.show
    end

    it "renders if there is a disqus shortname" do
      Blogocalypse::CommentsCell.any_instance.stub(:disqus_shortname).and_return("stimulator")
      Blogocalypse::CommentsCell.any_instance.should_receive(:render)

      @comments_cell.show
    end
  end

  describe "#disqus_shortname" do
    it "returns the configured disqus shortname" do
      fake_shortname = "stimulator"
      Blogocalypse.stub(:disqus_shortname).and_return(fake_shortname)

      @comments_cell.disqus_shortname.should == fake_shortname
    end
  end

  describe "#disqus_identifier" do
    it "returns nothing if no post was passed in" do
      @comments_cell.disqus_identifier.should == nil
    end

    it "returns an identifier if a post was passed in" do
      post          = build(:post)
      comments_cell = cell(Blogocalypse::Comments, post)

      comments_cell.disqus_identifier.should_not == nil
    end
  end
end
