class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    
    # drake = Artist.create(:name=>'Drake')
    # Artist.all << drake unless Artist.all.include?(drake)
    # self.artist = drake

    # drake = Artist.create(:name=>'Drake')
    # if !Artist.all.include?(drake)
    #   drake = Artist.create(:name=>'Drake')
    #   self.artist = drake
    # else
    #   self.artist = drake
    # end

    if Artist.all.select { |art| art.name == "Drake"}.length > 0
      drake = Artist.all.select { |art| art.name == "Drake"}[0]
    else
      drake = Artist.create(:name=>'Drake')
    end
    self.artist = drake
    end
end