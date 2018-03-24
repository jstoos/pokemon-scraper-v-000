class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type, )
  end

  def self.find(id_number, db)
    #pokemon_array = []
    #binding.pry
    pokemon_array = (db.execute("SELECT * FROM pokemon WHERE id = #{id_number}"))[0]
    Pokemon.new(id: id_number, db: db, name: "#{pokemon_array[1]}", type: "#{pokemon_array[2]}")
  end

  def alter_hp(hp_update, db)
  #binding.pry
    self.hp = hp_update
    db.execute("UPDATE pokemon SET hp = #{hp_update} WHERE name = '#{self.name}'")
  end

end
