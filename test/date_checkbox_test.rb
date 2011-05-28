require 'test_helper'

class DateCheckboxTest < ActiveSupport::TestCase
  # implementation and infratructure details
  test "schema is loaded" do
    assert_equal [], PublishedAtPost.all
  end
end
