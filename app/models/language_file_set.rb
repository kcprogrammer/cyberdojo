
# > ruby test/functional/language_file_set_tests.rb

class LanguageFileSet
  
  def initialize(dir, language)
    @language = language
    @dir = dir + '/language/' + language
    @manifest = eval IO.read(@dir + '/manifest.rb')
  end
  
  def copy_hidden_files_to(folder)
    # Use ln here and not cp - no need to create multiple
    # copies of files that are not going to be edited.
    hidden_filenames.each do |hidden_filename|
      system("ln '#{@dir}/#{hidden_filename}' '#{folder}/#{hidden_filename}'")
    end
  end

  def visible_files
    @manifest[:visible_filenames].inject({}) do |result,filename|
      result.merge( { filename => IO.read("#{@dir}/#{filename}") } )
    end
  end
  
  def language
    @language
  end
  
  def tab_size
    @manifest[:tab_size] || 4
  end
  
  def unit_test_framework
    @manifest[:unit_test_framework]  
  end
  
private

  def hidden_filenames
    @manifest[:hidden_filenames] || [ ]
  end

end