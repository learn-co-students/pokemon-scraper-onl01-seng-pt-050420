class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id: nil, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type) 
        VALUES (?, ?)
      SQL
      #pokemon = self.new(name, type, db)
      db.execute(sql, name, type)
      #pokemon.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

      #db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE pokemon.id = ?
    SQL
    pokemon = db.execute(sql, id).first
    #self.new(pokemon[0], pokemon[1], pokemon[2])

    #pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end
end
