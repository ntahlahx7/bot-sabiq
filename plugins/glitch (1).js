	let handler = async (m, { conn, args, usedPrefix ,command}) => {
	await m.reply('*Sedang Diproses...*')
	let fetch = require('node-fetch')
	let fs = require('fs')
	 if (args.length == 0) throw `\nContoh : \n\n*${usedPrefix}${command} Sakura*\n`
	   let tek = args.join(" ")
          sr1 = tek.split('.')[0]
          sr2 = tek.split('.')[1]
    let res = await fetch(`https://srart24-api.herokuapp.com/api/textmaker?text=${sr1}&text2=${sr2}&theme=glitch&apikey=srart24`)
    let json = await res.json()
    let gg = await json.result
    cap = `*Nih Kakk >_<*`.trim()
    conn.sendFile(m.chat, gg.url, 'image.jpg', cap, m, false, {
   thumbnail: fs.readFileSync('./src/p.jpg')
})
      }
  handler.help = ['glitch']
  handler.tags = ['maker']
  handler.command = /^glitch/i
  
  module.exports = handler