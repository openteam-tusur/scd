class Claim < ActiveRecord::Base

  attr_accessible :surname, :name,
                  :email, :academic_status,
                  :post, :organization_title, 
                  :working_address, :title_of_report

  validates_presence_of :surname, :name, :email, :post, :academic_status

  normalize_attributes :surname, :name, :patronymic,
    :email, :academic_degree, :academic_status, :post, :organization_title

  validates :email, :email => true


  extend Enumerize
  enumerize :academic_degree, :in => [:none, :kfmn, :ktn, :khn, :dfmn, :dtn, :dhn, :ph_d, :professor]
  enumerize :academic_status, :in => [:none, :sns, :docent, :professor, :doctor, :academician]

  has_many :reports, :dependent => :destroy

  searchable do
    time :created_at
  end

  def fullname
    [name, surname].compact.join(' ')
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
