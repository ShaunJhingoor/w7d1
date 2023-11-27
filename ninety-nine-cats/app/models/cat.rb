class Cat < ApplicationRecord
    CAT_COLORS = ["red","blue"]
    validates :birth_date, presence: true 
    validate :birth_date_cannot_be_future
    validates :color, presence: true, inclusion: { in: CAT_COLORS}
    validates :name, presence: true
    validates :sex, presence: true,inclusion: { in: %w(M F)}
    def birth_date_cannot_be_future
        if !birth_date.nil? && birth_date > Date.today 
          errors.add(:birth_date, "can't be in the future")
        end
      end
      #kitty = Cat.new(birth_date: '2015/01/20')
      def age 
            age = Date.today.year - birth_date.year
            age -= 1 if Date.today.month < birth_date.month || (Date.today.month == birth_date.month && Date.today.day == birth_date.day)
            age
        end 
end
