function toArabic(roman) {
  if (!isValidRomanNumeral(roman)) throw new Error('Invalid input')
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

module.exports = {
  toArabic: toArabic,
  toRoman: toRoman
}
