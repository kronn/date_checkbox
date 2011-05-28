require 'test_helper'

class HasDateCheckboxTest < ActiveSupport::TestCase
  def teardown
    @klass = nil
  end

  test "a class method for one field is added" do
    assert_respond_to klass, :has_date_checkbox
    assert_equal 1, klass.method(:has_date_checkbox).arity
  end

  protected

  def klass
    @klass ||= Class.new do
      include DateCheckbox::HasDateCheckbox
    end
  end
end
