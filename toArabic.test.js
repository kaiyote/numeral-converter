const test = require('ava')
const {toArabic} = require('./converter')

test('I -> 1', t => {
  t.is(toArabic('I'), 1)
})

test('III -> 3', t => {
  t.is(toArabic('III'), 3)
})

test('IX -> 9', t => {
  t.is(toArabic('IX'), 9)
})

test('MLXVI -> 1066', t => {
  t.is(toArabic('MLXVI'), 1066)
})

test('MCMLXXXIX -> 1989', t => {
  t.is(toArabic('MCMLXXXIX'), 1989)
})

test('HIPALS should throw', t => {
  t.throws(() => toArabic('HIPALS'), 'Invalid input')
})

test('10 should throw', t => {
  t.throws(() => toArabic('10'), 'Invalid input')
})

test('EmptyString -> 0', t => {
  t.is(toArabic(''), 0)
})
