Spree::Admin::VariantsController.class_eval do
  
  def mass_create
    
    @product ||= Spree::Product.where(:permalink => params[:product_id]).first
    
    base_attrs = @product.master.attributes.except('id', 'created_at', 'deleted_at', 'sku', 'is_master', 'count_on_hand')
    
    options = params[:option_types]
    
    option_values = {}

    l = options.size
    ks = options.keys
    
    if l == 2
    
      options[ks[0]].each do |v0|
        option_values[ks[0]] = v0
        
        options[ks[1]].each do |v1|
          option_values[ks[1]] = v1
          
          v = Spree::Variant.new
          v.attributes = base_attrs
          option_values.each_value {|id| v.option_values << Spree::OptionValue.find(id)}
          v.save
          
        end
      end
    end

    if l == 3
    
      options[ks[0]].each do |v0|
        option_values[ks[0]] = v0
        
        options[ks[1]].each do |v1|
          option_values[ks[1]] = v1
          
          options[ks[2]].each do |v1|
            option_values[ks[2]] = v1
          
            v = Spree::Variant.new
            v.attributes = base_attrs
            option_values.each_value {|id| v.option_values << Spree::OptionValue.find(id)}
            v.save
            
          end
        end
      end
    end

  redirect_to collection_url

  end
  
end