/* *************************************************************************************************
 JapaneseNationalHolidays.swift
   © 2020 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */

import Foundation

/// Returns the name of national holiday in Japan on the specified day,
/// or `nil` if the day is not a holiday.
public func japaneseNationalHolidayName(forYear year: Int, month: Int, day: Int) -> String? {
  func __lastDay(ofMonth month: Int, year: Int) -> Int {
    let days: [Int] = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    func __isLeapYear() -> Bool {
      return year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
    }
    if month != 2 || !__isLeapYear() {
      return days[month]
    }
    return 29
  }
  
  func __validate(year: Int, month: Int, day: Int) -> Bool {
    guard month > 0 && month < 13 && day > 0 else { return false }
    return day <= __lastDay(ofMonth: month, year: year)
  }
  precondition(__validate(year: year, month: month, day: day), "Invalid date.")
  
  enum __Weekday: Int, Equatable {
    case sunday = 0, monday, tuesday, wednesday, thursday, friday, saturday
    init(year: Int, month: Int, day: Int) {
      // Zeller's Congruence
      let y = month > 2 ? year : year - 1
      let m = month > 2 ? month : month + 12
      let d = day
      let h = (y + (y / 4) - (y / 100) + (y / 400) + ((13 * m + 8) / 5) + d) % 7
      self.init(rawValue: h)!
    }
  }
  
  /// MAIN FUNCTION: Returns the name of national holiday if available
  func __simpleNationalHolidayName(forYear year: Int, month: Int, day: Int) -> String? {
    func __numberOfMonday() -> Int? {
      guard __Weekday(year: year, month: month, day: day) == .monday else { return nil }
      return (day - 1) / 7 + 1
    }
    
    typealias __HolidayNameFunction = () -> String?
    
    func __januaryHolidayName() -> String? {
      switch (day, year) {
      case (1, 1949...):
        return "元日"
      case (3, 1874...1948):
        return "元始祭"
      case (5, 1874...1948):
        return "新年宴會"
      case (15, 1949..<2000):
        fallthrough
      case (_, 2000...) where __numberOfMonday() == 2:
        return "成人の日"
      case (29, 1873):
        return "神武天皇即位日"
      case (30, 1874...1912):
        return "孝明天皇祭"
      default:
        return nil
      }
    }
    
    func __februaryHolidayName() -> String? {
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
    
    func __marchHolidayName() -> String? {
      func __vernalEquinoxDay() -> Int? {
        // TODO: Should be update every year if necessary.
        func __delta() -> Double? {
          switch year {
          case 1850..<1900: return 19.8277
          case 1900..<1980: return 20.8357
          case 1980..<2100: return 20.8431
          case 2100..<2150: return 21.8510
          default: return nil
          }
        }
        guard let delta = __delta() else { return nil }
        let yDiff = Double(year - 1980)
        return Int(delta + 0.242194 * yDiff - floor(yDiff / 4))
      }
      
      switch (day, year) {
      case (__vernalEquinoxDay(), _):
        switch year {
        case 1879...1948:
          return "春季皇靈祭"
        case 1949...:
          return "春分の日"
        default:
          return nil
        }
      default:
        return nil
      }
    }
    
    func __aprilHolidayName() -> String? {
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
    
    func __mayHolidayName() -> String? {
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
    
    func __juneHolidayName() -> String? {
      switch (day, year) {
      case (9, 1993):
        return "皇太子徳仁親王の結婚の儀"
      default:
        return nil
      }
    }
    
    func __julyHolidayName() -> String? {
      switch (day, year) {
      case (20, 1996..<2003), (23, 2020):
        fallthrough
      case (_, 2003...) where year != 2020 && __numberOfMonday() == 3:
        return "海の日"
      case (24, 2020):
        return "スポーツの日"
      case (30, 1913...1926):
        return "明治天皇祭"
      default:
        return nil
      }
    }
    
    func __augustHolidayName() -> String? {
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
    
    func __septemberHolidayName() -> String? {
      func __autumnalEquinoxDay() -> Int? {
        // TODO: Should be update every year if necessary.
        func __delta() -> Double? {
          switch year {
          case 1850..<1900: return 22.2588
          case 1900..<1980: return 23.2588
          case 1980..<2100: return 23.2488
          case 2100..<2150: return 24.2488
          default: return nil
          }
        }
        guard let delta = __delta() else { return nil }
        let yDiff = Double(year - 1980)
        return Int(delta + 0.242194 * yDiff - floor(yDiff / 4))
      }
      
      switch (day, year) {
      case (15, 1966..<2003):
        fallthrough
      case (_, 2003...) where __numberOfMonday() == 3:
        return "敬老の日"
      case (17, 1874...1878):
        return "神嘗祭"
      case (__autumnalEquinoxDay(), _):
        switch year {
        case 1879..<1948:
          return "秋季皇靈祭"
        case 1948...:
          return "秋分の日"
        default:
          return nil
        }
      default:
        return nil
      }
    }
    
    func __octoberHolidayName() -> String? {
      switch (day, year) {
      case (10, 1966..<2000):
        fallthrough
      case (_, 2000..<2020) where __numberOfMonday() == 2:
        return "体育の日"
      case (_, 2021...) where __numberOfMonday() == 2:
        // "スポーツの日" is July 24th in 2020.
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
    
    func __novemberHolidayName() -> String? {
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
    
    func __decemberHolidayName() -> String? {
      switch (day, year) {
      case (23, 1989..<2019):
        return "天皇誕生日"
      case (25, 1927..<1948):
        return "大正天皇際"
      default:
        return nil
      }
    }
    
    let holidayNameDeciders: [__HolidayNameFunction] = [
      { fatalError("Never called.") },
      __januaryHolidayName,
      __februaryHolidayName,
      __marchHolidayName,
      __aprilHolidayName,
      __mayHolidayName,
      __juneHolidayName,
      __julyHolidayName,
      __augustHolidayName,
      __septemberHolidayName,
      __octoberHolidayName,
      __novemberHolidayName,
      __decemberHolidayName
    ]
    
    return holidayNameDeciders[month]()
  }
  
  if let holidayName = __simpleNationalHolidayName(forYear: year, month: month, day: day) {
    return holidayName
  }
  
  func __isSimpleNationalHoliday(year: Int, month: Int, day: Int) -> Bool {
    return __simpleNationalHolidayName(forYear: year, month: month, day: day) != nil
  }
  
  func __previousDay(ofYear year: Int, month: Int, day: Int) -> (year: Int, month: Int, day: Int) {
    if day > 1 {
      return (year: year, month: month, day: day - 1)
    }
    if month > 1 {
      let prevMonth = month - 1
      return (year: year, month: prevMonth, day: __lastDay(ofMonth: prevMonth, year: year))
    }
    let prevYear = year - 1
    return (year: prevYear, month: 12, day: 31)
  }
  
  func __nextDay(ofYear year: Int, month: Int, day: Int) -> (year: Int, month: Int, day: Int) {
    let nextDay = day + 1
    if __validate(year: year, month: month, day: nextDay) {
      return (year: year, month: month, day: nextDay)
    }
    if month < 12 {
      return (year: year, month: month + 1, day: 1)
    }
    return (year: year + 1, month: 1, day: 1)
  }
  
  func __compare(_ day1: (year: Int, month: Int, day: Int),
                 _ day2: (year: Int, month: Int, day: Int)) -> ComparisonResult {
    if day1.year > day2.year {
      return .orderedDescending
    }
    if day1.year < day2.year {
      return .orderedAscending
    }
    if day1.month > day2.month {
      return .orderedDescending
    }
    if day1.month < day2.month {
      return .orderedAscending
    }
    if day1.day > day2.day {
      return .orderedDescending
    }
    if day1.day < day2.day {
      return .orderedAscending
    }
    return .orderedSame
  }
  
  /// Returns the Boolean value that indicates whether the day is "振替休日" or not.
  func __isSubstituteHoliday() -> Bool {
    func __old_isSubstituteHoliday() -> Bool {
      guard __Weekday(year: year, month: month, day: day) == .monday else { return false }
      let previousDay = __previousDay(ofYear: year, month: month, day: day)
      return __isSimpleNationalHoliday(year: previousDay.year,
                                       month: previousDay.month,
                                       day: previousDay.day)
    }
    
    func __new_isSubstituteHoliday() -> Bool {
      var weekday = __Weekday(year: year, month: month, day: day)
      if weekday == .sunday {
        return false
      }
      var previousDay = __previousDay(ofYear: year, month: month, day: day)
      while weekday != .sunday {
        if !__isSimpleNationalHoliday(year: previousDay.year,
                                      month: previousDay.month,
                                      day: previousDay.day) {
          return false
        }
        weekday = __Weekday(rawValue: weekday.rawValue - 1)!
        previousDay = __previousDay(ofYear: previousDay.year,
                                    month: previousDay.month,
                                    day: previousDay.day)
      }
      return true
    }
    
    if __compare((2007, 1, 1), (year, day, month)) == .orderedAscending {
      return __new_isSubstituteHoliday()
    }
    if __compare((1973, 4, 12), (year, day, month)) == .orderedAscending {
      return __old_isSubstituteHoliday()
    }
    return false
  }
  
  if __isSubstituteHoliday() {
    return "振替休日"
  }
  
  /// Returns the Boolean value that indicates whether the day is "国民の休日" or not.
  func __isCitizensHoliday() -> Bool {
    if __compare((1985, 12, 27), (year, month, day)) == .orderedDescending {
      return false
    }
    
    let previousDayIsHoliday: () -> Bool = {
      let previousDay = __previousDay(ofYear: year, month: month, day: day)
      return __isSimpleNationalHoliday(year: previousDay.year,
                                       month: previousDay.month,
                                       day: previousDay.day)
    }
    let nextDayIsHoliday: () -> Bool = {
      let nextDay = __nextDay(ofYear: year, month: month, day: day)
      return __isSimpleNationalHoliday(year: nextDay.year,
                                       month: nextDay.month,
                                       day: nextDay.day)
    }
    
    guard previousDayIsHoliday() && nextDayIsHoliday() else { return false }
    if __compare((2007, 1, 1), (year, month, day)) == .orderedAscending {
      return true
    }
    return __Weekday(year: year, month: month, day: day) != .sunday
  }
  
  if __isCitizensHoliday() {
    return "国民の休日"
  }
  
  return nil
}
