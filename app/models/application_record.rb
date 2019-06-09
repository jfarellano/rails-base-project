class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum role: [:admin, :normal]
end
