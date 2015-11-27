class Wine < ActiveRecord::Base
  validates_presence_of :name, :shortdesc, :longdesc, :grapetype, :forvegeterians, :origin, :bottlesize, :price, :supplier

  belongs_to :user
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :photo,
                                      content_type: /\Aimage\/.*\Z/
end
