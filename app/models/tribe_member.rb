# frozen_string_literal: true

class TribeMember < ApplicationRecord
  self.primary_key = "id"

  has_many :descendants, class_name: "TribeMember", foreign_key: "ancestor_id"
  belongs_to :ancestor, class_name: "TribeMember", optional: true
end
