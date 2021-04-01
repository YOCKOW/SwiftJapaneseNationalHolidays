/* *************************************************************************************************
 09-September.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _septemberHolidayName(day: Int, year: Int) -> String? {
  func __autumnalEquinoxDay() -> Int? {
    // TODO: Should be update every year if necessary.
    func __delta() -> Double? {
      switch year {
      case 1850..<1900: return 22.2588
      case 1900..<1980: return 23.2588
      case 1980..<2100: return 23.2488
      case 2100..<2150: return 24.2488
      default: return nil
      }
    }
    guard let delta = __delta() else { return nil }
    let yDiff = Double(year - 1980)
    return Int(delta + 0.242194 * yDiff - floor(yDiff / 4))
  }

  switch (day, year) {
  case (15, 1966..<2003):
    fallthrough
  case (_, 2003...) where _numberOfMonday(year: year, month: 9, day: day) == 3:
    return "敬老の日"
  case (17, 1874...1878):
    return "神嘗祭"
  case (__autumnalEquinoxDay(), _):
    switch year {
    case 1879..<1948:
      return "秋季皇靈祭"
    case 1948...:
      return "秋分の日"
    default:
      return nil
    }
  default:
    return nil
  }
}
