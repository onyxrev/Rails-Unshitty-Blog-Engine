require 'spec_helper'

describe "viewing the posts index" do
  before(:each) do
    @posts = create_list(:post, 20)

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
    sorted_posts = @posts.sort_by{ |p| p.published_at }.reverse

    all(".usb-post-title").each_with_index do |title, index|
      title.text.should == sorted_posts[index].title
    end
  end
end
