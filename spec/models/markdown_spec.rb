require 'spec_helper'

describe Blogocalypse::Markdown do
  before(:each) do
    @dimensions = Blogocalypse.default_image_size = "400x400#"
    @renderer   = Blogocalypse::Markdown.new
    @fake_html  = "<p>Well maybe I should render an <img src=\"%s\" alt=\"image\" /> and another <img src=\"%s\" alt=\"another image\" /></p>"
  end

  describe "#postprocess" do
    it "calls render_images" do
      fake_html_with_images = double
      @renderer.should_receive(:render_images).with(@fake_html).and_return(fake_html_with_images)
      @renderer.postprocess(@fake_html).should == fake_html_with_images
    end
  end

  describe "#render_images" do
    before(:each) do
      @images                   = create_list(:image, 2)
      @fake_html_with_image_ids = sprintf(@fake_html, "image_id:#{@images[0].id}", "image_id:#{@images[1].id}")
    end

    it "takes an image ID reference and produces the asset URL" do
      result = @renderer.render_images(@fake_html_with_image_ids).to_s

      result.should == sprintf(
        @fake_html,
        @images[0].image.thumb(@dimensions).url,
        @images[1].image.thumb(@dimensions).url
      )
    end
  end
end
