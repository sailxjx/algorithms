'use strict'
require('should')

/**
 * @param {string} s
 * @return {string}
 */
var reverseVowels = function (s) {
  var vowels = ['a', 'o', 'e', 'i', 'u']
  var answerArr = new Array(s.length)
  var vowelStack = []
  var i, letter

  for (i in s) {
    letter = s[i]
    if (vowels.indexOf(letter.toLowerCase()) === -1) {
      answerArr[i] = letter
    } else {
      vowelStack.push(letter)
    }
  }

  for (i = 0; i < answerArr.length; i += 1) {
    if (answerArr[i] === undefined) {
      answerArr[i] = vowelStack.pop()
    }
    if (vowelStack.length === 0) break
  }
  return answerArr.join('')
}

reverseVowels('hello').should.eql('holle')
reverseVowels('leetcode').should.eql('leotcede')
