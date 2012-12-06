require 'csv'

module Webspinne
  class CSVReport < Struct.new(:index)
    def to_file path
      CSV.open(path, "wb") do |csv|
        csv << ['uri', 'onsite', 'visited']
        index.each do |link|
          csv << [link.uri, link.onsite?, link.visited?]
        end
      end
    end
  end
end
