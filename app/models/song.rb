class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  validates :release_year, numericality: { only_integer: true }, if: :released
  validates :artist_name, presence: true
  validates :genre, presence: true
  validate :in_future, on: :create
  validate :more_than_twice, on: [:create, :update]



  def in_future
    t=Time.new
    if (released)
      if release_year != nil
        errors.add(:release_year, "is in the furture.") if release_year > t.year
      end
    end
  end

  def more_than_twice
    new = Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
    errors.add(:title, "is already released!" )if new != nil
  end

end
