# Day 16: Ticket Translation

As you're walking to yet another connecting flight, you realize that one of the legs of your re-routed trip coming up is on a high-speed train. However, the train ticket you were given is in a language you don't understand. You should probably figure out what it says before you get to the train station after the next flight.

Unfortunately, you can't actually **read** the words on the ticket. You can, however, read the numbers, and so you figure out the **fields these tickets must have** and the **valid ranges for values** in those fields.

You collect the **rules for ticket fields**, the **numbers on your ticket**, and the **numbers on other nearby tickets** for the same train service (via the airport security cameras) together into a single document you can reference (your puzzle input).

The **rules for ticket fields** specify a list of fields that exist **somewhere** on the ticket and the **valid ranges of values** for each field. For example, a rule like `class: 1-3 or 5-7` means that one of the fields in every ticket is named class and can be any value in the ranges `1-3` or `5-7` (inclusive, such that `3` and `5` are both valid in this field, but `4` is not).

Each ticket is represented by a single line of comma-separated values. The values are the numbers on the ticket in the order they appear; every ticket has the same format. For example, consider this ticket:
```
.--------------------------------------------------------.
| ????: 101    ?????: 102   ??????????: 103     ???: 104 |
|                                                        |
| ??: 301  ??: 302             ???????: 303      ??????? |
| ??: 401  ??: 402           ???? ????: 403    ????????? |
'--------------------------------------------------------'
```

Here, `?` represents text in a language you don't understand. This ticket might be represented as `101,102,103,104,301,302,303,401,402,403`; of course, the actual train tickets you're looking at are **much** more complicated. In any case, you've extracted just the numbers in such a way that the first number is always the same specific field, the second number is always a different specific field, and so on - you just don't know what each position actually means!

Start by determining which tickets are **completely invalid**; these are tickets that contain values which **aren't valid for any field**. Ignore **your ticket** for now.

For example, suppose you have the following notes:

```
class: 1-3 or 5-7
row: 6-11 or 33-44
seat: 13-40 or 45-50

your ticket:
7,1,14

nearby tickets:
7,3,47
40,4,50
55,2,20
38,6,12
```

It doesn't matter which position corresponds to which field; you can identify invalid **nearby tickets** by considering only whether tickets contain **values that are not valid for any field**. In this example, the values on the first **nearby ticket** are all valid for at least one field. This is not true of the other three **nearby tickets**: the values 4, 55, and 12 are are not valid for any field. Adding together all of the invalid values produces your **ticket scanning error rate**: `4 + 55 + 12 = 71`.

Consider the validity of the nearby tickets you scanned. **What is your ticket scanning error rate?**

# Part Two
Now that you've identified which tickets contain invalid values, **discard those tickets entirely**. Use the remaining valid tickets to determine which field is which.

Using the valid ranges for each field, determine what order the fields appear on the tickets. The order is consistent between all tickets: if `seat` is the third field, it is the third field on every ticket, including **your ticket**.

For example, suppose you have the following notes:

```
class: 0-1 or 4-19
row: 0-5 or 8-19
seat: 0-13 or 16-19

your ticket:
11,12,13

nearby tickets:
3,9,18
15,1,5
5,14,9
```

Based on the **nearby tickets** in the above example, the first position must be `row`, the second position must be `class`, and the third position must be `seat`; you can conclude that in **your ticket**, `class is 12`, `row is 11`, and `seat is 13`.

Once you work out which field is which, look for the six fields on **your ticket** that start with the word departure. **What do you get if you multiply those six values together?**


## Solution
### Rewrite the question in your own words:
You have ticket data from a bunch of tickets, but just the numbers not the fields. YOu also know the valid ranges for the fields. Ignore your own ticket for part 1. Looking through all the other ticket data, find all the tickets that have invalid data. Add the invalid values together for the error rate (solution)

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* It seems all about data parsing.
* Not sure if the values are in the same order for all the tickets. But for at least part one that doesn't matter too much, just focus on finding values that don't match any of the valid ranges, regardless of order.

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
Parsing the data first, looking for three major sections. Ticket fields and their ranges, your ticket values, and nearby ticket values.
Create a hash with the field/range definitions. Then parse the nearby tickets into their own lines
Then go through each ticket and check if any of the values don't fit any of the ranges.

### How would you identify the elements of this problem?

- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
Hash for the definitions. Key ad the field name and value is the valid range. It will be easy to search by field. Although checking in the ranges is a little different. For part 1, I just care about the ranges. So maybe an array, or just pull all the values which will be an array, to check if any range includes the value.
Storing the individual ticket values in an array, since I don't have keys to attach. The problem with that is it will make me do some nested iteration, checking each value for each range.

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
To parse the data we need three if rules. First for the field definitions. second for my ticket, third for nearby tickets. Create a hash with the definitions, store my ticket in an array (my_ticket), store the other tickets in nested arrays (tickets).

Iterate through the tickets. Check each individual value to see if it is included in any of the ranges. If not, then store that value in the invalid values array.
Should I also mark invalid tickets as I go? I don't need it now, so maybe YAGNI
After the iteration, sum the invalid values for the solution

### Write out any implementation code OR link to repl
See day_16.rb

### What is the Big O complexity of your solution?
