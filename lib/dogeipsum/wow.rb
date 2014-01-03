module DogeIpsum
  class Wow
    include DogeIpsum::WordGenerator
    
    OPTIONS = [:lines, :paragraphs, :words]

    def self.generate(opts = {})
      new opts
    end

    def self.method_missing(name, *args)
      if name.to_s.index('many_') == 0
        generate(name.to_s.split('many_').last.to_sym => args.first)
      else
        super
      end
    end

    def to_s
      @lorem
    end

    private 

    def initialize(opts)
      @lorem = ""

      if opts.empty?
        @lorem = get_paragraph
      else
        opts.keys.sort do |a, b|
          -(a <=> b)
        end
        .map do |key|
          if OPTIONS.include?(key)
            add_to_lorem = opts[key].times.inject("") {|sum, time| [sum, get(key)].reject(&:empty?).join(' ')}
            @lorem = [@lorem, add_to_lorem].join(' ')
          end 
        end
      end
    end

    def get_paragraph
      4.times.inject("") do |sum, time| 
        [sum, get_line.capitalize].reject(&:empty?).join(' ')
      end
    end

    def get_line
      4.times.inject("") do |sum, time|
        sum = [sum, get_word].reject(&:empty?).join(', ')
      end
      .concat "!"
    end

    def get_word
      [doge_modifiers[rand(doge_modifiers.count)], doge_nouns[rand(doge_nouns.count)]].join(' ')
    end
    
    def get(key)
      self.send("get_"+key.to_s.chop)
    end
  end
end