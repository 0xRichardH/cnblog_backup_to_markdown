require 'thor'

module CnblogBackUpToMarkdown
  class CnblogParser < Thor

    desc "convert  XML_NAME", "输入一个博客园备份文件的名称"
    def convert(xml_name)
      parse = ParseXml.new(xml_name)
      ConvertMarkdown.new(parse.parse).write_to_md
    end

  end
end
