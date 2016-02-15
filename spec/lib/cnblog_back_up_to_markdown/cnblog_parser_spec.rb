require 'spec_helper'

RSpec.describe CnblogBackUpToMarkdown::CnblogParser do

  it 'convert xml to markdown' do
    FileUtils.rm_r("markdowns") if Dir.exist?("markdowns")
    parser = CnblogBackUpToMarkdown::CnblogParser.new
    parser.convert 'spec/xml/CNBlogs_BlogBackup_131_201311_201602.xml'
    expect(Dir.exist?("markdowns")).to be true
  end

end
