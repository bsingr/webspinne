require "webspinne/version"
require "mechanize"

module Webspinne
  class DoubleVisitError < StandardError; end
  
  autoload :Visit, "webspinne/visit"
  autoload :Index, "webspinne/index"
  autoload :Site, "webspinne/site"
  autoload :Link, "webspinne/link"
  autoload :CSVReport, "webspinne/csv_report"

  def self.visit uri, max_follows
    Visit.new(uri).run max_follows
  end

  def self.csv_report index
    CSVReport.new(index)
  end
end
