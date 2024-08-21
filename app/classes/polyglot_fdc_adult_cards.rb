module PolyglotFdcAdultCards
  # PDF SIZE : 597 x 408
  # x_pos and y_pos are percentages of the width and height of the page bounds
  # width and height are percentages of the width and height of the page bounds
  # other dimensions are in points

  CONFIG = [
    {
      V0C0L0: {x_pos: 10, y_pos: 85, size: 24},
      V1C0L0: {x_pos: 10, y_pos: 75, size: 24},
      V1C0L3: {x_pos: 0, y_pos: 60, size: 30, width: 100, align: :center},
      V1C0L15: {x_pos: 15, y_pos: 45, size: 21, style: :bold},
      V1C0L1: {x_pos: 10, y_pos: 5},
      V1C0L2: {x_pos: 10, y_pos: 5}
    },
    {
      V1C0L5: {x_pos: 10, y_pos: 89, size: 30},
      # V1C0L6: {x_pos: 10, y_pos: 78, size: 15, width: 80, overflow: :shrink_to_fit},
      # V1C0L7: {x_pos: 10, y_pos: 72, size: 15, width: 80, overflow: :shrink_to_fit},
      # V1C0L8: {x_pos: 10, y_pos: 60, size: 15, width: 80, overflow: :shrink_to_fit},
      # V1C0L9: {x_pos: 10, y_pos: 53, size: 15, width: 80, overflow: :shrink_to_fit},
      V1C0L6: {x_pos: 10, y_pos: 78, size: 15, width: 80, height: 40, overflow: :shrink_to_fit},
      V1C0L10: {x_pos: 73, y_pos: 36, size: 15, width: 18, height: 14, overflow: :shrink_to_fit, rotate: 346,
                valign: :center},
      V1C0L11: {x_pos: 9, y_pos: 18, size: 12, width: 15, height: 10, overflow: :shrink_to_fit, color: "FF0000",
                align: :center},
      V1C0L12: {x_pos: 24, y_pos: 18, size: 12, width: 15, height: 10, overflow: :shrink_to_fit, color: "FF0000",
                align: :center},
      V1C0L13: {x_pos: 39, y_pos: 18, size: 12, width: 15, height: 10, overflow: :shrink_to_fit, color: "FF0000",
                align: :center},
      V1C0L14: {x_pos: 54, y_pos: 18, size: 12, width: 15, height: 10, overflow: :shrink_to_fit, color: "FF0000",
                align: :center}
    },

    {
      V1C1L1: {x_pos: 5, y_pos: 98, size: 60, width: 90, height: 20, overflow: :shrink_to_fit, style: :bold,
               color: "FFFFFF", align: :center, valign: :center}
    },
    {
      V1C1L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C5L1: {x_pos: 5, y_pos: 98, size: 60, width: 90, height: 20, overflow: :shrink_to_fit, style: :bold,
               color: "FFFFFF", align: :center, valign: :center},
      V1C5L11: {x_pos: 0, y_pos: 10},
      V1C5L12: {x_pos: 0, y_pos: 10},
      V1C5L13: {x_pos: 0, y_pos: 10}
    },
    {
      V1C5L14: {x_pos: 0, y_pos: 10},
      V1C5L15: {x_pos: 0, y_pos: 10},
      V1C5L2: {x_pos: 0, y_pos: 10},
      V1C5L3: {x_pos: 0, y_pos: 10},
      V1C5L4: {x_pos: 0, y_pos: 10},
      V1C5L5: {x_pos: 0, y_pos: 10},
      V1C5L6: {x_pos: 0, y_pos: 10},
      V1C5L7: {x_pos: 0, y_pos: 10}
    },

    {
      V1C7L1: {x_pos: 0, y_pos: 10},
      V1C7L2: {x_pos: 0, y_pos: 10}
    },
    {
      V1C7L3: {x_pos: 0, y_pos: 10},
      V1C7L4: {x_pos: 0, y_pos: 10},
      V1C7L5: {x_pos: 0, y_pos: 10}
    },

    {
      V1C13L1: {x_pos: 0, y_pos: 10},
      V1C13L2: {x_pos: 0, y_pos: 10},
      V1C13L3: {x_pos: 0, y_pos: 10},
      V1C13L4: {x_pos: 0, y_pos: 10}
    },
    {
      V1C13L5: {x_pos: 0, y_pos: 10},
      V1C13L6: {x_pos: 0, y_pos: 10},
      V1C13L7: {x_pos: 0, y_pos: 10},
      V1C13L8: {x_pos: 0, y_pos: 10}
    },

    {
      V1C21L1: {x_pos: 0, y_pos: 10},
      V1C21L2: {x_pos: 0, y_pos: 10},
      V1C21L3: {x_pos: 0, y_pos: 10},
      V1C21L4: {x_pos: 0, y_pos: 10}
    },
    {
      V1C21L5: {x_pos: 0, y_pos: 10},
      V1C21L6: {x_pos: 0, y_pos: 10},
      V1C21L7: {x_pos: 0, y_pos: 10},
      V1C21L8: {x_pos: 0, y_pos: 10},
      V1C21L9: {x_pos: 0, y_pos: 10}
    },

    {
      V1C18L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C18L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C22L1: {x_pos: 0, y_pos: 10},
      V1C22L2: {x_pos: 0, y_pos: 10},
      V1C22L3: {x_pos: 0, y_pos: 10},
      V1C22L4: {x_pos: 0, y_pos: 10}
    },
    {
      V1C22L5: {x_pos: 0, y_pos: 10},
      V1C22L6: {x_pos: 0, y_pos: 10},
      V1C22L7: {x_pos: 0, y_pos: 10}
    },

    {
      V1C2L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C2L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C3L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C3L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C4L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C4L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C6L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C6L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C8L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C8L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C9L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C9L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C11L1: {x_pos: 0, y_pos: 50},
      V1C11L2: {x_pos: 0, y_pos: 50},
      V1C11L3: {x_pos: 0, y_pos: 10}
    },
    {
      V1C11L4: {x_pos: 0, y_pos: 10},
      V1C11L5: {x_pos: 0, y_pos: 10},
      V1C11L6: {x_pos: 0, y_pos: 10}
    },

    {
      V1C12L1: {x_pos: 0, y_pos: 10},
      V1C12L2: {x_pos: 0, y_pos: 10},
      V1C12L3: {x_pos: 0, y_pos: 10},
      V1C12L4: {x_pos: 0, y_pos: 10}
    },
    {
      V1C12L5: {x_pos: 0, y_pos: 10},
      V1C12L6: {x_pos: 0, y_pos: 10},
      V1C12L7: {x_pos: 0, y_pos: 10},
      V1C12L8: {x_pos: 0, y_pos: 10},
      V1C12L9: {x_pos: 0, y_pos: 10}
    },

    {
      V1C24L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C24L2: {x_pos: 0, y_pos: 10},
      V1C24L3: {x_pos: 0, y_pos: 10}
    },

    {
      V1C10L1: {x_pos: 0, y_pos: 50}
    },
    {
      V1C10L2: {x_pos: 0, y_pos: 50}
    },

    {
      V1C14L1: {x_pos: 0, y_pos: 10},
      V1C14L10: {x_pos: 0, y_pos: 10},
      V1C14L11: {x_pos: 0, y_pos: 10},
      V1C14L2: {x_pos: 0, y_pos: 10},
      V1C14L3: {x_pos: 0, y_pos: 10}
    },
    {
      V1C14L4: {x_pos: 0, y_pos: 10},
      V1C14L5: {x_pos: 0, y_pos: 10},
      V1C14L6: {x_pos: 0, y_pos: 10},
      V1C14L7: {x_pos: 0, y_pos: 10},
      V1C14L8: {x_pos: 0, y_pos: 10},
      V1C14L9: {x_pos: 0, y_pos: 10}
    },

    {
      V1C15L1: {x_pos: 0, y_pos: 10},
      V1C15L10: {x_pos: 0, y_pos: 10},
      V1C15L11: {x_pos: 0, y_pos: 10},
      V1C15L12: {x_pos: 0, y_pos: 10},
      V1C15L13: {x_pos: 0, y_pos: 10},
      V1C15L14: {x_pos: 0, y_pos: 10},
      V1C15L15: {x_pos: 0, y_pos: 10},
      V1C15L16: {x_pos: 0, y_pos: 10},
      V1C15L17: {x_pos: 0, y_pos: 10}
    },
    {
      V1C15L18: {x_pos: 0, y_pos: 10},
      V1C15L2: {x_pos: 0, y_pos: 10},
      V1C15L20: {x_pos: 0, y_pos: 10},
      V1C15L21: {x_pos: 0, y_pos: 10},
      V1C15L22: {x_pos: 0, y_pos: 10},
      V1C15L23: {x_pos: 0, y_pos: 10},
      V1C15L3: {x_pos: 0, y_pos: 10},
      V1C15L30: {x_pos: 0, y_pos: 10},
      V1C15L31: {x_pos: 0, y_pos: 10},
      V1C15L4: {x_pos: 0, y_pos: 10},
      V1C15L5: {x_pos: 0, y_pos: 10}
    },

    {
      V1C16L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C16L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C17L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C17L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C19L1: {x_pos: 0, y_pos: 10},
      V1C19L2: {x_pos: 0, y_pos: 10}
    },
    {
      V1C19L3: {x_pos: 0, y_pos: 10},
      V1C19L4: {x_pos: 0, y_pos: 10}
    },

    {
      V1C20L1: {x_pos: 0, y_pos: 10},
      V1C20L2: {x_pos: 0, y_pos: 10},
      V1C20L3: {x_pos: 0, y_pos: 10}
    },
    {
      V1C20L4: {x_pos: 0, y_pos: 10},
      V1C20L5: {x_pos: 0, y_pos: 10},
      V1C20L6: {x_pos: 0, y_pos: 10},
      V1C20L7: {x_pos: 0, y_pos: 10},
      V1C20L8: {x_pos: 0, y_pos: 10}
    },

    {
      V1C23L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C23L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C25L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C25L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C26L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C26L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C27L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C27L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C34L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C34L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C29L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C29L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C30L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C30L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C33L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C33L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C28L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C28L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C31L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C31L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C32L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C32L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C35L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C35L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C36L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C36L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C37L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C37L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C38L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C38L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C39L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C39L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C40L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C40L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C41L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C41L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C42L1: {x_pos: 0, y_pos: 10}
    },
    {
      V1C42L2: {x_pos: 0, y_pos: 10}
    },

    {
      V1C999L2: {x_pos: 0, y_pos: 10},
      V1C999L3: {x_pos: 0, y_pos: 10},
      V1C999L4: {x_pos: 0, y_pos: 10},
      V1C999L5: {x_pos: 0, y_pos: 10},
      V1C999L6: {x_pos: 0, y_pos: 10},
      V1C999L7: {x_pos: 0, y_pos: 10},
      V1C999L8: {x_pos: 0, y_pos: 10},
      V1C999L9: {x_pos: 0, y_pos: 10},
      V1C999L90: {x_pos: 0, y_pos: 10},
      V1C999L91: {x_pos: 0, y_pos: 10},
      V1C999L92: {x_pos: 0, y_pos: 10}
    },
    {
      V1C999L93: {x_pos: 0, y_pos: 10},
      V1C999L94: {x_pos: 0, y_pos: 10},
      V1C999L95: {x_pos: 0, y_pos: 10},
      V1C999L96: {x_pos: 0, y_pos: 10},
      V1C999L97: {x_pos: 0, y_pos: 10},
      V1C999L98: {x_pos: 0, y_pos: 10},
      V1C999L99: {x_pos: 0, y_pos: 10},
      V1C99L1: {x_pos: 0, y_pos: 10},
      V1C99L9: {x_pos: 0, y_pos: 10}
    }
  ].freeze
end
