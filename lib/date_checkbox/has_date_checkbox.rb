module DateCheckbox
  module HasDateCheckbox
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def has_date_checkbox(db_field)
        # if db_field.to_s =~ /_at$/ #&& has_attribute?(db_field)
          column_name = db_field
          method_name = db_field.to_s.sub(/_at$/, '')
        # elsif has_attribute?(:"#{db_field}_at")
        # else
        #   column_name = :"#{db_field}_at"
        #   method_name = db_field.to_s
        # end

        # send :include, InstanceMethods
        class_eval do
          define_method("#{method_name}") do
            if attribute_present?(column_name)
              "1" # I18n.t(:"is_#{method_name}")
            else
              "0" # I18n.t(:"not_#{method_name}")
            end
          end

          define_method("#{method_name}?") do
            attribute_present?(column_name)
          end

          define_method("#{method_name}=") do |value|
            if value.to_s == "0"
              write_attribute(column_name, nil)
            else
              write_attribute(column_name, Time.now)
            end
          end
        end
      end
    end

    # module InstanceMethods
    # end
  end
end
