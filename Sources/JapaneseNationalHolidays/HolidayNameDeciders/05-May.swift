/* *************************************************************************************************
 05-May.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _mayHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (1, 2019):
    return "天皇の即位の日"
  case (3, 1949...):
    return "憲法記念日"
  case (4, 2007...):
    // May 4th is "国民の休日" from 1986 to 2006.
    return "みどりの日"
  case (5, 1949...):
    return "こどもの日"
  default:
    return nil
  }
}
