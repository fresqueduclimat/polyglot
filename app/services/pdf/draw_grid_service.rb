class Pdf::DrawGridService
  def initialize(pdf:, bounds:)
    @pdf = pdf
    @bounds = bounds
  end

  def call
    step_percentage = 10
    width, height = @bounds
    (0..100).step(step_percentage).each do |percent|
      x = (percent * width).fdiv(100)
      @pdf.stroke_color("E8E8E8")
      @pdf.stroke_line([x, 0], [x, height])

      y = (percent * height).fdiv(100)
      @pdf.stroke_line([0, y], [width, y])
    end
  end
end
