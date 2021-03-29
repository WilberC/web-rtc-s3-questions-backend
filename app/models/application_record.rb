class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def questions_api
    Rails.cache.fetch('questions_api') do
      'https://opentdb.com/api.php?'
    end
  end
end
