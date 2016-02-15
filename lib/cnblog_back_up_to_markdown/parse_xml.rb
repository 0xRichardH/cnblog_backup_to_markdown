module CnblogBackUpToMarkdown
  class ParseXml
    # 定义一个Struct用来存储文章数据
    Article = Struct.new(:title, :author, :pub_date, :description)

    def initialize(xml_path)
      @xml_path = xml_path
    end

    # 将xml解析为Article Struct
    def parse
      @articles = []
      doc = File.open(@xml_path) { |f| Nokogiri::XML(f) }
      items = doc.xpath('//item')
      items.each do |xml|
        @articles << Article.new( get_xml_text(xml, 'title'),
                                  get_xml_text(xml, 'author'),
                                  DateTime.parse(get_xml_text(xml, 'pubDate')),
                                  get_xml_text(xml, 'description')
                                )
      end
      @articles
    end

    private

      # 获取节点内容
      def get_xml_text(xml,node)
        tage = xml.at_css("#{node}")
        tage.text unless tage.nil?
      end

  end
end
