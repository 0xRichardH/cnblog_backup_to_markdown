require 'spec_helper'

RSpec.describe CnblogBackUpToMarkdown::ConvertMarkdown do

  let(:articles){
    Article = Struct.new(:title, :author, :pub_date, :description)
    posts = []
    posts <<  Article.new( 'Hello,world', 'Richard Hao', Time.now,
                          "<a href='https://haoxilu.net'>description</a>" )
    posts
  }

  let(:article){ articles.first }

  let(:convert_markdown){ CnblogBackUpToMarkdown::ConvertMarkdown.new(articles) }

  it "convert to markdown" do
    markdown = convert_markdown.markdown.first
    expect(markdown).not_to be nil
    expect(markdown.title).to eq article.title
    expect(markdown.author).to eq article.author
    expect(markdown.pub_date).to eq article.pub_date
    expect(markdown.description == '[description](https://haoxilu.net)').to be false
  end

  it "save markdown to file" do
    FileUtils.rm_r("markdowns") if Dir.exist?("markdowns")
    convert_markdown.write_to_md
    file_name = "markdowns/#{article.pub_date.strftime("%Y-%m-%d")}-#{article.title}.md"
    expect(File.exist?(file_name)).to be true
  end

end
