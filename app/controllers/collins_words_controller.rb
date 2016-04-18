class CollinsWordsController < ApplicationController
  def index
    word = params[:word]
    @list = Zhmultiword.where :word => word
    @map = {}
    @word = word
    @star = nil
    @list.each do |one|
      example = {}
      doc = Nokogiri::XML(one.example)
      doc.xpath('//pair').each do |pair|
        en = pair.xpath('//en')[0].text
        zh = pair.xpath('//zh')[0].text
        example[en] = zh
      end
      @map[one]= example
      @star = one.frequency
    end
  end
  def cndefs
    word = params[:word]
    
    @list = Zhmultiword.where :word => word
    @map = {}
    @word = word
    @star = nil
    cns = []
    @list.each do |one|
      example = {}
      doc = Nokogiri::XML(one.example)
      doc.xpath('//pair').each do |pair|
        en = pair.xpath('//en')[0].text
        zh = pair.xpath('//zh')[0].text
        example[en] = zh
      end
      @map[one]= example
      @star = one.frequency
      onecn = one.num.to_s + ". " + one.cn + " " + one.sentence
      cns.push onecn
    end
    str = @word + "    " +@star.to_s + "    \r\n"
    str += cns.join "\r\n"
    render :text => str

  end
end
