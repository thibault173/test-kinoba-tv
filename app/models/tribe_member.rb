# frozen_string_literal: true

class TribeMember < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true
  validates :surname, presence: true
  validates :birthdate, presence: true

  has_many :descendants, class_name: "TribeMember", foreign_key: "ancestor_id"
  belongs_to :ancestor, class_name: "TribeMember", optional: true

  scope :search_by_name, ->(name) { where("name LIKE ?", "%#{name}%") }
  scope :search_by_surname, ->(surname) { where("surname LIKE ?", "%#{surname}%") }
  scope :search_by_birthdate, ->(birthdate) { where("birthdate = ?", birthdate.strftime("%d/%m/%Y")) }
  scope :search_by_ancestor_id, ->(ancestor_id) { where(ancestor_id: ancestor_id) }

  def birthdate_display
    birthdate.strftime('%d %b %Y')
  end

  def full_name
    name + " " + surname.upcase
  end
end
