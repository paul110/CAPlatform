class Purchaser
  attr_accessor :sketch_id, :user, :new_sketch

  def initialize sketch_id, user_id
    @sketch_id = sketch_id
    @user = User.find user_id
    @sketch = Sketch.new new_sketch_attributes.merge(default_params)
  end

  def purchase
    update_boards_for_new_user
    sketch.save!
    sketch
  end

  private

  def new_sketch_attributes
    Sketch
      .for_marketplace
      .find(sketch_id)
      .attributes
      .with_indifferent_access
      .slice(:boards, :links, :name, :description)
  end

  def default_params
    {
      status: "closed",
      user: user
    }
  end

end
