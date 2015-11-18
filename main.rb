require "slack"
require "yaml"
require "httparty"

@_config = YAML.load_file("config.yml")
@org = @_config["org"]
Slack.configure do |config|
  config.token = @_config["token"]
end

api = Slack::API.new
@channels = {}
api.channels_list["channels"].each do |item|
  @channels[item["name"]] = item["id"]
end

def invite(email)

  options = { :body => {
    :email => email,
    :token => @_config["token"],
    :channels => @channels[@_config["channel"]],
    # :ultra_restricted => 1,
    :set_active => true
  }}

  response = HTTParty.post("https://#{@org}.slack.com/api/users.admin.invite", options)
  puts response.body, response.code

end

api.users_list({:limit=>1000})["members"].each do |item|
  invite(item["profile"]["email"])
end
