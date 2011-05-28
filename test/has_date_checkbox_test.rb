require 'test_helper'

class HasDateCheckboxTest < ActiveSupport::TestCase
  def teardown
    @klass = nil
    @instance = nil
  end

  test "a class method for one field is added" do
    assert_respond_to klass, :has_date_checkbox
    assert_equal 1, klass.method(:has_date_checkbox).arity
  end

  test "has_date_checkbox defines a custom reader for the given attribute" do
    assert_respond_to instance, :published
    assert_respond_to instance, :published?
  end

  test "has_date_checkbox defines a custom writer for the given attribute" do
    assert_respond_to instance, :'published='
  end
  protected

  def klass
    @klass ||= Class.new do
      include DateCheckbox::HasDateCheckbox
    end
  end

  def instance
    @instance ||= begin
                    inst = PublishedAtPost.new
                    inst.class.send(:include, DateCheckbox::HasDateCheckbox)
                    inst.class.class_eval do
                      has_date_checkbox :published_at
                    end
                    inst
                  end
  end
end
