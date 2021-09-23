var {WAMessageProto} = require('@adiwajshing/baileys')
levelling = require('../lib/levelling')
const moment = require('moment-timezone')
const jam = moment.tz('Asia/Jakarta').format('HH')
 var ucapanWaktu = 'Selamat Pagi'
				if (jam >= '03' && jam <= '10') {
				ucapanWaktu = 'Selamat Pagi'
				} else if (jam >= '10' && jam <= '13') {
				ucapanWaktu = 'Selamat Siang'
				} else if (jam >= '13' && jam <= '18') {
				ucapanWaktu = 'Selamat Sore'
				} else if (jam >= '18' && jam <= '23') {
				ucapanWaktu = 'Selamat Malam'
				} else {
				ucapanWaktu = 'Selamat Malam'
				} 
let handler = async (m, { conn, text }) => {
try {
imeg = await conn.getProfilePicture(conn.user.jid)
} catch {
imeg = 'https://i.ibb.co/ZWzygtN/bbb2ed6426c6.jpg'
}
 let buttons = [
  {buttonId: '.ngab', buttonText: {displayText: '⋮☰ LIST MENU'}, type: 1},
  {buttonId: '.owner', buttonText: {displayText: '⋮☰ OWNER BOT'}, type: 1},
   {buttonId: '.alive', buttonText: {displayText: '⋮☰ INFO BOT'}, type: 1}
]
const buttonsMessage = {
    contentText: `┈┈┈╱▔▔▔▔▔▔╲┈╭━━━╮┈┈\n┈┈▕┈╭━╮╭━╮┈▏┃BOT.┃┈┈\n┈┈▕┈┃╭╯╰╮┃┈▏╰┳━━╯┈┈\n┈┈▕┈╰╯╭╮╰╯┈▏┈┃┈┈┈┈┈\n┈┈▕┈┈┈┃┃┈┈┈▏━╯┈┈┈┈┈\n┈┈▕┈┈┈╰╯┈┈┈▏┈┈┈┈┈┈┈\n┈┈▕╱╲╱╲╱╲╱╲▏┈┈┈┈┈┈┈
    
Halo ${conn.getName(m.sender)}
Saya Sakura さくら\nSilahkan Klik Tombol Dibawah\nKalo Ada Masalah Bisa Langsung\nHubungi Owner/Bisa Juga Click *OWNER*\n\nJangan Lupa Baca Dibawah ini Yaa😁

VC & CALL BOT = BLOCK
SPAM = BANNED + BLOCK


*💌SUBSCRIBE ME:*
https://tinyurl.com/yjnjpsyv

*💌INSTAGRAM ME:*
https://Instagram.com/assabiq_k

`.trim(),    footerText: 'Created By © BiqqTzy' ,
    buttons: buttons,
  imageMessage: await conn.toMSG({ url: imeg }, 'imageMessage'),
  headerType: 'IMAGE'
}
const sendMsg = await conn.prepareMessageFromContent(m.chat,{buttonsMessage},{ 
quoted: { 
  key: {
  fromMe: false,
  remoteJid: 'status@broadcast',
  participant: '0@s.whatsapp.net'
  },
  message: {
   orderMessage: {
    itemCount: Object.keys(DATABASE.data.users).length, 
thumbnail: await (await require('node-fetch')(imeg)).buffer(),
    message: `${ucapanWaktu} Kak`.trim(),
    orderTitle: 'FakeTroli', // Idk what this does
    orderId: require('crypto').randomBytes(10).toString('hex').toUpperCase(), // Biar Ga ke detect bug troli
    sellerJid: '0@s.whatsapp.net' // Seller
   }
   }} })

conn.relayWAMessage(sendMsg)
}
handler.command = /^(menu)$/i

module.exports = handler

function waktu(seconds) { 
seconds = Number(seconds); 
var d = Math.floor(seconds / (3600 * 24)); 
var h = Math.floor(seconds % (3600 * 24) / 3600); var m = Math.floor(seconds % 3600 / 60); 
var s = Math.floor(seconds % 60); 
var dDisplay = d > 0 ? d + (d == 1 ? " Hari,":" Hari,") : ""; 
var hDisplay = h > 0 ? h + (h == 1 ? " Jam,":" Jam,") : ""; 
var mDisplay = m > 0 ? m + (m == 1 ? " Menit,":" Menit,") : ""; 
var sDisplay = s > 0 ? s + (s == 1 ? " Detik,":" Detik") : ""; 
return dDisplay + hDisplay + mDisplay + sDisplay; 
}