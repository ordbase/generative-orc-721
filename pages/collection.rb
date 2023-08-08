


def generate_collection( slug:, name:,
                                offset: 0 )

   rec = Factory.find( slug )

   puts "==> #{rec.id} >#{rec.name}< max. #{rec.max} - #{rec.dim} - inscribe no. #{rec.inscribe.num} - #{rec.inscribe.date}"
    
   puts "   #{rec.layers.count} layer(s):"
   
   generator = rec.generator
   puts "      #{generator.count} tile(s)"

   
   puts "  #{rec.generatives.count} generative(s)" 
   generatives = rec.generatives.joins(:inscribe)
                    .order('num').limit( rec.max )  ## cut-off "cursed" overflow "negatives" if any


  buf = <<TXT
## #{rec.name} (#{rec.id}) max. #{rec.max}

TXT

  generatives.each_with_index do |gen,i|

    num = gen.inscribe.num
    id  = gen.inscribe.id

    tooltip = "#{name} ##{i+offset} - № #{num}" 

    buf << %Q[<a href="https://ordinals.com/inscription/#{id}" title="#{tooltip}">]
    buf << %Q[<img src="https://ordbase.github.io/num/#{num}.png" alt="#{tooltip}"></a>]
    buf << "\n"  
  end

buf += <<TXT

---
  
Page Generated with [Ordlite - Ordinal Inscription (SQL) Database - Scripts](https://github.com/ordbase/ordbase/tree/master/ordlite).  
TXT
  

  buf
end

