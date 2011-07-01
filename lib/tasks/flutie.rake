require 'fileutils'

def copy_files(source_path, destination_path, directory)
  source, destination = File.join(directory, source_path), File.join(Rails.root, destination_path)
  FileUtils.mkdir_p(destination, :verbose => true) unless File.exist?(destination)
  FileUtils.cp_r(source, destination, :verbose => true)
end

directory = File.dirname(__FILE__)

namespace :flutie do
  desc 'install flutie stylesheets into public/ directory'
  task :install => :environment do
    # Copy the flutie stylesheets into rails_root/public/stylesheets/sass
    copy_files("../../app/assets/stylesheets", "/public", directory)
  end
end
