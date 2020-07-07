class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize (id:, name:, type:, hp: nil, db:)
    @name = name 
    @type = type 
    @db = db 
    @id = id
  end
  def self.save(name, type, db)
    sql = <<-SQL 
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  def self.find(id_num, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ?
    LIMIT 1
    SQL
    new_poke = db.execute(sql, id_num).flatten
    Pokemon.new(id: new_poke[0], name: new_poke[1], type: new_poke[2], hp: new_poke[3], db: db)
  end

end
