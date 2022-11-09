# frozen_string_literal: false

class Task < ApplicationRecord
  validates :title, :details, presence: true
end
