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
          end

          define_method("#{method_name}?") do
          end

          define_method("#{method_name}=") do |value|
          end
        end
      end
    end
  end
end
