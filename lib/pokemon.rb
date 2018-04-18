class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(hp=nil, id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = (?)", id)[0][0]
    type = db.execute("SELECT type FROM pokemon WHERE id = (?)", id)[0][0]
    return Pokemon.new(hp=60, id: id, name: name, type: type, db: db)
  end

end
