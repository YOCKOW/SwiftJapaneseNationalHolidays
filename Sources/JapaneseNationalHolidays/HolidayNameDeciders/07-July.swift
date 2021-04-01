/* *************************************************************************************************
 07-July.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _julyHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (20, 1996..<2003), (23, 2020):
    fallthrough
  case (_, 2003...) where year != 2020 && _numberOfMonday(year: year, month: 7, day: day) == 3:
    return "海の日"
  case (24, 2020):
    return "スポーツの日"
  case (30, 1913...1926):
    return "明治天皇祭"
  default:
    return nil
  }
}
