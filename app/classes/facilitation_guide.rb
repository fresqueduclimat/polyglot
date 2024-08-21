module FacilitationGuide
  # PDF SIZE : 396 x 595
  CONFIG = [
    {
      P01L01: {x_pos: 58, y_pos: 89, width: 38, height: 3, size: 16, align: :right, color: "ffffff"},
      P01L02: {x_pos: 58, y_pos: 86, width: 38, height: 3, size: 16, align: :right, color: "ffffff"},
      P01L03: {x_pos: 0, y_pos: 65, width: 100, height: 5, size: 30, style: :bold, align: :center, valign: :center,
               overflow: :shrink_to_fit, color: "00c6c1"},
      P01L04: {x_pos: 0, y_pos: 45, width: 100, height: 30, size: 20, style: :bold, align: :center, color: "00c6c1"}
    },
    {
      P02L01: {x_pos: 9, y_pos: 84, width: 80, height: 11, size: 12, overflow: :shrink_to_fit, align: :center,
               valign: :center, color: "575756"},
      P02L02: {x_pos: 9, y_pos: 62, width: 80, height: 47, size: 12, overflow: :shrink_to_fit, align: :justify,
               valign: :center, color: "575756"}
    },
    {
      P03L01: {x_pos: 5, y_pos: 90, size: 16, style: :bold, color: "FF0000"}
    },
    {
      P04L01: {x_pos: 5, y_pos: 10},
      P04L02: {x_pos: 5, y_pos: 20},
      P04L03: {x_pos: 5, y_pos: 30},
      P04L04: {x_pos: 5, y_pos: 40},
      P04L05: {x_pos: 5, y_pos: 40},
      P04L06: {x_pos: 5, y_pos: 50}
    },
    {
      P05L01: {x_pos: 5, y_pos: 10},
      P05L02: {x_pos: 5, y_pos: 20},
      P05L03: {x_pos: 5, y_pos: 30},
      P05L04: {x_pos: 5, y_pos: 40},
      P05L05: {x_pos: 5, y_pos: 50}
    }
  ].freeze
end
