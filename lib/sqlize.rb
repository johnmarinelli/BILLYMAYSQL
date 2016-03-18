require "sqlize/version"

module BillyMays
  # have you ever just wanted to shout SELECTed words?

  SQL_KEYWORDS = %w(
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

  POSTGRESQL_KEYWORDS = SQL_KEYWORDS | %w(
  )
  
  class CapitalizeWords
    attr_reader :keywords
    attr_accessor :orig, :capitalized
    def initialize(orig)
      @orig = orig
    end

    def capitalize
      regex = Regexp.new /\b#{Regexp.union @keywords.map{|w|Regexp.new(w, Regexp::IGNORECASE)}}\b/
      @capitalized = @orig.gsub regex, &:upcase
    end
  end

  class SQL < CapitalizeWords
    def initialize(orig)
      super orig
      @keywords = SQL_KEYWORDS
    end
  end

  class Postgresql < CapitalizeWords
    def initialize(orig)
      super orig
      @keywords = POSTGRESQL_KEYWORDS
    end
  end
end

