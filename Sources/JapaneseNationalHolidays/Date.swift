/* *************************************************************************************************
 Date.swift
   © 2020 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */
 
@_exported import Foundation

private let _gregorianCalendar = Calendar(identifier: .gregorian)
private let _JST = TimeZone(identifier: "JST")!

extension Date {
  public var dateComponentsInJapan: DateComponents {
    return _gregorianCalendar.dateComponents(in: _JST, from: self)
  }
  
  /// Returns the name of national holiday in Japan on the date specified by the instance,
  /// or `nil` if the day is not a holiday.
  /// 
  /// Japan Standard Time (JST) is used for the time zone.
  public var japaneseNationalHolidayName: String? {
    let dateComponents = dateComponentsInJapan
    return JapaneseNationalHolidays.japaneseNationalHolidayName(forYear: dateComponents.year!,
                                                                month: dateComponents.month!,
                                                                day: dateComponents.day!)
  }
  
  /// Returns the Boolean value that indicates whether the day is a holiday in Japan or not.
  public var isJapaneseNationalHoliday: Bool {
    return self.japaneseNationalHolidayName != nil
  }
}
