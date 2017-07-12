class PropublicService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://projects.propublica.org')
  end

  def house_members(info)
    parse(connection.get('house_members', info))[:results]
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
