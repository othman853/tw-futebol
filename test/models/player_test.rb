require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  should validate_presence_of (:name)
  should validate_presence_of (:email)
  should_not allow_value('invalid_email').for(:email)
  should allow_value('player@twfutebol.com').for(:email)
  should validate_uniqueness_of (:email)

end
