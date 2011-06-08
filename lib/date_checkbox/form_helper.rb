module DateCheckbox
  module FormHelper
    def date_checkbox(attribute, options = {})
      long, short = ( attribute.to_s =~ /_at$/ ) ?
        [ attribute, attribute.to_s.sub(/_at$/, '') ] :
        [ :"#{attribute}_at", attribute ]

      info = object.send(long).to_date if object.send(:"#{short}?")
      check_box(short) + info.to_s
    end
  end
end
