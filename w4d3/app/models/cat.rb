require 'action_view'

class Cat < ActiveRecord::Base
  include ActionView::Helpers::DateHelper


  CAT_COLORS = %w(black white orange brown)

  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    dependent: :destroy
  )

  validates(
    :birth_date,
    :color,
    :name,
    :sex,
    presence: true
  )

  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: %w(M F)
  validate :validate_user_id

  belongs_to :owner,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  def age
    time_ago_in_words(birth_date)
  end

  def validate_user_id
    if self.user_id == 0
      self.errors[:user_id] << 'cannot be blank'
    end
  end
end
