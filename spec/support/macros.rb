def drop_schemas
  connection = ActiveRecord::Base.connection.raw_connection
  schemas = connection.query(%Q{
  	SELECT 'drop schema ' || nspname || ' cascade;'
  	from pg_namespace
  	where nspname != 'public'
  	AND nspname NOT LIKE 'pg_%'
  	AND nspname != 'information_schema'
  })
  schemas.each do |query|
  	connection.query(query.values.first)
  end
end

def sign_up(subdomain)
  visit root_path(subdomain: false)
  click_link 'Create Account'

  fill_in 'Name', with: 'Ryan'
  fill_in 'Email', with: 'ryan@email.com' 
  fill_in 'Password', with: 'pw'
  fill_in 'Password confirmation', with: 'pw' 
  fill_in 'Subdomain', with: subdomain
  click_button 'Create Account'
end

def sign_user_in(user, opts={})
  visit new_user_session_url(subdomain: opts[:subdomain])
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'Sign in'
end