namespace :companies do
  desc 'Set City and State attr_accessor values'
  task set_city_state: :environment do
    companies = Company.where.not(zip_code: nil).all
    success_count = 0
    companies.each do |company|
      location_hash = ZipCodes.identify(company.zip_code)
      next unless location_hash
      company.city = location_hash[:city]
      company.state = location_hash[:state_name]
      if company.save
        success_count += 1
      else
        puts "=======Update failed due to #{company.errors.full_messages}=========="
      end
    end
    puts "======Updated City/State attribute for #{success_count} Companies========="
  end
end