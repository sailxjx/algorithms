/*
 There are a total of n courses you have to take, labeled from 0 to n - 1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

 For example:

 2, [[1,0]]
 There are a total of 2 courses to take. To take course 1 you should have finished course 0. So it is possible.

 2, [[1,0],[0,1]]
 There are a total of 2 courses to take. To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.

 Note:
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 
 Hints:
  1. This problem is equivalent to finding if a cycle exists in a directed graph. If a cycle exists, no topological ordering exists and therefore it will be impossible to take all courses.

  2. Topological Sort via DFS - A great video tutorial (21 minutes) on Coursera explaining the basic concepts of Topological Sort.

  3. Topological sort could also be done via BFS.
*/

class Solution {
  func canFinish(numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    guard prerequisites.count > 0 else { return true }
    var allCourses = [Int: Set<Int>]()
    for (_, coursePair) in prerequisites.enumerate() {
      if allCourses[coursePair[0]] == nil { allCourses[coursePair[0]] = Set([]) }
      if allCourses[coursePair[1]] == nil { allCourses[coursePair[1]] = Set([]) }
      if coursePair.count > 1 {
        allCourses[coursePair[0]] = Set([coursePair[1]])
        // Check deep dependency
        for (course, dependencies) in allCourses {
          if dependencies.contains(coursePair[0]) {
            if coursePair[1] == course {
              // Circular dependency
              return false
            } else {
              allCourses[course]?.insert(coursePair[1])
            }
          }
        }
      }
    }
    return allCourses.count == numCourses
  }
}

Solution().canFinish(1, []) == true
Solution().canFinish(2, [[1,0]]) == true
Solution().canFinish(2, [[1,0],[0,1]]) == false
Solution().canFinish(3, [[1,2],[2,3],[3,1]]) == false
Solution().canFinish(4, [[0,1],[2,3]]) == true