class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  
  validates :name, :content, presence: true

  def tag_ids=(ids)
    ids.delete("")
    ids.each do |id|
      self.tags << Tag.find_by_id(id)
    end
  end

end
