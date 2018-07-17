class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true
  validates :body, presence: true
  validates :commenter, presence: true

end
