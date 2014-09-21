require 'spec_helper'

describe "Post Cell" do
  before(:each) do
    @post = build(:post)
  end

  it "initializes a Blogocalypse HTML renderer" do
    Blogocalypse::Markdown.should_receive(:new).
      with(:no_links => true, :hard_wrap => true).
      and_call_original

    cell(Blogocalypse::Post, @post)
  end

  it "initializes an instance variable of a markdown renderer using the Blogocalypse HTML renderer" do
    fake_html_renderer     = double
    fake_markdown_renderer = double

    Blogocalypse::Markdown.stub(:new).and_return(fake_html_renderer)
    Redcarpet::Markdown.should_receive(:new).with(fake_html_renderer).and_return(fake_markdown_renderer)

    post_cell = cell(Blogocalypse::Post, @post)

    post_cell.instance_variable_get(:@markdown).should == fake_markdown_renderer
  end

  describe "#new" do
    it "renders" do
      Blogocalypse::PostCell.any_instance.should_receive(:render)
      cell(Blogocalypse::Post, @post).new
    end
  end

  describe "#edit" do
    it "renders" do
      Blogocalypse::PostCell.any_instance.should_receive(:render)
      cell(Blogocalypse::Post, @post).edit
    end
  end

  describe "#show" do
    it "renders" do
      Blogocalypse::PostCell.any_instance.should_receive(:render)
      cell(Blogocalypse::Post, @post).show
    end

    describe "page subject" do
      it "defaults to the post being the page subject" do
        Blogocalypse::PostCell.any_instance.stub(:render)

        post_cell = cell(Blogocalypse::Post, @post)

        post_cell.show
        post_cell.instance_variable_get(:@post_is_the_page_subject).should == true
      end

      it "makes the post not the page subject if explicitly set to false" do
        Blogocalypse::PostCell.any_instance.stub(:render)

        post_cell = cell(Blogocalypse::Post, @post)

        post_cell.show(:post_is_the_page_subject => false)
        post_cell.instance_variable_get(:@post_is_the_page_subject).should == false
      end
    end
  end

  describe "helpers" do
    before(:each) do
      @post_cell = cell(Blogocalypse::Post, @post)
    end

    describe "#body_as_html" do
      it "renders the body markdown as HTML" do
        fake_markdown_renderer = double
        fake_html = "<h2>Bad Cop. No Donut</h2>"

        Redcarpet::Markdown.stub(:new).and_return(fake_markdown_renderer)
        post_cell = cell(Blogocalypse::Post, @post)

        fake_markdown_renderer.should_receive(:render).with(@post.body).and_return(fake_html)

        post_cell.body_as_html.should == fake_html
      end
    end

    describe "#post_title" do
      it "renders the title partial" do
        fake_title                    = "What am I? A title."
        fake_post_is_the_page_subject = "BRAINZ"

        @post_cell.instance_variable_set(:@post_is_the_page_subject, fake_post_is_the_page_subject)

        Blogocalypse::PostCell.any_instance.should_receive(:render).with(
          :partial => "title",
          :locals => {
            :model => @post,
            :title => @post.title,
            :post_is_the_page_subject => fake_post_is_the_page_subject
          }
        ).and_return(fake_title)

        @post_cell.post_title.should == fake_title
      end
    end

    describe "#comments_cell" do
      it "returns a comments cell" do
        fake_comments_cell = double
        Blogocalypse::PostCell.any_instance.should_receive(:cell).with(Blogocalypse::Comments, @post).and_return(fake_comments_cell)

        @post_cell.comments_cell.should == fake_comments_cell
      end
    end

    describe "#tags_cell" do
      it "returns a tags cell for the post's tags" do
        fake_tags_cell = double
        Blogocalypse::PostCell.any_instance.should_receive(:cell).with(Blogocalypse::Tags, @post.tag_taggings).and_return(fake_tags_cell)

        @post_cell.tags_cell.should == fake_tags_cell
      end
    end

    describe "#images_cell" do
      it "returns an images cell for the post's images" do
        fake_images_cell = double
        Blogocalypse::PostCell.any_instance.should_receive(:cell).with(Blogocalypse::Images, @post.images).and_return(fake_images_cell)

        @post_cell.images_cell.should == fake_images_cell
      end
    end

    describe "#new_image_cell" do
      it "builds a new post image and returns its image cell" do
        fake_new_image      = double
        fake_new_image_cell = double

        @post.stub_chain(:images, :build).and_return(fake_new_image)

        Blogocalypse::PostCell.any_instance.should_receive(:cell).with(Blogocalypse::Image, fake_new_image).and_return(fake_new_image_cell)

        @post_cell.new_image_cell.should == fake_new_image_cell
      end
    end

    describe "published_at" do
      it "returns the unpublished string if no published_at is set" do
        @post.published_at = nil
        @post_cell.published_at.should == I18n.t("posts.unpublished")
      end

      it "returns the formatted datetime if published_at is set" do
        fake_time = "PEANUT BUTTER JELLY TIME"
        @post.stub_chain(:published_at, :strftime).with(Blogocalypse.date_format).and_return(fake_time)

        @post_cell.published_at.should == fake_time
      end
    end
  end
end
