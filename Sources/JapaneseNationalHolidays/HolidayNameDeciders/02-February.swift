/* *************************************************************************************************
 02-February.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */

internal func _februaryHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (11, 1874...1948):
    return "紀元節"
  case (11, 1967...):
    return "建国記念の日"
  case (23, 2020...):
    return "天皇誕生日"
  case (24, 1989):
    return "昭和天皇の大喪の礼"
  default:
    return nil
  }
}
