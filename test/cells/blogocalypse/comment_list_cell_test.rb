require 'test_helper'

class CommentListCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
