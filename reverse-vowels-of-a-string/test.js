'use strict'

require('should')

const solution = require('./solution')

solution('hello').should.eql('holle')
solution('leetcode').should.eql('leotcede')
