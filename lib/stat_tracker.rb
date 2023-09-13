require 'csv'

class StatTracker
  attr_reader :games,
              :teams,
              :game_teams

  def initialize
    @games = []
    @teams = []
    @game_teams = []
  end

  def self.from_csv(locations)
    stat_tracker = StatTracker.new
    
    CSV.foreach((locations[:games]), headers: true, col_sep: ",") do |game|
      stat_tracker.games << game.to_h
    end

    CSV.foreach((locations[:teams]), headers: true, col_sep: ",") do |team|
      stat_tracker.teams << team.to_h
    end

    CSV.foreach((locations[:game_teams]), headers: true, col_sep: ",") do |game_team|
      stat_tracker.game_teams << game_team.to_h
    end
    stat_tracker
  end

  # ITERATION 2 METHODS

  def highest_total_score
    highest_game = games.max_by do |game|
      game['away_goals'].to_i + game['home_goals'].to_i
    end
    highest_game['away_goals'].to_i + highest_game['home_goals'].to_i
  end

  def lowest_total_score
    lowest_game = games.min_by do |game|
      game['away_goals'].to_i + game['home_goals'].to_i
    end
    lowest_game['away_goals'].to_i + lowest_game['home_goals'].to_i
  end

  def percentage_home_wins
    wins = games.count do |game|
      game['home_goals'].to_i > game['away_goals'].to_i
    end
    (wins.to_f / games.length).round(2)
  end

  def percentage_visitor_wins
    wins = games.count do |game|
      game['home_goals'].to_i < game['away_goals'].to_i
    end
    (wins.to_f / games.length).round(2)
  end

  # HELPER METHODS



end