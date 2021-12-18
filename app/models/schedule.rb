class Schedule < ApplicationRecord
    validates :content, presence: true, length: { maximum: 255 }
    validates :start_time, :end_time, presence: true
end