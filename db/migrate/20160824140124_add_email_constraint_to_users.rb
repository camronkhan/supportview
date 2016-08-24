class AddEmailConstraintToUsers < ActiveRecord::Migration[5.0]
  # Add check constraint on users to require '@motorolasolutions' email address
  # Note: '~*' is how Postgres does regex matching
  def up
  	execute %{
  		ALTER TABLE users
  		ADD CONSTRAINT email_must_be_company_email
  		CHECK (email ~* '^[^@]+@motorolasolutions\\.com')
  	}
  end
  def down
  	execute %{
  		ALTER TABLE users
  		DROP CONSTRAINT email_must_be_company_email
  	}
  end
end
