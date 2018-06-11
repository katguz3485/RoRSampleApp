class Article < ApplicationRecord
  has_many :application_records
  validates :title, presence: true,
                    length: { minimum: 5 }


end
