require 'sqlite3'
require 'singleton'

class PlaywrightDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('playwrights.db')

  end
end

class Playwrights

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.all
    data = PlaywrightDBConnection.instance.execute('SELECT * FROM playwrights')
    data.map {|datum| Playwrights.new(datum) }
  end

  def self.find_by_name(name)
    data = PlaywrightDBConnection.instance.execute('SELECT * FROM playwrights WHERE name = name')
    data.map {|datum| Playwrights.new(datum)}
  end

  def create
    raise "#{self} already in database" if @id
    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
      SQL
    @id = PlaywrightDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless @id
    data = PlayDBConnection.instance.execute( <<-SQL, @title, @year, @playwright_id, @id)
      SELECT plays.title
      FROM plays
      WHERE playwright_id = @playwright_id

    SQL
  end
end
