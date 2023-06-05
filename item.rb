require 'time'
class Item
  attr_writer :genre, :author, :source, :label
  attr_accessor :published_date, :archived

  def initialize(published_date, archived)
    @id = rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    current_date = Time.now
    published_date = Time.parse(@published_date)
    ten_years_ago = Time.new(current_date.year - 10, current_date.month, current_date.day)
    published_date < ten_years_ago
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
