module DateCheckbox
  module HasDateCheckbox
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def has_date_checkbox(db_field)
        method_name = db_field.to_s.sub(/_at$/, '')
        class_eval do
          define_method("#{method_name}") do
            if attribute_present?(db_field)
              I18n.t(:"is_#{method_name}")
            else
              I18n.t(:"not_#{method_name}")
            end
          end

          define_method("#{method_name}?") do
            attribute_present?(db_field)
          end

          define_method("#{method_name}=") do |value|
          end
        end
      end
    end
  end
end
