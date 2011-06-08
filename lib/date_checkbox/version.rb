# vim:ft=ruby:fileencoding=utf-8

module DateCheckbox
  unless defined?(VERSION)
    # version of gem
    VERSION = '0.0.1'
  end

  unless defined?(DATE)
    # date of last modification of the version
    DATE = File.mtime(__FILE__)
  end

  unless defined?(SUMMARY)
    # Purpose in one sentence
    SUMMARY = 'Rails-plugin to create a checkbox for datetime-attributes.'
  end

  unless defined?(DESCRIPTION)
    # short description, see README for details
    DESCRIPTION = <<-EOD
This is a rails-plugin which can create a checkbox for attributes which are
datetime-fields in the database. So, if you want to store the date when a user
appected some terms or received some goods, but want to circumvent the need of
selecting the proper date and time from 6 dropdowns, you can just use this
plugin.

It created some wrapper-methods on the model for the attributes you specify and
provides a form-helper which uses these. The model-method also work with
standard checkbox-tags
    EOD
  end

  unless defined?(EXTRA_RDOC_FILES)
    # list of file which should be included in rdoc
    EXTRA_RDOC_FILES = ['README']
  end
end
