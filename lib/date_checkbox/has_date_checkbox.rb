module DateCheckbox
  module HasDateCheckbox
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def has_date_checkbox(db_field)
        method_name = db_field.to_s.sub(/_at$/, '')
        # send :include, InstanceMethods
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
            if value.to_s == "0"
              write_attribute(db_field, nil)
            else
              write_attribute(db_field, Time.now)
            end
          end
        end
      end
    end

    # module InstanceMethods
    # end
  end
end
