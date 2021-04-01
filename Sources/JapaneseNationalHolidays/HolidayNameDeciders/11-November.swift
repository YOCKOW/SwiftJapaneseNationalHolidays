/* *************************************************************************************************
 11-November.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _novemberHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (3, 1873...1911):
    return "天長節"
  case (3, 1927..<1948):
    return "明治節"
  case (3, 1948...):
    return "文化の日"
  case (10, 1915), (10, 1928):
    return "即位ノ礼"
  case (12, 1990):
    return "即位礼正殿の儀"
  case (14, 1915), (14, 1928):
    return "大嘗祭"
  case (16, 1915), (16, 1928):
    return "即位礼及大嘗祭後大饗第一日"
  case (23, 1873..<1948):
    return "新嘗祭"
  case (23, 1948...):
    return "勤労感謝の日"
  default:
    return nil
  }
}
