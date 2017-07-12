class PropublicaService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://api.propublica.org/congress/v1/')
  end

  def house_members(info)
    parse(connection.get('house_members', info))[:results]
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
