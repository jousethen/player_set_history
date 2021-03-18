require_relative "./player_set_history/version"
require_relative "./player_set_history/climanager"
require_relative "./player_set_history/importer"
require_relative "./player_set_history/player"
require_relative "./player_set_history/set"
require_relative "./player_set_history/tournament"

require 'pry'
require 'httparty'

module PlayerSetHistory
  class Error < StandardError; end
end
