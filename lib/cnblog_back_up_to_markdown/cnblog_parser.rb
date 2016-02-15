require 'thor'

module CnblogBackUpToMarkdown
  class CnblogParser < Thor

    desc "convert  XML_NAME", "输入一个博客园备份文件的名称"
    def convert(xml_name)
      File.open(File.expand_path xml_name) do |f|
        parse = ParseXml.new(f)
        ConvertMarkdown.new(parse.parse).write_to_md
      end
    end

  end
end
