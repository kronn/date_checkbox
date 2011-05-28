module DateCheckbox
  module HasDateCheckbox
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def has_date_checkbox(db_field)
      end
    end
  end
end
