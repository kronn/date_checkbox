module DateCheckbox
  autoload :HasDateCheckbox, 'date_checkbox/has_date_checkbox'
  autoload :FormHelper,      'date_checkbox/form_helper'
end

ActiveRecord::Base.send(:include, DateCheckbox::HasDateCheckbox)
ActionView::Helpers::FormBuilder.send(:include, DateCheckbox::FormHelper)
