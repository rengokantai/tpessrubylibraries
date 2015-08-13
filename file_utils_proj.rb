require 'fileutils'
#11.FileUtils
class FileUtilsProj
  current_directory = Dir.pwd
  project_name = "test"
  root ="#{current_directory}/tmp/#{project_name}"

  FileUtils.rm_rf root
  FileUtils.mkdir_p root

  FileUtils.cd root do |dir|
    %w(one two/sub three/sub).each do |directory|
      FileUtils.mkdir_p directory
    end

    %w(two/file.txt three/text.txt).each do |file|
      FileUtils.touch file
    end
    FileUtils.chmod 0755, "#{root}/one"

    %w(Gemfile).each do |file|
      FileUtils.copy "#{current_directory}/fileutils/#{file}", "."
    end
  end
end