/* *************************************************************************************************
 helpers.swift
   © 2021 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */

internal func _lastDay(ofMonth month: Int, year: Int) -> Int {
  let days: [Int] = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  func __isLeapYear() -> Bool {
    return year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
  }
  if month != 2 || !__isLeapYear() {
    return days[month]
  }
  return 29
}

internal func _validate(year: Int, month: Int, day: Int) -> Bool {
  guard month > 0 && month < 13 && day > 0 else { return false }
  return day <= _lastDay(ofMonth: month, year: year)
}

internal enum _Weekday: Int, Equatable {
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

internal func _numberOfMonday(year: Int, month: Int, day: Int) -> Int? {
  guard _Weekday(year: year, month: month, day: day) == .monday else { return nil }
  return (day - 1) / 7 + 1
}

internal func _previousDay(ofYear year: Int, month: Int, day: Int) -> (year: Int, month: Int, day: Int) {
  if day > 1 {
    return (year: year, month: month, day: day - 1)
  }
  if month > 1 {
    let prevMonth = month - 1
    return (year: year, month: prevMonth, day: _lastDay(ofMonth: prevMonth, year: year))
  }
  let prevYear = year - 1
  return (year: prevYear, month: 12, day: 31)
}

internal func _nextDay(ofYear year: Int, month: Int, day: Int) -> (year: Int, month: Int, day: Int) {
  let nextDay = day + 1
  if _validate(year: year, month: month, day: nextDay) {
    return (year: year, month: month, day: nextDay)
  }
  if month < 12 {
    return (year: year, month: month + 1, day: 1)
  }
  return (year: year + 1, month: 1, day: 1)
}

internal func _compare(_ day1: (year: Int, month: Int, day: Int),
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
