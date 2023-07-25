# MyHashMap - README

Hey there! I'm excited to share the progress I've made in this project, where I've successfully implemented several fundamental data structures: Sets, Hashmaps, LRU cache, and dynamic arrays. Let me walk you through the key achievements and explain how each phase contributed to our final HashMap implementation.

## Learning Goals

Throughout this project, I focused on achieving the following learning goals:

1. **Hashing Functions:** I've described the characteristics of a good hashing function, ensuring that data is efficiently mapped to a predefined range of values.
2. **Linked Lists:** I've explained how linked lists work and how we can traverse them to efficiently manage data.
3. **Hash Map:** We explored the inner workings of a hash map and how it stores and retrieves data using our custom hashing functions.
4. **LRU Cache:** I even managed to implement an LRU (Least Recently Used) cache using a combination of hash maps and linked lists.

Now, let's see how each phase contributed to our journey.

## Phase 1: IntSet

In the initial phase, I implemented the `IntSet` data structure. This set can store integers falling within a specific predefined range. To achieve this, I utilized an internal array to efficiently keep track of the presence of integers.

## Phase 2: Hashing

Moving on to phase 2, I focused on creating custom hashing functions for `Array`, `String`, and `Hash` data types. These functions are vital in ensuring that data is uniformly and deterministically mapped to their respective hash buckets. I used XOR and other clever techniques to handle arrays and hashes effectively.

## Phase 3: HashSet

In phase 3, I expanded the capabilities of our data structures by implementing a `HashSet`. This versatile set can handle data of any type by utilizing the hashing functions developed earlier. The `HashSet` proved to be highly efficient, handling insertions, updates, and retrievals with ease.

## Phase 4: Linked list

Phase 4 introduced me to linked lists. I built a doubly linked list called `LinkedList`, which stores key-value pairs. The use of sentinel nodes and implementation of essential methods like `append`, `update`, `get`, and `remove` made our linked list a powerful underlying data structure for our hash map.

## Phase 5: Hash Map (reprise)

Finally, in phase 5, I brought everything together to create our fully functional `HashMap`. This was the culmination of our hard work. The `HashMap` can handle different data types efficiently and automatically resizes itself when needed for optimal performance.

## Phase 6: LRU Cache

In the last phase, we tackled the LRU Cache implementation. LRU stands for _Least Recently Used_, and it's a caching strategy that keeps track of the `n` most recently used items. I combined the hash map and linked list to create this powerful caching mechanism. The `LRU Cache` can efficiently store, retrieve, and discard items based on their access patterns, ensuring we maintain the most relevant data.

# Last Phase: Dynamic Arrays

Lastly, I decided to take on the challenge of building Ruby's entire `Array` class from scratch. Dynamic arrays are the backbone of Ruby's convenient and flexible `Array` class, and recreating this functionality was both intriguing and informative. I used the provided `StaticArray` class to implement the dynamic array, ensuring it resizes dynamically as elements are added.

## Super-bonuses

1. **Ring Buffer[Implemented]**: Upgrade your dynamic array to use a [ring buffer][ring-buffer-reading]. This optimization allows for `O(1)` time complexity for `shift` and `unshift` operations while minimizing space usage. This involves complex math, such as modulo division and keeping track of a `@start_idx`, but it's an exciting advancement for your dynamic array.

2. **Retain Insertion Order [Not Implemented]**: Enhance your hash map to retain insertion order. In Ruby versions after 1.9, hashes retain the order in which elements are inserted. To achieve this, you'll need to add an additional data structure. Try to figure out how to accomplish this and test it using the `#each` method to ensure the original order is maintained after reassignments.
