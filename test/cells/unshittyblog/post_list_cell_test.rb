require 'test_helper'

class PostListCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
