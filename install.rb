##
## Copy over asset files (javascript/css/images) from the plugin directory to public/
##

require 'fileutils'

RAILS_ROOT="/Users/cpytel/projects/thunderthimble"

def copy_files(source_path, destination_path, directory)
  source, destination = File.join(directory, source_path), File.join(RAILS_ROOT, destination_path)
  FileUtils.mkdir_p(destination, :verbose => true) unless File.exist?(destination)
  FileUtils.cp_r(source, destination, :verbose => true)
end

directory = File.dirname(__FILE__)

p directory

copy_files("/public/stylesheets", "/public/flutie", directory)
