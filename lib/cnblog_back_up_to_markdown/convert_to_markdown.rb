require 'reverse_markdown'

module CnblogBackUpToMarkdown
  class ConvertMarkdown

    def initialize(articles)
      @articles = articles
    end

    # 转换为markdwon
    def markdown
      @articles.each { |a| a.description = ReverseMarkdown.convert(a.description) }
    end

    # 写入到markdwon文件
    def write_to_md
      markdown
      @articles.each do |article|
        template = <<-EOB
---
layout: post
title:  "#{article.title}"
date:   #{article.pub_date.strftime("%Y-%m-%d %H:%M:%S")}
author:     "#{article.author}"
header-img: "//static.haoxilu.net/post-bg.jpg"
tags:
    - 默认
---
        EOB
        template += article.description
        write_file("#{article.pub_date.strftime("%Y-%m-%d")}-#{article.title}.md",
                   template)
      end
    end

    private
      # 执行文件保存操作
      def write_file(filename,content)
        Dir.mkdir('markdowns') unless File.exist?('markdowns')
        filename = File.join('markdowns',filename)
        File.open(filename, 'w') do |f|
          f << content
        end
      end

  end
end
