require 'spec_helper'

RSpec.describe :Self do
  let(:xml_content) { File.read( File.expand_path 'spec/xml/CNBlogs_BlogBackup_131_201311_201602.xml' ) }

  it "convert to markdown" do
    articles = CnblogBackUpToMarkdown::convert(xml_content)
    expect(articles.size).to eq 37
  end

  it "convert xml to struct" do
     articles = CnblogBackUpToMarkdown::xml2structs(xml_content)
     expect(articles.size).to eq 37
     expect(articles.first.title).not_to be nil
  end

end
