Deface::Override.new(:virtual_path => "spree/admin/variants/index",
                   :name => "mass_create_variants",
                   :insert_before => 'code[erb-silent]:contains("if @product.empty_option_values?")',
                   :text => "<%= render :partial => 'spree/admin/variants/mass_create' %>"
)
