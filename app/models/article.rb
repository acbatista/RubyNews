class Article < ActiveRecord::Base
	validates :title, :category, :body, presence: true
	belongs_to :category
end
