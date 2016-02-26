class Report < ActiveRecord::Base

  attr_accessible :title, :authors, :kind, :kind_ru, :kind_en, :section, :annotation

  attr_accessor :kind_en

  validates_presence_of :title, :authors, :kind, :section, :annotation

  normalize_attributes :title, :authors, :annotation

  belongs_to :claim

  before_validation :set_kind

  private

  def set_kind
    self.kind = self.kind_ru || self.kind_en
  end

end

# == Schema Information
#
# Table name: reports
#
#  id                      :integer          not null, primary key
#  title                   :text
#  authors                 :text
#  kind                    :string(255)
#  section                 :string(255)
#  annotation              :text
#  claim_id                :integer
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  attachment_url          :text
#
