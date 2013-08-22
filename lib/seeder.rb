require 'erb'
class Seeder
  def self.load_fixtures(fixtures_file, options={})
    fixtures = YAML.load(ERB.new(File.read(fixtures_file)).result)
    fixture_type = File.basename(fixtures_file).gsub(/.yml$/,'')
    fixture_class = fixture_type.classify.constantize
    fixture_class.class
    puts "Destroying all #{fixture_type}..."
    fixture_class.delete_all
    fixtures.each_pair do |label, attributes|
      if label =~ /(\d+)$/
        attributes['id'] ||= $1
      end
      fixture = fixture_class.new(attributes)
      fixture.id = attributes['id']
      fixture.save!
    end
    puts "Created #{fixture_class.count} #{fixture_class} objects"
    if ActiveRecord::Base.connection.respond_to? :reset_pk_sequence!
      ActiveRecord::Base.connection.try(:reset_pk_sequence!, fixture_class.table_name)
    end
  rescue StandardError => e
    puts e
    puts "Skipping #{fixture_type}"
  end
end