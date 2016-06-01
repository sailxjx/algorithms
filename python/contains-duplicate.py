# Given an array of integers, find if the array contains any duplicates.
# Your function should return true if any value appears at least twice in the array,
# and it should return false if every element is distinct.
#

class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        numsSet = set(nums)
        return len(numsSet) != len(nums)

if not Solution().containsDuplicate([1,2,3]) == False: raise Exception()
if not Solution().containsDuplicate([1,2,2]) == True: raise Exception()
