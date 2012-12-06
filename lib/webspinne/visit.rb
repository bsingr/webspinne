module Webspinne
  class Visit
    attr_reader :site, :agent, :index

    def initialize(uri)
      @site = Site.new(uri)
    end

    def run max_follows
      @agent = Mechanize.new
      @index = Index.new

      puts "visiting #{site.uri} - following max. #{max_follows} links"

      plan_visit site.uri
      max_follows.times do
        if link = index.next_unvisited_onsite_link
          if exec_visit(link)
            print '.'
          else
            print 'f'
          end
        else
          # no more unvisited onsite links
          break
        end
      end

      puts

      self
    end

    def exec_visit link
      link.visited!
      page = agent.get(link.uri)
      
      # e.g. images have no links
      if page.respond_to? :links
        page.links.each do |link|
          if link.uri.to_s != ''
            plan_visit link.uri.to_s
          end
        end
        true
      else
        false
      end
    rescue => e
      puts e.class
      false
    end

    def plan_visit uri
      index << Link.new(uri, site.onsite?(uri))
    end
  end
end
