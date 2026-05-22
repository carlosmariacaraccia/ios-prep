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
