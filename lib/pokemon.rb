class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  def initialize(id = nil, name, type, db)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type, db) 
        VALUES (?, ?, ?)
      SQL
      pokemon = self.new(name, type, db)
      db[:conn].execute(sql, name, type, db)
      pokemon.id = db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  # def self.find_by_name(id)
  #   sql = <<-SQL
  #     SELECT * FROM pokemon
  #     WHERE pokemon.id = ?
  #   SQL
  #   pokemon = DB[:conn].execute(sql, id).first
  #   self.new(pokemon[0], pokemon[1], pokemon[2])
  # end
end
