class AddRelationTypeTitle < ActiveRecord::Migration
  def up
    RelationType.destroy_all
    cites = RelationType.where(name: 'cites').first_or_create(
      title: 'Cites', inverse_title: 'Is cited by')
    is_supplement_to = RelationType.where(name: 'Is_supplement_to').first_or_create(
      title: 'Is supplement to', inverse_title: 'Is supplemented by')
    continues = RelationType.where(name: 'continues').first_or_create(
      title: 'Continues', inverse_title: 'Is continued by')
    is_metadata_for = RelationType.where(name: 'is_metadata_for').first_or_create(
      title: 'Is metadata for', inverse_title: 'Has metadata')
    is_new_version_of = RelationType.where(name: 'is_new_version_of').first_or_create(
      title: 'Is new version of', inverse_title: 'Is previous version of')
    is_part_of = RelationType.where(name: 'is_part_of').first_or_create(
      title: 'Is part of', inverse_title: 'Has part')
    references = RelationType.where(name: 'references').first_or_create(
      title: 'References', inverse_title: 'Is referenced by')
    documents = RelationType.where(name: 'documents').first_or_create(
      title: 'Documents', inverse_title: 'Is documented by')
    compiles = RelationType.where(name: 'compiles').first_or_create(
      title: 'Compiles', inverse_title: 'Is compiled by')
    is_variant_form_of = RelationType.where(name: 'is_variant_form_of').first_or_create(
      title: 'Is variant form of', inverse_title: 'Is original form of')
    is_identical_to = RelationType.where(name: 'is_identical_to').first_or_create(
      title: 'Is identical to', inverse_title: 'Is identical to')
    reviews = RelationType.where(name: 'reviews').first_or_create(
      title: 'Reviews', inverse_title: 'Is reviewed by')
    is_derived_from = RelationType.where(name: 'is_derived_from').first_or_create(
      title: 'Is derived from', inverse_title: 'Is source of')
    corrects = RelationType.where(name: 'corrects').first_or_create(
      title: 'Corrects', inverse_title: 'Is corrected by')
    discusses = RelationType.where(name: 'discusses').first_or_create(
      title: 'Discusses', inverse_title: 'Is discussed by')
    bookmarks = RelationType.where(name: 'bookmarks').first_or_create(
      title: 'Bookmarks', inverse_title: 'Is bookmarked by')
    recommends = RelationType.where(name: 'recommends').first_or_create(
      title: 'Recommends', inverse_title: 'Is recommended by')

    computer_program = WorkType.where(name: 'computer_program').first_or_create(
      title: 'Computer Program')
  end

  def down

  end
end