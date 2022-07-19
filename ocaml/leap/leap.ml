open Int

let leap_year year =
    rem year 4 = 0 && (rem year 100 != 0 || rem year 400 = 0)
