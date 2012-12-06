module Webspinne
  class Site < Struct.new(:uri)
    def onsite? test_uri
      hostname == hostname(test_uri) || hostname(test_uri) == nil
    end

    def offsite? test_uri
      !onsite?(test_uri)
    end

    def hostname test_uri=uri
      URI(test_uri).hostname
    end
  end
end