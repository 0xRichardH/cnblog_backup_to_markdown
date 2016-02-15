require 'spec_helper'

RSpec.describe CnblogBackUpToMarkdown::ParseXml do
  let(:xml_content) { File.read( File.expand_path 'spec/xml/CNBlogs_BlogBackup_131_201311_201602.xml' ) }
  
  it "parse xml to Article Struct" do
    p = CnblogBackUpToMarkdown::ParseXml.new(xml_content)
    expect(p.parse.size).to eq 37
    expect(p.parse.first.title).not_to be nil
  end

  it "parse error xml to Article Struce" do
    p = CnblogBackUpToMarkdown::ParseXml.new("<hello></hello>")
    expect(p.parse.size).to eq 0
  end

end
