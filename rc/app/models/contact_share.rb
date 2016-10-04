class ContactShare < ActiveRecord::Base
  validates :contact_id, presence: true
  validates :user_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :contact_id }

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :contacts,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :Contact
end
