require 'erb'

module Fonts
  class GoogleFonts
    class << self

      def get_fonts(fonts)
        if fonts.is_a?(String)
          str = fontify(fonts)
        elsif fonts.is_a?(Array)
          str = fontify_array(fonts).join("&family=")
        elsif fonts.is_a?(Hash)
          str = fontify_hash(fonts)
        else
          raise ArgumentError, "Fonts::GoogleFonts.get_fonts/1 needs either a string, a list of strings, or a hash of hashes."
        end
      
        ERB.new("<link rel='preconnect' href='https://fonts.googleapis.com'/>\n" +
                "<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin />\n" +
                "<link href='https://fonts.googleapis.com/css2?family=#{str}&display=swap' rel='stylesheet' />").result
      end

      private

      def fontify(name)
        name.split.join("+")
      end

      def prepend(prefix, weight)
        prefix + "," + weight
      end

      def add_prefix(prefix, arr)
        arr.map { |e| prepend(prefix, e) }
      end

      def italic?(key)
        key == :italic
      end

      def make_weight_string(weights)
        weights.map do | k, v |
          prefix = italic?(k) ? "1" : "0"
          add_prefix(prefix, v)
        end.join(";")
      end

      def fontify_array(arr)
        arr.map { |element| fontify(element)}
      end

      def fontify_hash(hash)
        hash.map do |k, v|
          name = fontify(v[:name])
          weight_string = make_weight_string(v[:weights])
          name + ":ital,wght@" + weight_string
        end.join("&family=")
      end



    end
  end

  # def google_fonts(fonts = {})
  #   fonts.each do |
  #   str = fonts.join("&family=")
  #   ERB.new("<link href='https://fonts.googleapis.com/css2?family=#{str}&display=swap' rel='stylesheet'>").result
  # end
end
