require 'erb'

module GoogleFonts
  def google_fonts(fonts)
    if fonts.is_a?(String)
      str = fonts
    else
      str = fonts.join("&family=")
    end
    ERB.new("<link href='https://fonts.googleapis.com/css2?family=#{str}&display=swap' rel='stylesheet'>").result
  end
end
