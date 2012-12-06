module Webspinne
  class Index
    include Enumerable

    def initialize
      @list = {}
    end

    def each &block
      @list.each do |uri, link|
        block.call link
      end
    end

    # defensive set
    def << link
      @list[link.uri] ||= link
    end

    def size
      @list.size
    end

    def next_unvisited_onsite_link
      find { |link| !link.visited? && link.onsite? }
    end

    def visited_size
      find_all { |link| link.visited? }.size
    end

    def unvisited_size
      size - visited_size
    end

    def onsite_size
      find_all { |link| link.onsite? }.size
    end

    def offsite_size
      size - onsite_size
    end
  end
end
