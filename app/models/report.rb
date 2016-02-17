class Report < ActiveRecord::Base

  attr_accessible :title, :authors, :kind, :kind_ru, :kind_en, :section, :annotation, :attachment

  attr_accessor :kind_ru, :kind_en

  validates_presence_of :title, :authors, :kind, :section, :annotation, :attachment

  normalize_attributes :title, :authors, :annotation

  belongs_to :claim

  extend Enumerize

  enumerize :kind, :in => [:message, :report, :lecture, :poster, :invited_lector, :oral]
  enumerize :kind_ru, :in => [:message, :report, :lecture, :poster]
  enumerize :kind_en, :in => [:invited_lector, :oral, :poster]

  enumerize :section, :in => [:photonic_crystal_structure, :nonlinear_optical_material, :nanoheterostructure, :semi_conducting_microstructure,
                              :nanometer_system_measuring, :photonic_quantum_system_facility, :nano_biophoton]

  has_attached_file :attachment, :storage => :elvfs, :elvfs_url => Settings['storage.url']
  validates_attachment :attachment, content_type: { content_type: [
    'application/rtf', 'application/x-rtf', 'text/rtf', 'application/msword'
  ] }

  before_post_process :rename_attachment

  before_validation :set_kind

  def file_url
    attachment_url
  end

  private

  def set_kind
    self.kind = self.kind_ru || self.kind_en
  end

  def rename_attachment
    filename = File.basename(attachment_file_name, '.*').try(&:mb_chars).try(&:downcase).to_s.parameterize('_').truncate(100, :omission => '')
    extension = File.extname(attachment_file_name).downcase
    self.attachment.instance_write(:file_name, "#{filename}#{extension}")
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
