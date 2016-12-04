class Vinyl < ApplicationRecord
  #export CSV
  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |vinyl|
        csv << vinyl.attributes.values_at(*fields)
      end
    end
  end
  #import CSV
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      vinyl_hash = row.to_hash
      vinyl = find_or_create_by!(catalog: vinyl_hash['catalog'], artist: vinyl_hash['artist'], title: vinyl_hash['title'], label: vinyl_hash['label'], format: vinyl_hash['format'], rating: vinyl_hash['rating'], released: vinyl_hash['released'], release_id: vinyl_hash['release_id'], notes: vinyl_hash['notes'], date: vinyl_hash['date'])
      vinyl.update_attributes(vinyl_path)
    end
  end
end
