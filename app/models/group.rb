# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  ower_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
end