if ENV["IMPORT"] == "dataone"
  # DataONE member nodes
  cloebird = Publisher.where(name: 'cloebird').first_or_create(
    :title => 'Cornell Lab of Ornithology - eBird',
    :service => 'dataone',
    :symbol => 'CLOEBIRD',
    :member_id => '50001',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  dryad = Publisher.where(name: 'dryad').first_or_create(
    :title => 'Dryad Digital Repository',
    :service => 'dataone',
    :member_id => '50002',
    :symbol => 'DRYAD')
  edacgstore = Publisher.where(name: 'edacgstore').first_or_create(
    :title => 'Earth Data Analysis Center (EDAC)',
    :service => 'dataone',
    :member_id => '50003',
    :symbol => 'EDACGSTORE',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  edora = Publisher.where(name: 'edora').first_or_create(
    :title => 'Environmental Data for the Oak Ridge Area',
    :service => 'dataone',
    :member_id => '50004',
    :symbol => 'EDORA',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  esa = Publisher.where(name: 'esa').first_or_create(
    :title => 'ESA Data Registry',
    :service => 'dataone',
    :member_id => '50005',
    :symbol => 'ESA',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  lter_europe = Publisher.where(name: 'lter_europe').first_or_create(
    :title => 'Europe Long-Term Ecosystem Research Network (LTER Europe)',
    :service => 'dataone',
    :symbol => 'LTER_EUROPE',
    :member_id => '50006',
    :url => 'http://data.lter-europe.net/deims/dataset/%{id}')
  gleon = Publisher.where(name: 'gleon').first_or_create(
    :title => 'Global Lake Ecological Observatory Network (GLEON)',
    :service => 'dataone',
    :symbol => 'GLEON',
    :member_id => '50007',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  goa = Publisher.where(name: 'goa').first_or_create(
    :title => 'Gulf of Alaska Data Portal',
    :service => 'dataone',
    :member_id => '50008',
    :symbol => 'GOA')
  iarc = Publisher.where(name: 'iarc').first_or_create(
    :title => 'International Arctic Research Center (IARC) Data Archive',
    :service => 'dataone',
    :symbol => 'IARC',
    :member_id => '50009',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  knb = Publisher.where(name: 'knb').first_or_create(
    :title => 'Knowledge Network for Biocomplexity',
    :service => 'dataone',
    :member_id => '50010',
    :symbol => 'KNB',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  lter = Publisher.where(name: 'lter').first_or_create(
    :title => 'LTER Network Member Node',
    :service => 'dataone',
    :symbol => 'LTER',
    :member_id => '50011',
    :url => 'https://portal.lternet.edu/nis/mapbrowse?packageid=%{id}')
  cdl = Publisher.where(name: 'cdl').first_or_create(
    :title => 'Merritt Repository',
    :service => 'dataone',
    :member_id => '50012',
    :symbol => 'CDL')
  us_mpc = Publisher.where(name: 'us_mpc').first_or_create(
    :title => 'Minnesota Population Center (MPC)',
    :service => 'dataone',
    :symbol => 'US_MPC',
    :member_id => '50013',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  ioe = Publisher.where(name: 'ioe').first_or_create(
    :title => 'Montana IoE Data Repository',
    :service => 'dataone',
    :symbol => 'IOE',
    :member_id => '50014',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  nmepscor = Publisher.where(name: 'nmepscor').first_or_create(
    :title => 'NM EPSCoR',
    :service => 'dataone',
    :symbol => 'NMEPSCOR',
    :member_id => '50015',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  oneshare = Publisher.where(name: 'oneshare').first_or_create(
    :title => 'ONEShare Repository',
    :service => 'dataone',
    :symbol => 'ONEShare',
    :member_id => '50016')
  ornldaac = Publisher.where(name: 'ornldaac').first_or_create(
    :title => 'ORNL DAAC',
    :service => 'dataone',
    :symbol => 'ORNLDAAC',
    :member_id => '50017',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  pisco = Publisher.where(name: 'pisco').first_or_create(
    :title => 'PISCO MN',
    :service => 'dataone',
    :symbol => 'PISCO',
    :member_id => '50018')
  rgd = Publisher.where(name: 'rgd').first_or_create(
    :title => 'Regional and Global Biogeochemical Dynamics Data (RGD)',
    :service => 'dataone',
    :symbol => 'RGD',
    :member_id => '50019',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  sanparks = Publisher.where(name: 'sanparks').first_or_create(
    :title => 'SANParks Data Repository',
    :service => 'dataone',
    :symbol => 'SANPARKS',
    :member_id => '50020',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  sead = Publisher.where(name: 'sead').first_or_create(
    :title => 'SEAD Virtual Archive',
    :service => 'dataone',
    :symbol => 'SEAD',
    :member_id => '50021',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  tfri = Publisher.where(name: 'tfri').first_or_create(
    :title => 'Taiwan Forestry Research Institute',
    :service => 'dataone',
    :symbol => 'TFRI',
    :member_id => '50022',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  tern = Publisher.where(name: 'tern').first_or_create(
    :title => 'Terrestrial Ecosystem Research Network',
    :service => 'dataone',
    :symbol => 'TERN',
    :member_id => '50023')
  kubi = Publisher.where(name: 'kubi').first_or_create(
    :title => 'University of Kansas - Biodiversity Institute',
    :service => 'dataone',
    :symbol => 'KUBI',
    :member_id => '50024',
    :url => 'https://cn.dataone.org/cn/v1/resolve/%{id}')
  usanpn = Publisher.where(name: 'usanpn').first_or_create(
    :title => 'USA National Phenology Network',
    :service => 'dataone',
    :symbol => 'USANPN',
    :member_id => '50025')
  usgscsas = Publisher.where(name: 'usgscsas').first_or_create(
    :title => 'USGS Core Sciences Clearinghouse',
    :service => 'dataone',
    :symbol => 'USGSCSAS',
    :member_id => '50026')
  nkn = Publisher.where(name: 'nkn').first_or_create(
    :title => 'Northwest Knowledge Network',
    :service => 'dataone',
    :symbol => 'NKN',
    :member_id => '50027')
end
