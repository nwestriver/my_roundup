class Website < ApplicationRecord
    validates :title, presence: true
    validates :url, presence: true

    belongs_to :user
end
