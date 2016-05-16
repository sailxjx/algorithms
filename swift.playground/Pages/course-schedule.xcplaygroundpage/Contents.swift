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

// Reference: https://leetcode.com/discuss/35035/oo-easy-to-read-java-solution
// OO DFS
class Solution {

  class Course {
    var visited = false
    var done = false
    var preCourses = [Course]()

    func addPre(preCourse: Course) {
      preCourses.append(preCourse)
    }
  }

  func isCyclic(course: Course) -> Bool {
    if course.done { return false }
    if course.visited { return true }
    course.visited = true
    if course.preCourses.count > 0 {
      for preCourse in course.preCourses {
        if isCyclic(preCourse) {
          return true
        }
      }
    }
    course.done = true
    return false
  }

  func canFinish(numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var courseList = [Int: Course]()
    for i in 0..<numCourses {
      courseList[i] = Course()
    }
    for couple in prerequisites {
      let c1 = courseList[couple[0]]!
      let c2 = courseList[couple[1]]!
      c1.addPre(c2)
    }
    for i in 0..<numCourses {
      if isCyclic(courseList[i]!) {
        return false
      }
    }
    return true
  }
}
//
Solution().canFinish(1, []) == true
Solution().canFinish(2, [[1,0]]) == true
Solution().canFinish(2, [[1,0],[0,1]]) == false
Solution().canFinish(4, [[0,1],[2,3]]) == true
Solution().canFinish(3, [[1,0]]) == true
Solution().canFinish(4, [[0,1],[3,1],[1,3],[3,2]]) == false
Solution().canFinish(3, [[0,1],[0,2],[1,2]]) == true