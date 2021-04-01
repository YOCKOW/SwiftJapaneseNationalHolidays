/* *************************************************************************************************
 04-April.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
func _aprilHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (3, 1874...1948):
    return "神武天皇祭"
  case (10, 1959):
    return "皇太子明仁親王の結婚の儀"
  case (29, 1927...1948):
    return "天長節"
  case (29, 1949..<1989):
    return "天皇誕生日"
  case (29, 1989..<2007):
    return "みどりの日"
  case (29, 2007...):
    return "昭和の日"
  default:
    return nil
  }
}
