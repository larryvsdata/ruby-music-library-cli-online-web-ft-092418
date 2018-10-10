class  MusicLibraryController
  attr_accessor :path
  
  def initialize (path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end
  
  
end