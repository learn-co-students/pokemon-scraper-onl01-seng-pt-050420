require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db

    @@all = []

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        Pokemon.all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db_conn)
        sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL

        db_conn.execute(sql, name, type)
    end

    def self.find(id, db_conn)
        pokemon_row =  db_conn.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1", id).flatten

        name = pokemon_row[1]
        type = pokemon_row[2]

        pokemon_obj = self.new(id: id, name: name, type: type, db: db_conn)
    end
end