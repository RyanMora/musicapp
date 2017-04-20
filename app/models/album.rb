# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  band_id     :integer          not null
#  record_type :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ApplicationRecord
  validates :name, :band_id, :record_type, presence: true
  validates :record_type, inclusion: { in: %w(live studio) }

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track,
    dependent: :destroy
end
