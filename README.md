# Slack import

Invite members from a Slack team to another

## Usage

Copy the sample config file and fill your [token](https://api.slack.com/web), team and channel you want the new users enter.

    cp config.sample.yml config.yml

Install the dependencies:

    bundle install

Invite the members:

    ruby main.rb
