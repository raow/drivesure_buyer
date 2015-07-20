class CustomerFormBuilder < ActionView::Helpers::FormBuilder
  def datepicker_field(attribute, options={})
  	@template.content_tag :div, class: "input-append date date-picker1" do
  		text_field(attribute, class: 'm-wrap m-ctrl-medium date-picker', readonly: 'readonly')
  		#  (@template.content_tag :span, class: 'add-on' do
  		# 	@template.tag(:span, class: 'icon-calendar')
  		# end)
  	end
  end
end