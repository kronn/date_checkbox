require 'test_helper'

class DateCheckboxFormHelperTest < ActiveSupport::TestCase
  test "form-helpers include the the date_checkbox-helper" do
    assert_respond_to instance, :date_checkbox
    assert_equal -2, instance.method(:date_checkbox).arity
  end

  test "helper outputs a checkbox" do
    assert_nothing_raised(Exception) do
      result = instance.date_checkbox :published_at
      assert_equal "check_box published", result

      result = instance.date_checkbox :published
      assert_equal "check_box published", result
    end
  end

  test "helper output the info after the checkbox" do
    assert_nothing_raised(Exception) do
      instance = instance(:published_at => Time.now)
      result = instance.date_checkbox :published_at
      assert_match(/^check_box published\d{4}-\d{2}-\d{2}$/, result)

      result = instance.date_checkbox :published
      assert_match(/^check_box published\d{4}-\d{2}-\d{2}$/, result)
    end
  end

  def klass
    @klass ||= Class.new() do
      include DateCheckbox::FormHelper

      attr_reader :object

      def initialize(object_args = {})
        @object = PublishedAtPost.new(object_args)
      end

      def check_box(sym)
        "check_box #{sym}"
      end
    end
  end

  def instance(object_args = {})
    @instance ||= klass.new(object_args)
  end
end
