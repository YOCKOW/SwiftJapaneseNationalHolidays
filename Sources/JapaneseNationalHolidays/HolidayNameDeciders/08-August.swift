/* *************************************************************************************************
 08-August.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _augustHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (10, 2020):
    fallthrough
  case (11, 2016...) where year != 2020:
    return "山の日"
  case (31, 1913...1926):
    return "天長節"
  default:
    return nil
  }
}
