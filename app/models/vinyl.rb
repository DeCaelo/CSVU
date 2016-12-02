class Vinyl < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Vinyl.create! row.to_hash
    end
  end
end
