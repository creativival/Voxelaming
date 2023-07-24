class Turtle
  include Math

  def initialize(build_box)
    @build_box = build_box
    @x = 0
    @y = 0
    @z = 0
    @polar_theta = 90
    @polar_phi = 0
    @drawable = true
    @color = [0, 0, 0, 1]
    @size = 1
  end

  def forward(length)
    z = @z + length * sin(radians(@polar_theta)) * cos(radians(@polar_phi))
    x = @x + length * sin(radians(@polar_theta)) * sin(radians(@polar_phi))
    y = @y + length * cos(radians(@polar_theta))
    x, y, z = x.round(3), y.round(3), z.round(3)

    if @drawable
      @build_box.draw_line(@x, @y, @z, x, y, z, *@color)
    end

    @x = x
    @y = y
    @z = z
  end

  def backward(length)
    forward(-length)
  end

  def up(degree)
    @polar_theta -= degree
  end

  def down(degree)
    @polar_theta += degree
  end

  def right(degree)
    @polar_phi -= degree
  end

  def left(degree)
    @polar_phi += degree
  end

  def set_color(r, g, b, alpha = 1)
    @color = [r, g, b, alpha]
  end

  def pen_down
    @drawable = true
  end

  def pen_up
    @drawable = false
  end

  def set_pos(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def reset
    @x = 0
    @y = 0
    @z = 0
    @polar_theta = 90
    @polar_phi = 0
    @drawable = true
    @color = [0, 0, 0, 1]
    @size = 1
  end

  private

  def radians(degrees)
    degrees * Math::PI / 180
  end
end
