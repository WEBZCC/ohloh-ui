module BootstrapHelper
  def bootstrap_icon(name, text = nil)
    "<i class='#{name}'>#{text == '' ? '' : '&nbsp;'}</i>#{text || ''}"
  end

  def bootstrap_mini_button_link_to(text, path, opts = {})
    opts[:class] = "btn btn-mini #{opts[:class] || ''}"
    link_to(text, path, opts)
  end
end
