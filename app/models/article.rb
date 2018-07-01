class Article < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :article_categories
  has_many :categories, through: :article_categories

  belongs_to :user

  validates :user_id, presence: true


  validates :title, presence: true,
            length: {minimum: 5}

  validates :description, presence: true, length: {minimum: 10, maximum: 300}


end