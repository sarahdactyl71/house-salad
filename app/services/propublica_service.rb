class PropublicaService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://api.propublica.org/congress/v1/members/house/CO/current.json')
  end
  # List of members: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json
  # Specific member: GET https://api.propublica.org/congress/v1/members/{member-id}.json
  # current members by state: GET https://api.propublica.org/congress/v1/members/{chamber}/{state}/{district}/current.json

  def house_members(info)
    parse(connection.get('house_members', info))[:results]
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
