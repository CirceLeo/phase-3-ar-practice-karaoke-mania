
puts "Ok, you ready to SING?"

20.times do 
    KaraokeSinger.create(name: Faker::FunnyName.name, number_of_drinks:0)
end


puts "i made some singers for you, here's one:"
puts KaraokeSinger.last.name

50.times do 
    Song.create(artist_name: Faker::Kpop.ii_groups, title: Faker::GreekPhilosophers.quote, runtime_in_minutes: rand(2..6) )
end

puts "I made some songs, here's one title"
puts Song.last.title

20.times do
Performance.create(karaoke_singer: KaraokeSinger.all.sample, song: Song.all.sample)
end
puts "i made some performances, here's one"
puts "singer", Performance.last.karaoke_singer.name
puts "song", Performance.last.song.title