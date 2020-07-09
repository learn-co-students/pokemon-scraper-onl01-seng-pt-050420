class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id=nil, name=nil, type=nil, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name,type) VALUES (?, ?)
    SQL
    db.execute(sql, [name, type])
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL
    pokemon = db.execute(sql, id).flatten
    new_id = pokemon[0]
    name = pokemon[1]
    type = pokemon[2]
    new_pokemon = self.new(new_id, name, type, db)
    new_pokemon
  end
end