require 'spec_helper'

describe "viewing the posts index" do
  before(:each) do
    @posts = create_list(:post, 20).sort_by{ |p| p.published_at }.reverse

    visit posts_path
  end

  it "shows the first ten posts" do
    @posts[0..9].each do |post|
      page.should have_content post.title
    end
  end

  it "provides links to visit the post page" do
    click_on @posts[0].title
    current_path.should == post_path(:id => @posts[0].slug)
  end

  it "paginates" do
    @posts[10..19].each do |post|
      page.should_not have_content post.title
    end

    within ".usb-pagination" do
      page.should have_content "1"
      page.should have_content "2"

      click_on "2"
    end

    @posts[10..19].each do |post|
      page.should have_content post.title
    end
  end

  it "renders in reverse chronological order" do
    all(".usb-post-title").each_with_index do |title, index|
      title.text.should == @posts[index].title
    end
  end
end

describe "viewing the post page" do
  before(:each) do
    @post = create(:post)
    visit post_path(@post)
  end

  it "renders the various post attributes" do
    post_cell = cell(Blogocalypse::Post, @post)

    page.should have_content @post.title

    # kinda testing the system under load but we have html rendering covered in the unit tests
    page.html.include?(post_cell.body_as_html).should == true
    page.should have_content post_cell.published_at
  end

  it "renders the tags cell for the post" do
    within ".usb-post-tag-list" do
      @post.tags.each do |tag|
        page.should have_content tag
      end
    end
  end

  it "renders the comments cell for the post" do
    page.should have_selector "#disqus_thread"
  end

  it "has a link back to the posts index" do
    click_on I18n.t("posts.all")

    current_path.should == posts_path
  end
end
