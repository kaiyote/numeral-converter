const repl = require('repl')
const {toArabic, toRoman} = require('./converter')

function convert(cmd, context, filename, callback) {
  try {
    if (cmd.match(/\d/g)) callback(null, toRoman(cmd.trim())) // pesky newline
    else callback(null, toArabic(cmd.trim())) // pesky newline
  } catch (e) {
    callback(e)
  }
}

repl.start({prompt: 'input> ', eval: convert})
