/* *************************************************************************************************
 01-January.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _januaryHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (1, 1949...):
    return "元日"
  case (3, 1874...1948):
    return "元始祭"
  case (5, 1874...1948):
    return "新年宴會"
  case (15, 1949..<2000):
    fallthrough
  case (_, 2000...) where _numberOfMonday(year: year, month: 1, day: day) == 2:
    return "成人の日"
  case (29, 1873):
    return "神武天皇即位日"
  case (30, 1874...1912):
    return "孝明天皇祭"
  default:
    return nil
  }
}
