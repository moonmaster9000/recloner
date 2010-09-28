module Recloner
  def clone(&block)
    block ||= Proc.new {}
    
    property_names = properties.map(&:name) - protected_properties.map(&:name)
    attrs = property_names.inject({}){|hash, x| 
      val = send(x)
      val = val.to_a if val.class == CouchRest::Model::CastedArray
      hash[x] = val
      hash
    }
    self.class.new(attrs).tap(&block)
  end
end
