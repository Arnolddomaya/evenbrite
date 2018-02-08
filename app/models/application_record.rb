class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def home
    render html: "Hello word"
  end
end
