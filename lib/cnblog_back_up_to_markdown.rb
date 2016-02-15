require 'nokogiri'
require 'cnblog_back_up_to_markdown/version'
require 'cnblog_back_up_to_markdown/parse_xml'
require 'cnblog_back_up_to_markdown/convert_to_markdown'
require 'cnblog_back_up_to_markdown/cnblog_parser'

module CnblogBackUpToMarkdown

  def self.convert(xml_content)
    ConvertMarkdown.new(ParseXml.new(xml_content).parse).markdown
  end

  def self.xml2structs(xml_content)
    ParseXml.new(xml_content).parse
  end

end
