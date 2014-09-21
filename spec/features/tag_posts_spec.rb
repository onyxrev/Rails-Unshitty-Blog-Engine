require 'spec_helper'

describe "viewing the post tags index" do
  before(:each) do
    @posts = create_list(:post, 20).sort_by{ |p| p.published_at }.reverse

    visit post_tags_path
  end

  it "shows links to the post tag pages" do
    @posts.map{ |p| p.tags }.flatten.each do |tag|
      page.html.index(post_tag_path(:id => tag.name)).should > -1
    end
  end
end

describe "viewing the post tag page" do
  before(:each) do
    tag = Faker::Lorem.word

    @post1 = create(:post, { tag_list: tag })
    @post2 = create(:post, { tag_list: tag })

    visit post_tag_path(:id => @post1.tags.first.name)
  end

  it "shows posts tagged with the requested tag" do
    page.should have_content @post1.tags.first.name
    page.should have_content @post1.title
    page.should have_content @post2.title
  end
end
