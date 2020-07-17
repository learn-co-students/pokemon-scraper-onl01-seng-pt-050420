class Pokemon
    # Responsible for saving, adding, removing, 
    # or changing anything about each Pokémon.

    attr_accessor :id, :name, :type, :db 

    def initialize(id: nil, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db
    end 

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon_var = db.execute(
        "SELECT * FROM pokemon 
        WHERE id = ?", id).flatten

        new_pokemon = Pokemon.new(id: id, name: pokemon_var[1], type: pokemon_var[2], db: db)

        new_pokemon
    end 
end
