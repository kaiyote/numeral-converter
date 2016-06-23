function toArabic(roman) {
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

function formatNumberParts(count, onePart, fivePart, tenPart) {
  switch(count) {
    case 9:
      return onePart + tenPart
    case 8:
    case 7:
    case 6:
    case 5:
      return fivePart + formatNumberParts(count % 5, onePart, fivePart, tenPart)
    case 4:
      return onePart + fivePart
    case 3:
    case 2:
    case 1:
      return onePart.repeat(count)
    default:
      return ''
  }
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

  let partial = 0
  switch (part) {
    case 'IV':
      return 4 + parseRomanNumeral(charList.join(''))
    case 'IX':
      return 9 + parseRomanNumeral(charList.join(''))
    case 'XL':
      return 40 + parseRomanNumeral(charList.join(''))
    case 'XC':
      return 90 + parseRomanNumeral(charList.join(''))
    case 'CD':
      return 400 + parseRomanNumeral(charList.join(''))
    case 'CM':
      return 900 + parseRomanNumeral(charList.join(''))
    case 'I':
      return 1 + parseRomanNumeral(charList.join(''))
    case 'V':
      return 5 + parseRomanNumeral(charList.join(''))
    case 'X':
      return 10 + parseRomanNumeral(charList.join(''))
    case 'L':
      return 50 + parseRomanNumeral(charList.join(''))
    case 'C':
      return 100 + parseRomanNumeral(charList.join(''))
    case 'D':
      return 500 + parseRomanNumeral(charList.join(''))
    case 'M':
      return 1000 + parseRomanNumeral(charList.join(''))
  }
}

module.exports = {
  toArabic: toArabic,
  toRoman: toRoman
}
