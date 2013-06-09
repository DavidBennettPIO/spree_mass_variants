Spree::Core::Engine.routes.draw do

  match '/admin/products/:product_id/variants/mass_create(.:format)' => 'admin/variants#mass_create', :method => :post

end
