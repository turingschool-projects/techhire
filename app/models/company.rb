class Company < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  validates :name, :organization, :title, :state, :city, :zip_code, presence: true
  validates :status, inclusion: ["contacted", "uncontacted", "dead", "confirmed"]
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, },
                    uniqueness: true
  validates :hire_count, numericality: { only_integer: true, }

  after_create :send_welcome_email

  scope :contacted, -> { where status: "contacted"}
  scope :uncontacted, -> { where status: "uncontacted"}
  scope :confirmed, -> { where status: "confirmed"}
  scope :dead, -> { where status: "dead"}

  STATUS_OPTIONS = { "Uncontacted" => "uncontacted",
                     "Contacted" => "contacted",
                     "Confirmed" => "confirmed",
                     "Dead" => "dead"
                   }

  def self.company_count_by_status(status)
    send(status.to_sym).count
  end

  def self.company_count_by_city
    group(:city).count.sort_by { |_key, value| value }.pop(10).reverse
  end

  private

  def send_welcome_email
    SignupEmailWorker.perform_async(self.id)
  end

  def self.known_states
    [["Alaska", "AK"], ["Alabama", "AL"], ["Arkansas", "AR"], ["American Samoa", "AS"], ["Arizona", "AZ"],
     ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["District of Columbia", "DC"],
     ["Delaware", "DE"], ["Florida", "FL"], ["Georgia", "GA"], ["Guam", "GU"], ["Hawaii", "HI"], ["Iowa", "IA"],
     ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Kansas", "KS"], ["Kentucky", "KY"],
     ["Louisiana", "LA"], ["Massachusetts", "MA"], ["Maryland", "MD"], ["Maine", "ME"], ["Michigan", "MI"],
     ["Minnesota", "MN"], ["Missouri", "MO"], ["Mississippi", "MS"], ["Montana", "MT"], ["North Carolina", "NC"],
     ["North Dakota", "ND"], ["Nebraska", "NE"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"],
     ["Nevada", "NV"], ["New York", "NY"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], ["Pennsylvania", "PA"],
     ["Puerto Rico", "PR"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"],
     ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Virginia", "VA"], ["Virgin Islands", "VI"],
     ["Vermont", "VT"], ["Washington", "WA"], ["Wisconsin", "WI"], ["West Virginia", "WV"], ["Wyoming", "WY"]]
  end
end
