require 'open-uri'
require 'Nokogiri'

i= 1100000
max = 60000000

File.open('/var/result.csv', 'w'){|f|

begin
        sleep(1)
        print ".#{i}"
        u = "https://www.apple.com/nl_edu_#{i}/shop/buy-mac/macbook-pro"
        i = i + 1
        doc = Nokogiri::HTML(open(u))
        #als we geen exceptie hebben:
        print "url: #{u} ;"
        xpathExpr = '//div[@id="product-selection-2"]//li[@class="price"]'
        doc.encoding = 'utf-8'
        res= doc.xpath(xpathExpr)[0].text.strip.split(" ")[1]
        print "#{res}\n"
        f.write("#{u};#{res}\n")
        rescue
        #do nothing

end while (i < max)
}
