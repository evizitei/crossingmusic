require 'test_helper'

class SongTest < Test::Unit::TestCase
  should_have_attached_file :recording
  should_have_many :song_votes
end