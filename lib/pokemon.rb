class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type
    @db = db
  end
  
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, database_connection)
    pokedex = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokedex[1]
    type = pokedex[2]

    pokemon = Pokemon.new(id: id, name: name, type: type, db: database_connection)
  end
  
end
