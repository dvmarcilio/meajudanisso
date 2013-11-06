##
##  http://lostechies.com/derickbailey/2011/09/27/adding-a-has_image-matcher-to-capybara/
##
module Capybara
  class Session
    def has_image?(image)
      has_xpath?("//img[@src=\"/assets/#{image}\"]")
    end
  end
end

