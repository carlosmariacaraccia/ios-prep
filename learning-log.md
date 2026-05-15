## Day 2 COW
This is a concept I have to learn and review, the COW just lets me know 
when a value type should be copied or not. This has to do with speed
and efficiency, if the array has multiple copies and has not mutations
then COW won't trigger, but if one of the instances has mutated, then
we should not point to the same memory address and perform a copy of the type
now we can mutate safely, without compromising the initial memory address
A subscript was a concept I did not have in my mind too
I never understood that it was a nicer notation to access and assign elements
