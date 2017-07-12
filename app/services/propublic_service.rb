class PropublicService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://projects.propublica.org')
  end

  def house_members(info)
    binding.pry
  end
end
