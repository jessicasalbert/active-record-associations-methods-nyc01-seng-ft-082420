class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    songs.filter { |song| song.genre == self }.count
  end

  def artist_count
    # return the number of artists associated with the genre
    songs.filter { |song| song.genre == self }.map { |song| song.artist }.uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    songs.map { |song| song.artist.name }.uniq
  end
end
