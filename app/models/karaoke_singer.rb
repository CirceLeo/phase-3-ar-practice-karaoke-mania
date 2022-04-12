class KaraokeSinger < ActiveRecord::Base
    has_many :performances
    has_many :songs, through: :performances

    def sing song
        Performance.create(karaoke_singer: self, song: song)
    end

    def buy_drink
        self.update(number_of_drinks: self.number_of_drinks + 1)
    end

    def songs_by_artist artist
        self.songs
    end

    def drinks_tab price_per_drink
        self.number_of_drinks * price_per_drink
    end

    def self.total_table price_per_drink
        running_tab = 0
        KaraokeSinger.all.each do |singer|
            running_tab = running_tab + singer.number_of_drinks
        end
        running_tab * price_per_drink
    end
end
