class Wine < ActiveRecord::Base
  validates_presence_of :name, :shortdesc, :longdesc, :grapetype, :forvegeterians, :origin, :bottlesize, :price, :supplier

  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :photo,
                                      content_type: /\Aimage\/.*\Z/

  def self.search(search)
    if search
        self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
  
  private
    #ensure no line items are referencing this wine product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line items present')
      return false
      end
     end

  self.per_page = 2
end
