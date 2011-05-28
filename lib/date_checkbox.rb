module DateCheckbox
  autoload :HasDateCheckbox, 'date_checkbox/has_date_checkbox'
end

ActiveRecord::Base.send(:include, DateCheckbox::HasDateCheckbox)
