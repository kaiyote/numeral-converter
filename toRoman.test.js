const test = require('ava')
const {toRoman} = require('./converter')

test('1 -> I', t => {
  t.is(toRoman('1'), 'I')
})

test('3 -> III', t => {
  t.is(toRoman('3'), 'III')
})

test('9 -> IX', t => {
  t.is(toRoman('9'), 'IX')
})

test('1066 -> MLXVI', t => {
  t.is(toRoman('1066'), 'MLXVI')
})

test('1989 -> MCMLXXXIX', t => {
  t.is(toRoman('1989'), 'MCMLXXXIX')
})

test('-1 should throw', t => {
  t.throws(() => toRoman('-1'), 'Invalid input')
})

test('0 -> EmptyString', t => {
  t.is(toRoman('0'), '')
})

test('X should throw', t => {
  t.throws(() => toRoman('X'), 'Invalid input')
})
