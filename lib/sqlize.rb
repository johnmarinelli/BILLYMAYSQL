require "sqlize/version"
require 'json'
require 'pathname'

module BillyMays
  # have you ever just wanted to shout SELECTed words?
  
  def self.load_json(filename)
    kw_path = Pathname.new(File.dirname(__FILE__)).join '..', 'sqlize', 'keywords', filename
    JSON.parse(File.read kw_path)
  end

  SQL_KEYWORDS = self.load_json 'sql_keywords.json'

  POSTGRESQL_KEYWORDS = SQL_KEYWORDS | self.load_json('postgres_keywords.json')
  
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

