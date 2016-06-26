const romanToArabicMap = {
  IV: 4,
  IX: 9,
  XL: 40,
  XC: 90,
  CD: 400,
  CM: 900,
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000
}

function formatNumberParts(count, onePart, fivePart, tenPart) {
  if (count === 9) return onePart + tenPart
  else if (count > 5) return fivePart + formatNumberParts(count - 5, onePart, fivePart, tenPart)
  else if (count === 5) return fivePart
  else if (count === 4) return onePart + fivePart
  else if (count >= 1) return onePart.repeat(count)
  else return ''
}

function isValidRomanNumeral(roman) {
  return !roman.match(/[^MDCLXVI]/ig)
}

function parseRomanNumeral(romanString) {
  let charList = romanString.split('')
  if (charList.length === 0) return 0
  let part = charList.shift()

  if (part == 'I' && ['V', 'X'].includes(charList[0]) ||
      part == 'X' && ['L', 'C'].includes(charList[0]) ||
      part == 'C' && ['D', 'M'].includes(charList[0])) part += charList.shift()

  return romanToArabicMap[part] + parseRomanNumeral(charList.join(''))
}

function toArabic(roman) {
  roman = roman.toUpperCase()
  if (!isValidRomanNumeral(roman)) throw new Error('Invalid input')
  return parseRomanNumeral(roman)
}

function toRoman(arabic) {
  if (arabic.match(/\D/g)) throw new Error('Invalid input')
  let number = +arabic
  let thousands = Math.floor(number / 1000)
  let rem100 = number % 1000
  let hundreds = Math.floor(rem100 / 100)
  let rem10 = rem100 % 100
  let tens = Math.floor(rem10 / 10)
  let ones = rem10 % 10

  return formatNumberParts(thousands, 'M', '', '') +
    formatNumberParts(hundreds, 'C', 'D', 'M') +
    formatNumberParts(tens, 'X', 'L', 'C') +
    formatNumberParts(ones, 'I', 'V', 'X')
}

if (typeof(module) !== 'undefined') module.exports = {
  toArabic: toArabic,
  toRoman: toRoman
}
