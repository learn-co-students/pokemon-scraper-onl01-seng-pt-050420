require 'pry'
class Pokemon
attr_accessor :name, :type, :id, :db

def initialize(name:name, type:type, db:db, id:id=nil)
    @name=name
    @type=type
    @id=id
    @db=db
end



def self.save(name, type, db)
    # if self.new.id
    #   self.update
    # else
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    # end
  end

  def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL
        db.execute(sql, id).map do |row|
            
            self.new(name:row[1], type:row[2], db:db, id:row[0])
        end.first
    end

    # def new_from_db(row) 
    #     new_pokemon = Pokemon.new(row[1], row[2],@db, row[0])
    #     new_pokemon
    # end

end
