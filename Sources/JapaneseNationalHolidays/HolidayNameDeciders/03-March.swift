/* *************************************************************************************************
 03-March.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _marchHolidayName(day: Int, year: Int) -> String? {
  func __vernalEquinoxDay() -> Int? {
    // TODO: Should be update every year if necessary.
    func __delta() -> Double? {
      switch year {
      case 1850..<1900: return 19.8277
      case 1900..<1980: return 20.8357
      case 1980..<2100: return 20.8431
      case 2100..<2150: return 21.8510
      default: return nil
      }
    }
    guard let delta = __delta() else { return nil }
    let yDiff = Double(year - 1980)
    return Int(delta + 0.242194 * yDiff - floor(yDiff / 4))
  }

  switch (day, year) {
  case (__vernalEquinoxDay(), _):
    switch year {
    case 1879...1948:
      return "春季皇靈祭"
    case 1949...:
      return "春分の日"
    default:
      return nil
    }
  default:
    return nil
  }
}
