class Claim < ActiveRecord::Base
  extend Enumerize

  TIME_FORMAT = "%m/%d/%Y %H:%M %p"

  def self.time_format
    TIME_FORMAT
  end

  TRANSPORT_OPTIONS = [:car, :train, :plane]

  attr_accessible :surname, :name,
                  :email, :academic_status,
                  :post, :organization_title,
                  :working_address, :title_of_report,
                  :departure_time, :arrival_time,
                  :departure_transport, :arrival_transport,
                  :already_in_tomsk

  validates_presence_of :surname, :name, :email, :post, :academic_status

  normalize_attributes :surname, :name, :patronymic,
                       :email, :academic_degree, :academic_status,
                       :post, :organization_title

  validates :email, email: true

  enumerize :departure_transport, in: TRANSPORT_OPTIONS
  enumerize :arrival_transport,   in: TRANSPORT_OPTIONS



  def fullname
    [name, surname].compact.join(' ')
  end

  def already_in_tomsk?
    already_in_tomsk
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
