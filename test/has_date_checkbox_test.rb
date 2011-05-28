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

  test "returns something falsish when attribute is not set" do
    instance.published_at = nil
    assert_equal false, instance.published?
    assert_equal I18n.t(:not_published), instance.published
  end

  test "returns something trueish when attribute is set" do
    instance.published_at = 1.minute.ago
    assert_equal true,  instance.published?
    assert_equal I18n.t(:is_published), instance.published
  end

  test "has_date_checkbox defines a custom writer for the given attribute" do
    assert_respond_to instance, :'published='
  end

  test "can be reset to 'not yet'" do
    instance.published = "0"
    assert !instance.published?
  end

  test "can be set to 'right now'" do
    instance.published = "1"
    assert instance.published?
  end

  test "works with update_attributes" do
    assert !instance.published?
    instance.update_attributes!({:published => "1"})
    assert instance.published?
    instance.update_attributes!({:published => "0"})
    assert !instance.published?
  end

  protected

  def klass
    @klass ||= Class.new do
      include DateCheckbox::HasDateCheckbox
    end
  end

  def instance
    @instance ||= PublishedAtPost.new
  end
end
