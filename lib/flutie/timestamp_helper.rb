module TimestampHelper
  def timestamp(time, options = {})
    options = options.dup
    tag = options.delete(:tag) { :time }
    options[:title] = options[:title] == false ? nil : l(time)
    options[:datetime] = time.to_s
    content_tag(tag, "#{time_ago_in_words(time).capitalize} ago", options)
  end
end
