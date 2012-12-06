module Webspinne
  class Link
    attr_reader :uri, :onsite

    def initialize uri, onsite=false
      @uri = uri
      @onsite = onsite
      @visited = false
    end

    def visited!
      if visited?
        raise DoubleVisitError, uri
      else
        @visited = true
      end
    end

    def visited?
      @visited == true
    end

    def onsite?
      onsite == true
    end

    def offsite?
      !onsite?
    end
  end
end
