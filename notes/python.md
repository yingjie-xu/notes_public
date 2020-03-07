## List

**negative indexing**: [-1] represents the last element of the list

**slice** lists:  `l[2:-1]` 左闭右开

### insert or append

> - We can add one item to a list using `append()` method or add several items using `extend()` method.
> - Furthermore, we can insert one item at a desired location by using the method `insert()` or insert multiple items by squeezing it into an empty slice of a list.

`l.append(2)`: add to the end of list

`l.extend([1,2,3])`: use extend to add to the end of list with another list

`l.insert(1,3)`: insert 3 at a specified index (1)

`l[2:2] = [3, 5, 7]`: insert a list of elements at index 2

`l[1:4] = [3, 5, 7] `: change the value in the list (multiple indexes)

concatenation two lists by using `+`

repeat the same element in the list by using `*`

### delete or remove

>- We can use `remove()` method to remove the given item or `pop()` method to remove an item at the given index.
>- The `pop()` method **removes and returns the last item** if index is not provided. This helps us implement lists as stacks (first in, last out data structure).
>- We can also use the `clear()` method to empty a list.

`del l[2]`: delete element at index 2

`del l[2:5]`: delete multiple elements at once

`del l`: delete the entire list

`l.remove('p')`: remove the first occurrence of 'p' from the list

`l.pop(3)`: pop the element at index 3

`l.pop()`: pop the last element

`l.clear()`: empty a list

`in` and `not in`: `'a' in l` checks if a is in the l

| [Python List Methods](https://www.programiz.com/python-programming/methods/list) |
| :----------------------------------------------------------- |
| [**append()** - Add an element to the end of the list](https://www.programiz.com/python-programming/methods/list/append) |
| [**extend()** - Add all elements of a list to the another list](https://www.programiz.com/python-programming/methods/list/extend) |
| [**insert()** - Insert an item at the defined index](https://www.programiz.com/python-programming/methods/list/insert) |
| [**remove()** - Removes an item from the list](https://www.programiz.com/python-programming/methods/list/remove) |
| [**pop()** - Removes and returns an element at the given index](https://www.programiz.com/python-programming/methods/list/pop) |
| [**clear()** - Removes all items from the list](https://www.programiz.com/python-programming/methods/list/clear) |
| [**index()** - Returns the index of the first matched item](https://www.programiz.com/python-programming/methods/list/index) |
| [**count()** - Returns the count of number of items passed as an argument](https://www.programiz.com/python-programming/methods/list/count) |
| [**sort()** - Sort items in a list in ascending order](https://www.programiz.com/python-programming/methods/list/sort) |
| [**reverse()** - Reverse the order of items in the list](https://www.programiz.com/python-programming/methods/list/reverse) |
| [**copy()** - Returns a shallow copy of the list](https://www.programiz.com/python-programming/methods/list/copy) |



### difference between list and dictionary `in`

The `in` operator uses different algorithms for lists and dictionaries. For lists, it uses a linear search algorithm. As the list gets longer, the search time gets longer in direct proportion to the length of the list. For dictionaries, Python uses an algorithm called a *hash table* that has a remarkable property: the `in` operator takes about the same amount of time no matter how many items there are in a dictionary. 



### Bad Variable names 

`sum`, `max` are built in functions, not good variable names



































