class Song < ActiveRecord::Base
    has_many :performances
    has_many :karaoke_singers, through: :performances

    def self.find_by_artist artist_name
        Song.find_by artist_name: artist_name
    end

    def number_of_times_sung

        performances = Performance.where(song_id: self.id)
        if performances
            return performances.length
        else
            return 0
        end

    end
end
