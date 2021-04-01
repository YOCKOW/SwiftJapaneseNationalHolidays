/* *************************************************************************************************
 06-June.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _juneHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (9, 1993):
    return "皇太子徳仁親王の結婚の儀"
  default:
    return nil
  }
}
