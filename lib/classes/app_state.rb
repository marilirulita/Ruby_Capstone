class AppState
  attr_reader :books_list
  attr_reader :music_list
  attr_reader :movies_list
  attr_reader :games_list
  attr_reader :genres_list
  attr_reader :labels_list
  attr_reader :authors_list
  attr_reader :sources_list

  def initialize
    @books_list = []
    @music_list = []
    @movies_list = []
    @games_list = []
    @genres_list = []
    @labels_list = []
    @authors_list = []
    @sources_list = []
  end
end