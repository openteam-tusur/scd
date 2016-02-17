class Claim < ActiveRecord::Base

  attr_accessible :surname, :name, :patronymic, :email, :birthdate, :gender,
    :contact_phone, :work_phone, :academic_degree, :academic_degree_ru, :academic_degree_en,
    :academic_status, :academic_status_en, :academic_status_ru, :post, :organization_title,
    :organization_abbr, :postcode, :country, :locality, :term_accept, :reports_attributes

  attr_accessor :academic_degree_ru, :academic_degree_en,
    :academic_status_ru, :academic_status_en, :term_accept

  validates_presence_of :surname, :name, :patronymic,
    :email, :birthdate, :gender, :contact_phone, :work_phone,
    :post, :organization_title, :organization_abbr,
    :postcode, :country, :locality,
    :academic_degree, :academic_status

  normalize_attributes :surname, :name, :patronymic,
    :email, :birthdate, :gender, :contact_phone, :work_phone,
    :academic_degree, :academic_status, :post, :organization_title, :organization_abbr,
    :postcode, :country, :locality

  validates :email, :email => true

  before_validation :set_academic_degree
  before_validation :set_academic_status

  extend Enumerize

  enumerize :gender, :in => [:male, :female]
  enumerize :academic_degree, :in => [:none, :kfmn, :ktn, :khn, :dfmn, :dtn, :dhn, :ph_d, :professor]
  enumerize :academic_degree_ru, :in => [:none, :kfmn, :ktn, :khn, :dfmn, :dtn, :dhn]
  enumerize :academic_degree_en, :in => [:none, :ph_d, :professor]

  enumerize :academic_status, :in => [:none, :sns, :docent, :professor, :doctor, :academician]
  enumerize :academic_status_ru, :in => [:none, :sns, :docent, :professor]
  enumerize :academic_status_en, :in => [:none, :doctor, :professor, :academician]

  has_many :reports, :dependent => :destroy
  validates :reports, :presence => true

  accepts_nested_attributes_for :reports, allow_destroy: true

  def self.priority_countries
    return [ 'BY', 'CN', 'RU', 'US', 'FI', 'FR', 'JP', ] if I18n.locale == :ru
    return [ 'BY', 'CN', 'FI', 'FR', 'JP', 'RU', 'US', ] if I18n.locale == :en
  end

  def self.per_page
    10
  end

  searchable do
    time :created_at
  end

  def fullname
    [surname, name, patronymic].compact.join(' ')
  end

  private

  def set_academic_degree
    self.academic_degree = self.academic_degree_ru || self.academic_degree_en
  end

  def set_academic_status
    self.academic_status = self.academic_status_ru || self.academic_status_en
  end
end

# == Schema Information
#
# Table name: claims
#
#  id                 :integer          not null, primary key
#  surname            :string(255)
#  name               :string(255)
#  patronymic         :string(255)
#  email              :string(255)
#  birthdate          :date
#  gender             :string(255)
#  contact_phone      :string(255)
#  work_phone         :string(255)
#  academic_degree    :string(255)
#  academic_status    :string(255)
#  post               :string(255)
#  organization_title :text
#  organization_abbr  :string(255)
#  postcode           :string(255)
#  country            :string(255)
#  region             :string(255)
#  district           :string(255)
#  locality           :string(255)
#  street             :string(255)
#  house              :string(255)
#  building           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
