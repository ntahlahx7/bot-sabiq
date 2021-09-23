let fetch = require('node-fetch')
let handler = async (m, { conn, args }) => {
   response = args.join(' ')
  if (!args) throw 'Masukkan Parameter'
  await m.reply('*Sedang Diproses...*')
  let res = `https://api.zeks.xyz/api/bneon?apikey=Ze3af6X1SjJeUebhHUZCsHMeH13&text=${response}`
  conn.sendFile(m.chat, res, 'nama.jpg', `Nih Mhank`, m, false)
}
handler.help = ['neontext'].map(v => v + ' <teks>')
handler.tags = ['sticker']
handler.command = /^(neontext)$/i
handler.limit = true
handler.register = true

module.exports = handler

//31caf10e4a64e86c1a92bcba
