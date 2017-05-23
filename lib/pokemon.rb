require "pry"
class Pokemon
  attr_accessor :name, :type, :db, :id
  @@all = []

  def initialize(hash)
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @id = hash[:id]
  end

  def self.all
    @@all
  end

  def self.save (name, type, db)
    #binding.pry
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
    end
  #end

  def self.find (id, db)
    #the information posted from the DB will be in the form of a hash. Convert it into an array
    #Connect to DB and find the data for the Pokemon that has the id that matches the id passed in the arguement,
    #give me the first array of results
    poke_array = db.execute("SELECT * FROM Pokemon WHERE id = ?", id)[0]
    #alternative poke_array = db.execute("SELECT * FROM Pokemon WHERE id = ?, id").flatten
    #flatten will combine all the values in the nested arrays into a single array
    #binding.pry
    Pokemon.new(new_poke_hash = {id: poke_array[0], name: poke_array[1], type: poke_array[2]})
  end


end
