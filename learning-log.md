## Day 2
Learing how to create my own hash map is really great
I did not know how it worked or what to do with the collisions
I understood that the hash is not useful without knowing the number of elements
I understood what to do with the remainder operator.
I also understood the concept of resizing and of reseting the count and what a 
subscript is useful for.
I'm really happy doing this example although I did not finished it in 1 day

## Day 4
Understaning how cow works is a must, this was the learning of the day. Another important
thing I learned is that playgrounds are a pain to use. Triggering the code from the console
is much faster
swift -O file_name.swift -> runs the swift file
The data structure that will hold the large collection in this case the BigStructWithCow will be the one
responsible for calling cow.
The only thing that the cow does is that if the object is not uniquely referenced the a copy of the
type will be done and then it will be passed along
Every time we call the copy function then a collection will be re created
The copy method lives in the custom data class (In this case the Buffer<Int>
Then the custom class that triggers the if the object is not know to be uniquely referenced

## Day 5
Try not to remember what I have learned in the past to solve these exercises by hard, just read
the problem and think it with a solution. Practice every single day. I should think in a simpler way
learning about swift set's methods is also great. I need to prep every day and start a new challenge.
I by myself solved the problem in an easier way, I need to start thinking about overflow issues and other
constraints that might affect the viability or performance. I also need to stop using ai and 
autocomplete. 

## Day 6
Solving the two sum algorithm was really great, I understood really well the memoizing concept and 
when to cache their values. I was trying to remember how to solve it and that was my burden. Finally
when I freed myself the problem was really clear and easy to understand and code. The fact that I could
write the code like
```swift
  let currentValue = intList[currentIndex]
  let desiredValue = target - currentValue
  if let indexOfDesiredValue = seenValues[desiredValue] { // we found the value
    return [indexOfDesiredValue, currentIndex]
  } else { // we did not find the value, so we store it and its index
    seenValues[currentValue] = currentIndex
  }
```

## Day 7
Solving the anagrams problems in two different days was great too. Also having 2 resting days to learn between
them was great too. To find is 2 words are anagrams I just have to go through then at the same time. This 
means that they need to have the same number of letters, that gave me the initial conditions, then grabbing
any of them I can create an index list and loop througth the words indices. Then the chars I see in word a
should be added to a hash table and the ones i see from words b should be removed, if the values from the hash
map are all 0 then we have an anagram. I tried to solve it by adding and seeing if the reminder is 0. But it
did not work, because I was having order issues. Then I have to loop again through the values and see if 
there any non 0.

The syntax I learned from swift was to default hashmaps
```swift
dictionary['key', default:0] += 1
```
This means if there's no key (nil) then set the key and default value to 0

The grouped anagrams was easier because I remembered a2d4f1, and that was the key I needed for the words to
be see if they are anagrams. That was the hint claude gave to seek through the list. The I understood they
that the key had to be lowercased and sorted for it to be all the same. So I only needed to sort the string.
```swift
let key = String("word".lowercased().sorted())
```

# Week 2

## Day 1
The concept

static dispatch -> Compile Time -> Types **the dispatch is resolved by the static type of the reference**
dinamic dispatch -> Run Time -> Instance **the dispatch resolves on the dynamic type of the instance**

I understood that methods that are declared only in extensions are dispatched on the declared type,
and that methods that are required (declared in the protocol body) dispatch on the concrete type (the instance).
This might cause that a protocol to a call a method that's not intended.

The exercise was to build 3 structs that conformed to a Drawable protocol that will calculate an area and they
will have a description method that will be overriden. Description (the method) might be declared only as an extension
or in the body of the protocol.

## Day 2
**Topic:** PATs - protocols with associated type, associated types erasure
**Read:** Swift Book - Generics with Associated Type
**Built:** Container Protocol - Stack and Queue conforming to the Container Protocol. Hit the wall when 
```swift
let c: Container = Stack<Int>()
c.append(1) did not compiled
```
**Clicked:** To understand if the compiler will hit a warning or not we need to undertand 3 clauses
1) Is there an associated type in the protocol?
2) Are we removing the biding tye erasing the reference to any? (Although we might have the binding in 
the instance we are removing it from the reference) (let c: any Container = Stack<Int>())
3) Does the requirement signature mentions the associated type? (append(Element))
If these 3 clauses are Ok, then the code won't compile
**Fuzzy:** I need to do some more excercises to have a deeper knowledge of this topic

## Day 3
**Topic:** any vs some vs generics
**Built:** Stack / Queue conforming to Container. Then used protocols in 3 different ways
**Clicked:** 
I will be using **any** when I need an Heterogeneous Storage (i.e: an array with different types)
I will be using **some** when I want to hide the type from the caller while the compiler still fixes it to 1 type.
The binding is still there but it is hidden
I will be using a **generic** when I want an homogeneous <C: Container> so the caller sets the type getting full read
and write access to the associated type
**Fuzzy:** This topic requires a lot of practice

## [06-17-2026] — Week 2 Day 4 (Project)
**Topic:** Generic Result type from scratch — map, flatMap, mapError
**Read:** Nothing to read
**Built:** MyResult<Success, Failure: Error> enum with map, flatMap, mapError extensions
**Clicked:** The structures where easier than what i thought
**Fuzzy:** I just confused myself when I was using Self. instead of MyResult

## [06-18-2026] — Week 2 Day 5 (Algo)
**Pattern:** Two Pointers
**Problems:**
- Valid Palindrome (solved in X min)
**Pattern signal:** This pattern is when i have to avoid cycling through a collection
  from both parts to save the nested loops. 
**Key trick:** You move the indexes from the trailing and
  leading part of the collection, adding one to the leading and removing one from the
  trailing. You need to trim the string from special characters and white spaces and then
  to compare both chars
**Mistakes:** Remember that swift strings are not index based they are String.Index based
  and we should cycle through them using string.advance(by: ). If we use Array(String) then
  we access the [Character] and we can compare them individually
**Time/Space:** O(n) / O(n) as written. The solution we reached is O(n) time and O(n) space
  We can optimize for O(1) space by avoiding the lowercasing and trimming the white spaces and
  special chars in place. But that will make us deal with the String.Index based functions and
  will remove the Int index based approach we did.
  
