class Address < ApplicationRecord
  include ApplicationHelper

  belongs_to :household

  validates :to, :line_1, :city, :state, :zip, :country, :category, presence: true

  FIFTY_US_STATES = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].freeze
  COUNTRY_CODES = %w[AFG ALB DZA ASM AND AGO AIA ATG ARG ARM ABW AUS AUT AZE BHS BHR BGD BRB BEL BLZ BEN BMU BTN BOL BIH BWA BVD BRA IOT BRN BGR BFA BDI KHM CMR CAN CPV CYM CAF TCD CHL CHN CXR CCK COL COM COK CRI HRV CUW CYP CZE DNK DJI DMA DOM ECU EGY SLV GNQ ERI EST ETH FLK FRO FJI FIN FRA GUF PYF ATF GAB GMB GEO DEU GHA GIB GRC GRL GRD GLP GUM GTM GGY GIN GNB GUY HTI HMD VAT HND HKG HUN ISL IND IDN IRL IMN ISR ITA JAM JPN JEY JOR KAZ KEN KIR KOR KSV KWT KGZ LAO LVA LSO LBR LIE LTU LUX MAC MKD MDG MWI MYS MDV MLI MLT MHL MTQ MRT MUS MYT MEX FSM MDA MCO MNG MNE MSR MAR MOZ MMR NAM NRU NPL NLD ANT NCL NZL NIC NER NGA NIU NFK MNP NOR OMN PAK PLW PSE PAN PNG PRY PER PHL PCN POL PRT QAT REU ROM RUS RWA BLM SHN KNA LCA MAF SPM VCT WSM SMR STP SAU SEN SRB SYC SLE SGP SVK SVN SLB ZAF SGS ESP LKA SDN SUR SJM SWZ SWE CHE TWN TJK TZA THA TLS TGO TKL TON TTO TUN TUR TKM TCA TUV UGA UKR ARE GBR USA UMI URY UZB VUT VEN VNM VGB VIR WLF ESH ZMB ZWE ALA CUB LBN ESP].freeze
  CATEGORIES = %w[primary temporary].freeze

  validates :state, inclusion: { in: FIFTY_US_STATES }, if: -> { country == 'USA' }
  # custom validator for zip code?
  validates :country, inclusion: { in: COUNTRY_CODES }
  validates :category, inclusion: { in: CATEGORIES }

  acts_as_paranoid

  def display_info
    verified_string = verified_at.present? ? "verified at #{format_date(verified_at)}" : "not verified"
    "#{category.upcase} #{verified_string}: #{to}, #{line_1}, #{city}, #{state}, #{zip}"
  end
end
