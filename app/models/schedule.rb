class Schedule < ApplicationRecord
    belongs_to :user
    
    validates :content, presence: true, length: { maximum: 255 }
    validates :start_time, :end_time, presence: true
end