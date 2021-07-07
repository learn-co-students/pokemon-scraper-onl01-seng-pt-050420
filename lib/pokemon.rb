require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db

    @@all = []

    def initialize(id: nil, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
        Pokemon.all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db_conn)
       db_conn.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db_conn)
        pokemon_row =  db_conn.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1", id).flatten
        pokemon_obj = self.new(id: id, name: pokemon_row[1], type: pokemon_row[2], db: db_conn)
    end
end