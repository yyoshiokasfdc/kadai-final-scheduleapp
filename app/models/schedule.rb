class Schedule < ApplicationRecord
    belongs_to :user
    
    validates :content, presence: true, length: { maximum: 255 }
    validates :end_time, presence: true
    validates :start_time, presence: true, numericality: { less_than: :end_time}
    
end