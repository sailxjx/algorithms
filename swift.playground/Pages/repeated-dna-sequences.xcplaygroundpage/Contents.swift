/*
 All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.

 Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.

 For example,

 Given s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT",

 Return:
 ["AAAAACCCCC", "CCCCCAAAAA"].
 */

class Solution {
  func findRepeatedDnaSequences(s: String) -> [String] {
    let sequenceLength = 10
    var meet = Set<String>()
    var repeated = Set<String>()
    guard s.characters.count > sequenceLength else { return [] }
    for i in 0..<s.characters.count - sequenceLength {
      let substring = s.substringWithRange(Range<String.Index>(s.startIndex.advancedBy(i)..<s.startIndex.advancedBy(i+sequenceLength)))
      if meet.indexOf(substring) != nil {
        repeated.insert(substring)
      }
      meet.insert(substring)
    }
    let result = Array(repeated)
    return result
  }
}

Solution().findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT") == ["AAAAACCCCC", "CCCCCAAAAA"]
Solution().findRepeatedDnaSequences("ACACACACACACACA") == ["ACACACACAC","CACACACACA"]