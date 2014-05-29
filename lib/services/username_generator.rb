require 'ffaker'

module Services
  class UsernameGenerator
    def generate
      APP_CONFIG['usernames_gen_limits'].times.map do
        Faker::Name.name
      end
    end
  end
end
