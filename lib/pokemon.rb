class Pokemon

attr_accessor :id, :name, :type, :db
    
def initialize(id:, name:, type:, db:)
@id=id
@name=name
 @type=type
@db=db
end
    
def self.save(name, type, db)
 db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
@id = db.execute("SELECT last_insert_rowid() FROM pokemon") [0][0]
end
    

    
def self.find(id, db)
sql = <<-SQL
SELECT * 
FROM pokemon 
WHERE id = ?
SQL
db.execute(sql, id).map do |item|
 Pokemon.new(id: item[0], name: item[1], type: item[2], db: db)
end.first
    end
    
end