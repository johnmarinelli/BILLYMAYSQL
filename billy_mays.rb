module BillyMays
  class NotImplementedError < StandardError; end

  class CapitalizeWords
    def capitalize; raise NotImplementedError; end
  end

  # BILLY MAYS HERE BRINGING YOU STRUCTURED QUERY LANGUAGE!!!!
  class Postgresql < CapitalizeWords

    attr_accessor :filepath, :orig, :capitalized
    
    def initialize(filepath)
      @filepath= filepath
      @orig = File.read @filepath
    end

    def capitalize
      @capitalized = orig.gsub(/\b#{Regexp.union(POSTGRESQL_KEYWORDS)}\b/, &:upcase)
    end

  private

    POSTGRESQL_KEYWORDS = %w(
      select
      from
      update
      alter
      set
      where
      limit
      group by
      as
    )
  end
end

print BillyMays::Postgresql.new(ARGV[0]).capitalize.to_s
