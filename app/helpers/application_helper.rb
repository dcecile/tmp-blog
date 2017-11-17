module ApplicationHelper
  def tb_link_button(text, path, octicon_name, extra_class: nil, **options)
    link_to(path, class: ["tb-button", extra_class], **options) do
      concat(octicon(octicon_name))
      concat(" ")
      concat(text)
    end
  end

  def tb_submit_button(form, text, octicon_name, extra_class: nil)
    form.button(class: ["tb-button", extra_class], type: "submit") do
      concat(octicon(octicon_name))
      concat(" ")
      concat(text)
    end
  end

  def ago_in_words(time)
    "#{distance_of_time_in_words(time.utc, Time.now.utc)} ago"
  end
end
