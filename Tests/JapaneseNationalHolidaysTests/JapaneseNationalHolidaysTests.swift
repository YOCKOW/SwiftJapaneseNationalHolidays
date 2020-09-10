import XCTest
@testable import JapaneseNationalHolidays

final class JapaneseNationalHolidaysTests: XCTestCase {
  func test_holidayNames() {
    func __assert(_ date: (year: Int, month: Int, day: Int),
                  _ expectedHolidayName: String?,
                  message: @autoclosure () -> String = "",
                  file: StaticString = #file,
                  line: UInt = #line) {
      let name = japaneseNationalHolidayName(forYear: date.year,
                                             month: date.month,
                                             day: date.day)
      XCTAssertEqual(name, expectedHolidayName, message(), file: file, line: line)
    }
    
    __assert((2020, 1, 1), "元日")
    __assert((2017, 1, 2), "振替休日")
    __assert((1999, 1, 15), "成人の日")
    __assert((2020, 1, 13), "成人の日")
    __assert((1989, 1, 16), "振替休日")
    
    __assert((2020, 2, 11), "建国記念の日")
    __assert((2018, 2, 12), "振替休日")
    __assert((2020, 2, 23), "天皇誕生日")
    __assert((2020, 2, 24), "振替休日")
    
    __assert((1923, 3, 22), "春季皇靈祭")
    __assert((1983, 3, 21), "春分の日")
    __assert((2016, 3, 21), "振替休日")
    __assert((2020, 3, 20), "春分の日")
    __assert((2010, 3, 22), "振替休日")
    
    __assert((1988, 4, 29), "天皇誕生日")
    __assert((2006, 4, 29), "みどりの日")
    __assert((2020, 4, 29), "昭和の日")
    __assert((2018, 4, 30), "振替休日")
    __assert((2019, 4, 30), "国民の休日")
    
    __assert((2019, 5, 2), "国民の休日")
    __assert((2020, 5, 3), "憲法記念日")
    __assert((1998, 5, 4), "振替休日")
    __assert((2000, 5, 4), "国民の休日")
    __assert((2020, 5, 4), "みどりの日")
    __assert((2020, 5, 5), "こどもの日")
    __assert((2019, 5, 6), "振替休日")
    __assert((2014, 5, 6), "振替休日")
    __assert((2020, 5, 6), "振替休日")
    
    __assert((2000, 7, 20), "海の日")
    __assert((1997, 7, 21), "振替休日")
    __assert((2019, 7, 15), "海の日")
    __assert((2020, 7, 23), "海の日")
    
    __assert((2016, 8, 11), "山の日")
    __assert((2020, 8, 10), "山の日")
    __assert((2019, 8, 12), "振替休日")
    
    __assert((2002, 9, 15), "敬老の日")
    __assert((1991, 9, 16), "振替休日")
    __assert((2020, 9, 21), "敬老の日")
    __assert((1922, 9, 24), "秋季皇靈祭")
    __assert((1983, 9, 23), "秋分の日")
    __assert((2020, 9, 22), "秋分の日")
    __assert((2018, 9, 24), "振替休日")
    
    __assert((1999, 10, 10), "体育の日")
    __assert((1982, 10, 11), "振替休日")
    __assert((2000, 10, 9), "体育の日")
    __assert((2020, 7, 24), "スポーツの日")
    __assert((2021, 10, 11), "スポーツの日")
    
    __assert((2020, 11, 3), "文化の日")
    __assert((1974, 11, 4), "振替休日")
    __assert((2020, 11, 23), "勤労感謝の日")
    __assert((1986, 11, 24), "振替休日")
    
    __assert((2018, 12, 23), "天皇誕生日")
    __assert((2018, 12, 24), "振替休日")
  }
}
