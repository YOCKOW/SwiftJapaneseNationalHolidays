/* *************************************************************************************************
 12-December.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _decemberHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (23, 1989..<2019):
    return "天皇誕生日"
  case (25, 1927..<1948):
    return "大正天皇際"
  default:
    return nil
  }
}
