RSpec::Matchers.define :violate_check_constraint do |constraint_name|			# Define matcher and state its name. Name argument passed to block.
	supports_block_expectations													# Custom matchers don't support block syntax. Must execute code_to_test in block to detect exception thrown.
	match do |code_to_test|														# Define what passing or failing means.
		begin
			code_to_test.()														# Run the code under test.
			false																# Flow of control leads here if no exception. We want to cause an exception. Therefore, getting here means our test failed.
		rescue ActiveRecord::StatementInvalid => ex 							# Catch the exception we're expecting.
			ex.message =~ /#{constraint_name}/									# Examine the message of the caught exception. Assert it contains the name of the constraint we're expecting to violate.
		end
	end
end