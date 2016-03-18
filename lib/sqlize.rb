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
  
  class NotImplementedError < StandardError; end

  class CapitalizeWords
    attr_reader :keywords
    attr_accessor :filepath, :orig, :capitalized
    def initialize(filepath)
      @filepath= filepath
      @orig = File.read @filepath
    end

    def capitalize
      regex = Regexp.new /\b#{Regexp.union @keywords.map{|w|Regexp.new(w, Regexp::IGNORECASE)}}\b/
      @capitalized = @orig.gsub regex, &:upcase
    end
  end

  class Postgresql < CapitalizeWords
    def initialize(filepath)
      super filepath
      @keywords = POSTGRESQL_KEYWORDS
    end
  end
end

