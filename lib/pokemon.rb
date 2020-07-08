class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db 
    end 

    def self.save(name, type, db) 
       db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
      end

      def self.find(id, db)
        response = db.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten

        new_pokemon = Pokemon.new(id: id, name: response[1], type: response[2], db: db)
        new_pokemon
      end 


end
