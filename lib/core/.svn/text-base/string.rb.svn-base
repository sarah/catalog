module Core
	module String
    def truncate_words(n=10, padding_text = "...")
    	split(/\s+/)[0..(n - 1)].join(" ") + (size > n ? padding_text : "")
    end
    
    def underscore
      gsub(/\s+/, '_').downcase
      # gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      # gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-", "_").downcase
    end
  end
end