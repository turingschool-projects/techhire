class Company < ActiveRecord::Base
  has_many :users
  has_many :notes

  validates :name, :organization, :title, :state, :city, presence: true
  validates :status, inclusion: ["contacted", "uncontacted", "dead", "confirmed"]
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, }
                    validates :hire_count, numericality: { only_integer: true, }

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
    self.send(status.to_sym).count
  end

  def self.company_count_by_city
    self.order(:city)
        .pluck(:city)
        .group_by{ |city| city}
        .inject({}) {|hash, (k,v)| hash[k] = v.size; hash}
  end
end
