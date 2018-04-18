class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(hp=60, id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    puts "This is the hp: #{hp}"
  end

  def self.save(hp=nil, name, type, db)
    if hp == nil
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    else
      db.execute("INSERT INTO pokemon (hp, name, type) VALUES (?, ?, ?)", hp, name, type)
    end
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = (?)", id)[0][0]
    type = db.execute("SELECT type FROM pokemon WHERE id = (?)", id)[0][0]
    return Pokemon.new(60, id: id, name: name, type: type, db: db)
  end

end
