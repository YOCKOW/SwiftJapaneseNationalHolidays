/* *************************************************************************************************
 JapaneseNationalHolidaysTests.swift
   © 2020 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */

import XCTest
@testable import JapaneseNationalHolidays

#if canImport(Testing)
import Testing
#endif

private func _assertHolidayName(
  _ date: (year: Int, month: Int, day: Int),
  _ expectedHolidayName: String?,
  message: @autoclosure () -> String = "",
  fileID: StaticString = #fileID,
  filePath: StaticString = #filePath,
  line: UInt = #line,
  column: UInt = #column
) {
  let name = japaneseNationalHolidayName(forYear: date.year,
                                         month: date.month,
                                         day: date.day)
  #if swift(>=6.0) && canImport(Testing)
  #expect(
    name == expectedHolidayName,
    Comment(rawValue: message()),
    sourceLocation: .init(fileID: String(describing: fileID), filePath: String(describing: filePath), line: Int(line), column: Int(column))
  )
  #else
  XCTAssertEqual(name, expectedHolidayName, message(), file: filePath, line: line)
  #endif
}

#if swift(>=6.0) && canImport(Testing)
@Test("Holiday Names Test")
#endif
func holidayNamesTest() {
  _assertHolidayName((2020, 1, 1), "元日")
  _assertHolidayName((2017, 1, 2), "振替休日")
  _assertHolidayName((1999, 1, 15), "成人の日")
  _assertHolidayName((2020, 1, 13), "成人の日")
  _assertHolidayName((1989, 1, 16), "振替休日")

  _assertHolidayName((2020, 2, 11), "建国記念の日")
  _assertHolidayName((2018, 2, 12), "振替休日")
  _assertHolidayName((2020, 2, 23), "天皇誕生日")
  _assertHolidayName((2020, 2, 24), "振替休日")

  _assertHolidayName((1923, 3, 22), "春季皇靈祭")
  _assertHolidayName((1983, 3, 21), "春分の日")
  _assertHolidayName((2016, 3, 21), "振替休日")
  _assertHolidayName((2020, 3, 20), "春分の日")
  _assertHolidayName((2010, 3, 22), "振替休日")

  _assertHolidayName((1988, 4, 29), "天皇誕生日")
  _assertHolidayName((2006, 4, 29), "みどりの日")
  _assertHolidayName((2020, 4, 29), "昭和の日")
  _assertHolidayName((2018, 4, 30), "振替休日")
  _assertHolidayName((2019, 4, 30), "国民の休日")

  _assertHolidayName((2019, 5, 2), "国民の休日")
  _assertHolidayName((2020, 5, 3), "憲法記念日")
  _assertHolidayName((1998, 5, 4), "振替休日")
  _assertHolidayName((2000, 5, 4), "国民の休日")
  _assertHolidayName((2020, 5, 4), "みどりの日")
  _assertHolidayName((2020, 5, 5), "こどもの日")
  _assertHolidayName((2019, 5, 6), "振替休日")
  _assertHolidayName((2014, 5, 6), "振替休日")
  _assertHolidayName((2020, 5, 6), "振替休日")

  _assertHolidayName((2000, 7, 20), "海の日")
  _assertHolidayName((1997, 7, 21), "振替休日")
  _assertHolidayName((2019, 7, 15), "海の日")
  _assertHolidayName((2020, 7, 23), "海の日")

  _assertHolidayName((2016, 8, 11), "山の日")
  _assertHolidayName((2020, 8, 10), "山の日")
  _assertHolidayName((2019, 8, 12), "振替休日")

  _assertHolidayName((2002, 9, 15), "敬老の日")
  _assertHolidayName((1991, 9, 16), "振替休日")
  _assertHolidayName((2020, 9, 21), "敬老の日")
  _assertHolidayName((1922, 9, 24), "秋季皇靈祭")
  _assertHolidayName((1983, 9, 23), "秋分の日")
  _assertHolidayName((2020, 9, 22), "秋分の日")
  _assertHolidayName((2018, 9, 24), "振替休日")

  _assertHolidayName((1999, 10, 10), "体育の日")
  _assertHolidayName((1982, 10, 11), "振替休日")
  _assertHolidayName((2000, 10, 9), "体育の日")
  _assertHolidayName((2020, 7, 24), "スポーツの日")

  _assertHolidayName((2020, 11, 3), "文化の日")
  _assertHolidayName((1974, 11, 4), "振替休日")
  _assertHolidayName((2020, 11, 23), "勤労感謝の日")
  _assertHolidayName((1986, 11, 24), "振替休日")

  _assertHolidayName((2018, 12, 23), "天皇誕生日")
  _assertHolidayName((2018, 12, 24), "振替休日")
}

#if swift(>=6.0) && canImport(Testing)
@Test("`Date` Test")
func dateTest() {
  let date = Date(timeIntervalSince1970: 1600619025.0) // 2020-09-21 01:23:45 JST
  #expect(date.japaneseNationalHolidayName == "敬老の日")
  #expect(date.isJapaneseNationalHoliday)
}

@Test("Amendment 2021 Test")
func amendment2021Test() async throws {
  // See https://www.kantei.go.jp/jp/headline/tokyo2020/shukujitsu.html

  _assertHolidayName((2021, 7, 19), nil)
  _assertHolidayName((2021, 7, 22), "海の日")
  _assertHolidayName((2021, 7, 23), "スポーツの日")
  _assertHolidayName((2021, 8, 8), "山の日")
  _assertHolidayName((2021, 8, 9), "振替休日")
  _assertHolidayName((2021, 8, 11), nil)
  _assertHolidayName((2021, 10, 11), nil)
}
#else
final class JapaneseNationalHolidaysTests: XCTestCase {
  func test_holidayNames() {
    holidayNamesTest()
  }
  
  func test_date() {
    let date = Date(timeIntervalSince1970: 1600619025.0) // 2020-09-21 01:23:45 JST
    XCTAssertEqual(date.japaneseNationalHolidayName, "敬老の日")
    XCTAssertTrue(date.isJapaneseNationalHoliday)
  }

  func test_amendment2021() {
    // See https://www.kantei.go.jp/jp/headline/tokyo2020/shukujitsu.html

    _assertHolidayName((2021, 7, 19), nil)
    _assertHolidayName((2021, 7, 22), "海の日")
    _assertHolidayName((2021, 7, 23), "スポーツの日")
    _assertHolidayName((2021, 8, 8), "山の日")
    _assertHolidayName((2021, 8, 9), "振替休日")
    _assertHolidayName((2021, 8, 11), nil)
    _assertHolidayName((2021, 10, 11), nil)
  }
}
#endif
