require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "non-company email should raise PG check constraint" do
		users(:camron).update_attribute(:email, "foo@bar.com")
	end
end
