class Company < ApplicationRecord
  has_rich_text :description

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/,
                  message: "must be a getmainstreet.com account", allow_blank: true }

  before_save :set_city_state, if: :will_save_change_to_zip_code?

  def location_info
    ZipCodes.identify(self.zip_code)
  end

  private

  def set_city_state
    location_hash = self.zip_code.present? ? self.location_info : {}
    self.city = location_hash&.[](:city)
    self.state = location_hash&.[](:state_name)
  end

end
