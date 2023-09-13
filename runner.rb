require './lib/stat_tracker'

# update data to fixtures for faster testing
# fixture files will NOT pass spec_harness

game_path = './fixtures/games.csv'
team_path = './fixtures/teams.csv'
game_teams_path = './fixtures/game_teams.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

stat_tracker = StatTracker.from_csv(locations)

require 'pry'; binding.pry