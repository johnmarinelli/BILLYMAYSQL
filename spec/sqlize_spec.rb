require 'spec_helper'

describe Sqlize do
  
  sqls = [
    {
      :orig => 'nothing should be done here',
      :processed => 'nothing should be done here'
    },
    {
      :orig => 'select something from somewhere limit 1;',
      :processed => 'SELECT something FROM somewhere LIMIT 1;'
    },
    {
      :orig => 'sElEcT something FrOm somewhere LiMiT 1;',
      :processed => 'SELECT something FROM somewhere LIMIT 1;'
    }
  ]

  sqls.each do |sql|
    context sql do
      it 'gives a capitalized sql statement yeehaw' do
        expect(BillyMays::SQL.new(sql[:orig]).capitalize).to eq(sql[:processed])
      end
    end
  end
end
