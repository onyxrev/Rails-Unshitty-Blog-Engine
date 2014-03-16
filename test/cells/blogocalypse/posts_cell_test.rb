require 'test_helper'

class PostsCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
end
