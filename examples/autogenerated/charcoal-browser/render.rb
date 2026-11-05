# Render the repository's actual ERB views without loading telephony providers.
require 'erb'
require 'fileutils'

class CharcoalViewFixture
  def initialize(root, populated)
    @root = root
    fixture = Struct.new(:name, :text_id, :voice_id, :description, :author_url, :author)
    @apps = populated ? [fixture.new('Fixture app', 'fixture', nil, 'Representative app metadata', nil, 'Fixture author')] : []
  end

  def erb(name)
    ERB.new(File.read(File.join(@root, 'views', "#{name}.erb"), encoding: 'UTF-8')).result(binding)
  end
end

root, output = ARGV
raise 'expected source and output directories' unless root && output
FileUtils.mkdir_p(output)
renderer = CharcoalViewFixture.new(root, false)
%w[index apps documentation about signup].each do |view|
  destination = view == 'index' ? File.join(output, 'index.html') : File.join(output, view, 'index.html')
  FileUtils.mkdir_p(File.dirname(destination))
  File.write(destination, renderer.erb(view), encoding: 'UTF-8')
end
destination = File.join(output, 'apps-populated', 'index.html')
FileUtils.mkdir_p(File.dirname(destination))
File.write(destination, CharcoalViewFixture.new(root, true).erb('apps'), encoding: 'UTF-8')
