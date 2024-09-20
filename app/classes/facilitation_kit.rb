module FacilitationKit
  CONFIG = [
    {
  P01L01: { page: 1, x_pos: 20.208333333333332, y_pos: 96.29629629629629, width: 57.1875, height: 7.777777777777778, size: 28, color: "00c6c1", style: :bold, rotate: 0.0, align: :center, valign: :bottom },
  P01L02: { page: 1, x_pos: 18.125, y_pos: 85.55555555555556, width: 19.895833333333332, height: 4.814814814814815, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P01L03: { page: 1, x_pos: 11.979166666666666, y_pos: 79.25925925925927, width: 21.666666666666668, height: 5.0, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P01L04: { page: 1, x_pos: 14.479166666666666, y_pos: 72.5925925925926, width: 22.5, height: 4.814814814814815, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P01L05: { page: 1, x_pos: 38.333333333333336, y_pos: 82.22222222222223, width: 21.458333333333332, height: 4.814814814814815, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :center, valign: :bottom },
  P01L06: { page: 1, x_pos: 60.3125, y_pos: 82.22222222222223, width: 14.479166666666666, height: 8.333333333333334, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :center, valign: :bottom },
  P01L07: { page: 1, x_pos: 75.83333333333333, y_pos: 82.03703703703704, width: 19.479166666666668, height: 8.333333333333334, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :center, valign: :bottom },
  P01L08: { page: 1, x_pos: 2.0833333333333335, y_pos: 66.2962962962963, width: 84.27083333333333, height: 33.888888888888886, size: 12.100000381469727, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P01L09: { page: 1, x_pos: 87.8125, y_pos: 42.407407407407405, width: 9.791666666666666, height: 10.0, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P01L10: { page: 1, x_pos: 2.0833333333333335, y_pos: 32.407407407407405, width: 84.27083333333333, height: 27.962962962962962, size: 12, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P01L11: { page: 1, x_pos: 75.9375, y_pos: 41.2962962962963, width: 6.770833333333333, height: 6.296296296296297, size: 13.899999618530273, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P01L12: { page: 1, x_pos: 82.1875, y_pos: 98.14814814814815, width: 11.458333333333334, height: 7.037037037037037, size: 24, color: "007580", style: :bold, rotate: 0.0, align: :left, valign: :bottom }
},
{
  P02L01: { page: 2, x_pos: 20.208333333333332, y_pos: 96.11111111111111, width: 57.1875, height: 7.777777777777778, size: 28, color: "00c6c1", style: :bold, rotate: 0.0, align: :center, valign: :bottom },
  P02L02: { page: 2, x_pos: 6.041666666666667, y_pos: 81.2962962962963, width: 78.33333333333333, height: 11.666666666666666, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P02L03: { page: 2, x_pos: 6.041666666666667, y_pos: 67.5925925925926, width: 78.33333333333333, height: 11.296296296296296, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P02L04: { page: 2, x_pos: 6.770833333333333, y_pos: 54.629629629629626, width: 77.60416666666667, height: 18.14814814814815, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P02L05: { page: 2, x_pos: 6.770833333333333, y_pos: 33.888888888888886, width: 77.60416666666667, height: 18.88888888888889, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P02L06: { page: 2, x_pos: 6.770833333333333, y_pos: 11.851851851851848, width: 77.60416666666667, height: 7.037037037037037, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P02L07: { page: 2, x_pos: 90.20833333333333, y_pos: 77.5925925925926, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P02L08: { page: 2, x_pos: 90.20833333333333, y_pos: 64.62962962962962, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P02L09: { page: 2, x_pos: 90.20833333333333, y_pos: 51.2962962962963, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P02L10: { page: 2, x_pos: 90.20833333333333, y_pos: 30.0, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P02L11: { page: 2, x_pos: 90.20833333333333, y_pos: 11.666666666666671, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P02L12: { page: 2, x_pos: 82.1875, y_pos: 98.14814814814815, width: 11.458333333333334, height: 7.037037037037037, size: 24, color: "007580", style: :bold, rotate: 0.0, align: :left, valign: :bottom }
},
{
  P03L01: { page: 3, x_pos: 20.208333333333332, y_pos: 96.29629629629629, width: 57.1875, height: 7.777777777777778, size: 28, color: "00c6c1", style: :bold, rotate: 0.0, align: :center, valign: :bottom },
  P03L02: { page: 3, x_pos: 5.729166666666667, y_pos: 74.07407407407408, width: 70.625, height: 10.37037037037037, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P03L03: { page: 3, x_pos: 5.729166666666667, y_pos: 62.96296296296296, width: 70.625, height: 10.37037037037037, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P03L04: { page: 3, x_pos: 83.02083333333333, y_pos: 75.18518518518519, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P03L05: { page: 3, x_pos: 83.02083333333333, y_pos: 60.370370370370374, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom }
},
{
  P04L01: { page: 4, x_pos: 20.208333333333332, y_pos: 96.29629629629629, width: 57.1875, height: 7.777777777777778, size: 28, color: "00c6c1", style: :bold, rotate: 0.0, align: :center, valign: :bottom },
  P04L02: { page: 4, x_pos: 9.375, y_pos: 79.62962962962963, width: 70.625, height: 5.555555555555555, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P04L03: { page: 4, x_pos: 6.145833333333333, y_pos: 67.77777777777777, width: 53.4375, height: 5.555555555555555, size: 15, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P04L04: { page: 4, x_pos: 6.145833333333333, y_pos: 61.851851851851855, width: 53.4375, height: 23.88888888888889, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P04L05: { page: 4, x_pos: 63.229166666666664, y_pos: 65.92592592592592, width: 30.416666666666668, height: 12.037037037037036, size: 15, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P04L06: { page: 4, x_pos: 63.229166666666664, y_pos: 53.51851851851852, width: 30.416666666666668, height: 16.48148148148148, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P04L07: { page: 4, x_pos: 6.145833333333333, y_pos: 28.70370370370371, width: 87.5, height: 6.851851851851852, size: 15, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P04L08: { page: 4, x_pos: 6.145833333333333, y_pos: 21.29629629629629, width: 87.5, height: 14.25925925925926, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P04L09: { page: 4, x_pos: 88.33333333333333, y_pos: 84.07407407407408, width: 7.5, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom }
},
{
  P05L01: { page: 5, x_pos: 20.208333333333332, y_pos: 96.29629629629629, width: 57.1875, height: 7.777777777777778, size: 28, color: "00c6c1", style: :bold, rotate: 0.0, align: :center, valign: :bottom },
  P05L02: { page: 5, x_pos: 5.729166666666667, y_pos: 80.18518518518519, width: 76.875, height: 10.555555555555555, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P05L03: { page: 5, x_pos: 42.8125, y_pos: 68.14814814814815, width: 52.291666666666664, height: 9.25925925925926, size: 16, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P05L04: { page: 5, x_pos: 46.770833333333336, y_pos: 58.888888888888886, width: 48.333333333333336, height: 9.25925925925926, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P05L05: { page: 5, x_pos: 42.8125, y_pos: 48.7037037037037, width: 52.291666666666664, height: 8.148148148148149, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P05L06: { page: 5, x_pos: 88.33333333333333, y_pos: 79.07407407407408, width: 8.645833333333334, height: 7.037037037037037, size: 23, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom }
},
{
  P06L01: { page: 6, x_pos: 20.208333333333332, y_pos: 96.29629629629629, width: 57.1875, height: 7.777777777777778, size: 28, color: "00c6c1", style: :bold, rotate: 0.0, align: :center, valign: :bottom },
  P06L02: { page: 6, x_pos: 6.458333333333333, y_pos: 78.14814814814815, width: 76.875, height: 5.0, size: 16, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P06L03: { page: 6, x_pos: 4.895833333333333, y_pos: 63.333333333333336, width: 56.354166666666664, height: 12.222222222222221, size: 15, color: "000000", style: :bold, rotate: 0.0, align: :left, valign: :bottom },
  P06L04: { page: 6, x_pos: 4.895833333333333, y_pos: 50.18518518518518, width: 56.354166666666664, height: 14.074074074074074, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P06L05: { page: 6, x_pos: 10.0, y_pos: 35.18518518518519, width: 51.25, height: 6.481481481481482, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P06L07: { page: 6, x_pos: 64.79166666666667, y_pos: 53.51851851851852, width: 30.9375, height: 10.74074074074074, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom },
  P06L08: { page: 6, x_pos: 70.52083333333333, y_pos: 40.925925925925924, width: 25.208333333333332, height: 6.481481481481482, size: 15, color: "000000", style: :normal, rotate: 0.0, align: :left, valign: :bottom }
}
  ].freeze
end
