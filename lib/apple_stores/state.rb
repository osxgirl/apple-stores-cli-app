class AppleStores::State
    attr_accessor :name, :city, :phone
    
    def self.all
        self.scrape_states
    end

    def self.scrape_states
        states = []
        states << self.scrape_apple
        states << self.scrape_appletoday

        states
    end

    def self.scrape_apple
        doc = Nokogiri::HTML(open("https://www.apple.com/retail/thefashionmallatkeystone/"))

        states = self.new
        states.name = doc.search("h1.typography-section-headline").text
        states.city = doc.at("span.store-locality.typography-body").text
        states.phone = doc.at("span.store-phone.typography-body").text

        states
    end

    def self.scrape_appletoday
        doc = Nokogiri::HTML(open("https://www.apple.com/everyone-can-code/"))

        states = self.new
        states.name = doc.search("h1.typography-product-elevated").text
        states.city = doc.search("p.typography-intro").text
        states.phone = doc.at("span.ac-gf-breadcrumbs-home-icon").text

        states
    end

end

