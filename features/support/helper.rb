# frozen_string_literal: true
def fill_in_upload(id)
  fixture_path = File.expand_path("#{File.dirname(__FILE__)}/../fixtures")

  add_button = find("[data-e2e=#{id}] button")
  add_button.click

  attach_file(
    nil,
    "#{fixture_path}/asset.txt",
    class: 'upload-field-input'
  )
end
