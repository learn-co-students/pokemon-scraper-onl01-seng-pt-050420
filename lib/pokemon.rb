class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(pokemon)
        @id = pokemon[:id]
        @name = pokemon[:name]
        @type = pokemon[:type]
        @db = pokemon[:db]  
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL
        db.execute(sql, [name, type])
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?;"
        results = db.execute(sql, id)
        pokemon = {
            :id => id,
            :name => results[0][1],
            :type => results[0][2],
            :db => db
        }
        Pokemon.new(pokemon)
    end
end
