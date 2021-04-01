/* *************************************************************************************************
 10-October.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
internal func _octoberHolidayName(day: Int, year: Int) -> String? {
  switch (day, year) {
  case (10, 1966..<2000):
    fallthrough
  case (_, 2000..<2020) where _numberOfMonday(year: year, month: 10, day: day) == 2:
    return "体育の日"
  case (_, 2022...) where _numberOfMonday(year: year, month: 10, day: day) == 2:
    // "スポーツの日" is July 24th in 2020.
    // "スポーツの日" is July 23rd in 2021.
    return "スポーツの日"
  case (17, 1879...1947):
    return "神嘗祭"
  case (22, 2019):
    return "即位礼正殿の儀"
  case (31, 1913...1926):
    return "天長節祝日"
  default:
    return nil
  }
}
