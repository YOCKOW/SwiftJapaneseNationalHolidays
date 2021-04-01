/* *************************************************************************************************
 JapaneseNationalHolidays.swift
   © 2020 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */

/// Returns the name of national holiday in Japan on the specified day,
/// or `nil` if the day is not a holiday.
public func japaneseNationalHolidayName(forYear year: Int, month: Int, day: Int) -> String? {
  /// MAIN FUNCTION: Returns the name of national holiday if available
  func __simpleNationalHolidayName(forYear year: Int, month: Int, day: Int) -> String? {
    let holidayNameDeciders: [(_ day: Int, _ year: Int) -> String?] = [
      { _,_ in fatalError("Never called.") },
      _januaryHolidayName,
      _februaryHolidayName,
      _marchHolidayName,
      _aprilHolidayName,
      _mayHolidayName,
      _juneHolidayName,
      _julyHolidayName,
      _augustHolidayName,
      _septemberHolidayName,
      _octoberHolidayName,
      _novemberHolidayName,
      _decemberHolidayName,
    ]
    
    return holidayNameDeciders[month](day, year)
  }
  
  if let holidayName = __simpleNationalHolidayName(forYear: year, month: month, day: day) {
    return holidayName
  }
  
  func __isSimpleNationalHoliday(year: Int, month: Int, day: Int) -> Bool {
    return __simpleNationalHolidayName(forYear: year, month: month, day: day) != nil
  }
  
  /// Returns the Boolean value that indicates whether the day is "振替休日" or not.
  func __isSubstituteHoliday() -> Bool {
    func __old_isSubstituteHoliday() -> Bool {
      guard _Weekday(year: year, month: month, day: day) == .monday else { return false }
      let previousDay = _previousDay(ofYear: year, month: month, day: day)
      return __isSimpleNationalHoliday(year: previousDay.year,
                                       month: previousDay.month,
                                       day: previousDay.day)
    }
    
    func __new_isSubstituteHoliday() -> Bool {
      var weekday = _Weekday(year: year, month: month, day: day)
      if weekday == .sunday {
        return false
      }
      var previousDay = _previousDay(ofYear: year, month: month, day: day)
      while weekday != .sunday {
        if !__isSimpleNationalHoliday(year: previousDay.year,
                                      month: previousDay.month,
                                      day: previousDay.day) {
          return false
        }
        weekday = _Weekday(rawValue: weekday.rawValue - 1)!
        previousDay = _previousDay(ofYear: previousDay.year,
                                    month: previousDay.month,
                                    day: previousDay.day)
      }
      return true
    }
    
    if _compare((2007, 1, 1), (year, day, month)) == .orderedAscending {
      return __new_isSubstituteHoliday()
    }
    if _compare((1973, 4, 12), (year, day, month)) == .orderedAscending {
      return __old_isSubstituteHoliday()
    }
    return false
  }
  
  if __isSubstituteHoliday() {
    return "振替休日"
  }
  
  /// Returns the Boolean value that indicates whether the day is "国民の休日" or not.
  func __isCitizensHoliday() -> Bool {
    if _compare((1985, 12, 27), (year, month, day)) == .orderedDescending {
      return false
    }
    
    let previousDayIsHoliday: () -> Bool = {
      let previousDay = _previousDay(ofYear: year, month: month, day: day)
      return __isSimpleNationalHoliday(year: previousDay.year,
                                       month: previousDay.month,
                                       day: previousDay.day)
    }
    let nextDayIsHoliday: () -> Bool = {
      let nextDay = _nextDay(ofYear: year, month: month, day: day)
      return __isSimpleNationalHoliday(year: nextDay.year,
                                       month: nextDay.month,
                                       day: nextDay.day)
    }
    
    guard previousDayIsHoliday() && nextDayIsHoliday() else { return false }
    if _compare((2007, 1, 1), (year, month, day)) == .orderedAscending {
      return true
    }
    return _Weekday(year: year, month: month, day: day) != .sunday
  }
  
  if __isCitizensHoliday() {
    return "国民の休日"
  }
  
  return nil
}
