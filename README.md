# SwiftJapaneseNationalHolidays

`SwiftJapaneseNationalHolidays` provides some functions related to National Holidays in Japan.


# Requirements

- Swift 5
- macOS or Linux


# Usage

```Swift
import Foundation
import JapaneseNationalHolidays

// With a simple function
print(japaneseNationalHolidayName(forYear: 2020, month: 7, day: 24)!) // -> "スポーツの日"

// With `Date`
let date = Date(timeIntervalSince1970: 1600619025.0) // 2020-09-21 01:23:45 JST
print(date.japaneseNationalHolidayName!) // -> "敬老の日"

```

# License

MIT License.  
See "LICENSE.txt" for more information.


