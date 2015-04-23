class Pdf < ActiveRecord::Base
  def self.learn_more
    # Route.where(:a => true,:b => true,:c => [1,2]).all
    # Route.where("a = true and b = true and ((c > 0 and c < 1) or d = 1)").all? { |e|  }
    where("page = 'tools and resources' and slot = 1").first
  end
end
