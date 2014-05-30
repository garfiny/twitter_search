require 'ffaker'

module Services
  class UsernameGenerator
    def generate
      APP_CONFIG['usernames_gen_limits'].times.map do
        Faker::Name.first_name
      end
    end
  end
end
