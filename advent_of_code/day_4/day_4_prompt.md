# Day 4: Passport Processing
## Part 2

You arrive at the airport only to realize that you grabbed your North Pole Credentials instead of your passport. While these documents are extremely similar, North Pole Credentials aren't issued by a country and therefore aren't actually valid documentation for travel in most of the world.

It seems like you're not the only one having problems, though; a very long line has formed for the automatic passport scanners, and the delay could upset your travel itinerary.

Due to some questionable network security, you realize you might be able to solve both of these problems at the same time.

The automatic passport scanners are slow because they're having trouble *detecting which passports have all required fields*. The expected fields are as follows:

    `byr` (Birth Year)
    `iyr` (Issue Year)
    `eyr` (Expiration Year)
    `hgt` (Height)
    `hcl` (Hair Color)
    `ecl` (Eye Color)
    `pid` (Passport ID)
    `cid` (Country ID)

Passport data is validated in batch files (your puzzle input). Each passport is represented as a sequence of `key:value` pairs separated by spaces or newlines. Passports are separated by blank lines.

Here is an example batch file containing four passports:

```
ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in
```

The first passport is *valid* - all eight fields are present. The second passport is *invalid* - it is missing `hgt` (the Height field).

The third passport is interesting; the *only missing field* is `cid`, so it looks like data from North Pole Credentials, not a passport at all! Surely, nobody would mind if you made the system temporarily ignore missing `cid` fields. Treat this "passport" as *valid*.

The fourth passport is missing two fields, `cid` and `byr`. Missing `cid` is fine, but missing any other field is not, so this passport is *invalid*.

According to the above rules, your improved system would report `2` valid passports.

Count the number of *valid* passports - those that have all required fields. Treat `cid` as optional. *In your batch file, how many passports are valid?*

## Part 2


### Rewrite the question in your own words:
Check the passport data for validity. Everything must be present (with cid being optional) for a total of 7 categories required. Data is in key/value pairs, pairs are separated by spaces or newlines. Passports are separated by blanklines.
Find the number of Valid passports

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* There will be duplicate data across passports, at a minimum dates.
* value fields could vary in length
* A bad passport may have duplicate keys, so I shouldn't just count number of keys and assume that is the same as all fields being present.

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
* Taking in and parsing the data is the trickiest part
* Checking the data isn't too bad. Can convert the data into hashes and check for the presence of the 7 required fields. Also check for any repeated keys.
* Could instead check for repeated keys and then check for 7 keys (or 8 with cid, 7 would give false positives)

### How would you identify the elements of this problem?

- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [ ] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
* Hashes will be good for checking that the required keys exist and they have values. Cons are that a duplicate key will overwrite the previous value. So will have to check for that

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
* Take inputs and parse, everything before a blank line is one passport, datafields are key:values pairs and each pair is seperated by a space `' '` or a newline `'/n'`
* Create hash out of the inputs, checking for no duplicate keys
* Incrementing counter for good passports
* Check if keys equal 8, if so good
* Check if keys equal 7, if so check for cid, if cid then no good
* All else, no good
* Alternate, check if keys equal required_keys

### Write out any implementation code OR link to repl

### What is the Big O complexity of your solution?
