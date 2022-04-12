class Song < ActiveRecord::Base
    has_many :performances
    has_many :karaoke_singers, through: :performances
end
