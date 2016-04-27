'use strict'
/**
 * @param {string} s
 * @return {string}
 */
module.exports = function (word) {
  const vowels = ['a', 'o', 'e', 'i', 'u']
  let answerArr = new Array(word.length)
  let vowelStack = []

  for (let i in word) {
    let letter = word[i]
    if (vowels.indexOf(letter.toLowerCase()) === -1) {
      answerArr[i] = letter
    } else {
      vowelStack.push(letter)
    }
  }

  for (let i = 0; i < answerArr.length; i += 1) {
    if (answerArr[i] === undefined) {
      answerArr[i] = vowelStack.pop()
    }
    if (vowelStack.length === 0) break
  }

  return answerArr.join('')
}
