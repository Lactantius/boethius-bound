class SelectionsDecorator

  MODEL_NAME = ActiveModel::Name.new(self.class, nil, 'selections')

  def model_name
    # MODEL_NAME
    @model_name
  end

  def initialize(hash, model_name='selections')
    @object = hash.symbolize_keys
    @model_name = ActiveModel::Name.new(self.class, nil, model_name)
  end

  def method_missing(method, *args, &block)
    if @object.key? method
      @object[method]
    elsif @object.respond_to? method
      @object.send(method, *args, &block)
    end
  end

  def has_attribute? attr
    @object.key? attr
  end

end
