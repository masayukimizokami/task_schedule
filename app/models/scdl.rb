class Scdl < ApplicationRecord
    validates :title, presence: true
    validates :start_day, presence: true
    validates :end_day, presence: true
    validate :date_before_finish
      def date_before_finish
        return if end_day.blank?
        errors.add(:end_day, "は今日以降の日付で選択して下さい") if end_day < Date.today
      end
end