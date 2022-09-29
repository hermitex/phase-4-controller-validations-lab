class Post < ApplicationRecord
  validates :title, presence: true
  validates(:content, {:length => {:minimum => 100}})
  validate :category_must_be_fiction_or_non_fiction

  private
  def category_must_be_fiction_or_non_fiction
    unless category == "Fiction" || category == "Non-Fiction"
      errors.add(:category, "is not included in the list")
    end
  end
end
