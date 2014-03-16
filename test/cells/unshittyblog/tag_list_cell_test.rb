require 'test_helper'

class TagListCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  
  test "edit" do
    invoke :edit
    assert_select "p"
  end
  

end
