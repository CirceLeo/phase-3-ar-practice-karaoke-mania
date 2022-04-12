class KaraokeSinger < ActiveRecord::Base
    has_many :performances
    has_many :songs, through: :performances

    def sing song
        Performance.create(karaoke_singer: self, song: song)
    end

    def buy_drink
        self.update(number_of_drinks: self.number_of_drinks + 1)
    end

    def songs_by_artist 
        artists = []
        self.songs.each do |song|
            artists << song.artist_name
        end
        artists.uniq
    end

    def drinks_tab price_per_drink
        self.number_of_drinks * price_per_drink
    end

    def self.total_tab price_per_drink
        running_tab = 0
        #KaraokeSinger.all.sum {|singer| singer.number_of_drinks}
        KaraokeSinger.all.each do |singer|
            running_tab = running_tab + singer.number_of_drinks
        end
        running_tab * price_per_drink
    end
end
