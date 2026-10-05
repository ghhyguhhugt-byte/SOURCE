function rdood(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Gold.."Gold:Name:Bot") or "بووت") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
local msg_chat_id = msg.chat_id
local msg_id = msg.id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
if tonumber(msg.sender_id.user_id) == tonumber(Gold) then
return false
end
if text then
local neww = Redis:get(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Gold.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end
-----------------
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Gold.."Gold:Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id.."")
if Redis:get(Gold.."Gold:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(Gold.."Gold:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then
Redis:set(Gold.."Gold:Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then
if msg.content.caption.text then
Redis:set(Gold.."Gold:Add:Rd:caption:vico"..msg.content.voice_note.voice.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Gold.."Gold:Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if text then
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Gold.."Gold:Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
if msg.content.caption.text then
Redis:set(Gold.."Gold:Add:Rd:caption:audio"..msg.content.audio.audio.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Gold.."Gold:Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
if msg.content.caption.text then
Redis:set(Gold.."Gold:Add:Rd:caption:document"..msg.content.document.document.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Gold.."Gold:Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
if msg.content.caption.text then
Redis:set(Gold.."Gold:Add:Rd:caption:gif"..msg.content.animation.animation.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Gold.."Gold:Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(Gold.."Gold:Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
if msg.content.caption.text then
Redis:set(Gold.."Gold:Add:Rd:caption:video"..msg.content.video.video.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Gold.."Gold:Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if msg.content.caption.text then
Redis:set(Gold.."Gold:Add:Rd:caption:Photo"..idPhoto..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Gold.."Gold:Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return send(msg_chat_id,msg_id,"*「  *"..test.."*  」\nواضفنا الرد ياحلو 🌚\n✓*","md",true)
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Gold.."Gold:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(Gold.."Gold:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
Redis:set(Gold.."Gold:Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:del(Gold.."Gold:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Gold.."Gold:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Gold.."Gold:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Gold.."Gold:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Gold.."Gold:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(Gold.."Gold:List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
*⇜ حلو , الحين ارسل جواب الرد*
*⇜ ( نص,صوره,فيديو,متحركه,بصمه,اغنيه )*
ٴ*⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆*
 `{اليوزر}` *↬ يوزر المستخدم*
 `{الرسائل}` *↬ عدد الرسائل*
 `{الاسم}` *↬ اسم المستخدم*
 `{الايدي}` *↬ ايدي المستخدم*
 `{الرتبه}` *↬ رتبة المستخدم*
 `{التعديل}` *↬ عدد التعديلات*

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Gold.."Gold:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(Gold.."Gold:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Gold.."Gold:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Gold.."Gold:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Gold.."Gold:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Gold.."Gold:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(Gold.."Gold:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Gold.."Gold:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Gold.."Gold:List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"*⇜ ابشر .. مسحت الـرد مـن الـردود ✅*","md",true)  
return false
end
end
-----------------
if text and msg.reply_to_message_id == 0 and Redis:get(Gold.."Gold:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(Gold.."Gold:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(Gold.."Gold:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(Gold.."Gold:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(Gold.."Gold:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(Gold.."Gold:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(Gold.."Gold:Add:Rd:Sudo:Video"..text)
local document = Redis:get(Gold.."Gold:Add:Rd:Sudo:File"..text)
local audio = Redis:get(Gold.."Gold:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(Gold.."Gold:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Gold..'Gold:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Gold..'Gold:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Text = Text:gsub('{اليوزر}',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('{الاسم}',UserInfo.first_name)
local Text = Text:gsub('{الايدي}',msg.sender_id.user_id)
local Text = Text:gsub('{التعديل}',NumMessageEdit)
local Text = Text:gsub('{الرسائل}',NumMsg)
local Text = Text:gsub('{الرتبه}',Status_Gps)
if Text:match("]") then
return send(msg_chat_id,msg_id,""..Text.."","md",true)  
else
return send(msg_chat_id,msg_id,"["..Text.."]","md",true)  
end
end
if video_note then
return bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:Photo"..photo) or ''
return bot.sendPhoto(msg.chat_id, msg.id, photo,'['..captionsend..']',"md")
end
if stekr then 
return bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:vico"..veico) or ''
return bot.sendVoiceNote(msg_chat_id, msg.id, veico, '['..captionsend..']',"md")
end
if video then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:video"..video) or ''
return bot.sendVideo(msg_chat_id, msg.id, video, '['..captionsend..']', "md")
end
if anemi then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:gif"..anemi) or ''
return bot.sendAnimation(msg_chat_id, msg.id, anemi, '['..captionsend..']', "md")
end
if document then
return bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:audio"..audio) or ''
return bot.sendAudio(msg_chat_id, msg.id, audio, '['..captionsend..']',"md")
end
end
if text and msg.reply_to_message_id ~= 0 and Redis:get(Gold.."Gold:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(Gold.."Gold:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(Gold.."Gold:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(Gold.."Gold:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(Gold.."Gold:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(Gold.."Gold:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(Gold.."Gold:Add:Rd:Sudo:Video"..text)
local document = Redis:get(Gold.."Gold:Add:Rd:Sudo:File"..text)
local audio = Redis:get(Gold.."Gold:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(Gold.."Gold:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Gold..'Gold:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Gold..'Gold:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Text = Text:gsub('{اليوزر}',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('{الاسم}',UserInfo.first_name)
local Text = Text:gsub('{الايدي}',msg.sender_id.user_id)
local Text = Text:gsub('{التعديل}',NumMessageEdit)
local Text = Text:gsub('{الرسائل}',NumMsg)
local Text = Text:gsub('{الرتبه}',Status_Gps)
if Text:match("]") then
return send(msg_chat_id,msg_reply_id,""..Text.."","md",true)  
else
return send(msg_chat_id,msg_reply_id,"["..Text.."]","md",true)  
end
end
if video_note then
return bot.sendVideoNote(msg_chat_id, msg_reply_id, video_note)
end
if photo then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:Photo"..photo) or ''
return bot.sendPhoto(msg.chat_id, msg_reply_id, photo,'['..captionsend..']',"md")
end
if stekr then 
return bot.sendSticker(msg_chat_id, msg_reply_id, stekr)
end
if veico then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:vico"..veico) or ''
return bot.sendVoiceNote(msg_chat_id, msg_reply_id, veico, '['..captionsend..']',"md")
end
if video then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:video"..video) or ''
return bot.sendVideo(msg_chat_id, msg_reply_id, video, '['..captionsend..']', "md")
end
if anemi then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:gif"..anemi) or ''
return bot.sendAnimation(msg_chat_id, msg_reply_id, anemi, '['..captionsend..']', "md")
end
if document then
return bot.sendDocument(msg_chat_id, msg_reply_id, document, '', 'md')
end  
if audio then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:audio"..audio) or ''
return bot.sendAudio(msg_chat_id, msg_reply_id, audio, '['..captionsend..']',"md")
end
end
---- ردود العادية ----
if text and msg.reply_to_message_id == 0 and Redis:get(Gold.."Gold:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(Gold.."Gold:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(Gold.."Gold:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(Gold.."Gold:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(Gold.."Gold:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(Gold.."Gold:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(Gold.."Gold:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(Gold.."Gold:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(Gold.."Gold:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(Gold.."Gold:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Gold..'Gold:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Gold..'Gold:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('{اليوزر}',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('{الاسم}',UserInfo.first_name)
local Texingt = Texingt:gsub('{الايدي}',msg.sender_id.user_id)
local Texingt = Texingt:gsub('{التعديل}',NumMessageEdit)
local Texingt = Texingt:gsub('{الرسائل}',NumMsg)
local Texingt = Texingt:gsub('{الرتبه}',Status_Gps)
if Texingt:match("]") then
return send(msg_chat_id,msg_id,""..Texingt.."","md",true)  
else
return send(msg_chat_id,msg_id,"["..Texingt.."]","md",true)  
end
end
if video_note then
return bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:Photo"..photo..msg_chat_id) or ''
return bot.sendPhoto(msg.chat_id, msg.id, photo,'['..captionsend..']',"md")
end  
if stekr then 
return bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:vico"..veico..msg_chat_id) or ''
return bot.sendVoiceNote(msg_chat_id, msg.id, veico, '['..captionsend..']',"md")
end
if video then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:video"..video..msg_chat_id) or ''
return bot.sendVideo(msg_chat_id, msg.id, video, '['..captionsend..']', "md")
end
if anemi then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:gif"..anemi..msg_chat_id) or ''
return bot.sendAnimation(msg_chat_id, msg.id, anemi, '['..captionsend..']', "md")
end
if document then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:document"..document..msg_chat_id) or ''
return bot.sendDocument(msg_chat_id, msg.id, document, '['..captionsend..']', 'md')
end  
if audio then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:audio"..audio..msg_chat_id) or ''
return bot.sendAudio(msg_chat_id, msg.id, audio, '['..captionsend..']',"md")
end
end
if text and msg.reply_to_message_id ~= 0 and Redis:get(Gold.."Gold:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(Gold.."Gold:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(Gold.."Gold:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(Gold.."Gold:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(Gold.."Gold:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(Gold.."Gold:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(Gold.."Gold:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(Gold.."Gold:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(Gold.."Gold:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(Gold.."Gold:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Gold..'Gold:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Gold..'Gold:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('{اليوزر}',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('{الاسم}',UserInfo.first_name)
local Texingt = Texingt:gsub('{الايدي}',msg.sender_id.user_id)
local Texingt = Texingt:gsub('{التعديل}',NumMessageEdit)
local Texingt = Texingt:gsub('{الرسائل}',NumMsg)
local Texingt = Texingt:gsub('{الرتبه}',Status_Gps)
if Texingt:match("]") then
return send(msg_chat_id,msg_reply_id,""..Texingt.."","md",true)  
else
return send(msg_chat_id,msg_reply_id,"["..Texingt.."]","md",true)  
end
end
if video_note then
return bot.sendVideoNote(msg_chat_id, msg_reply_id, video_note)
end
if photo then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:Photo"..photo..msg_chat_id) or ''
return bot.sendPhoto(msg.chat_id, msg_reply_id, photo,'['..captionsend..']',"md")
end  
if stekr then 
return bot.sendSticker(msg_chat_id, msg_reply_id, stekr)
end
if veico then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:vico"..veico..msg_chat_id) or ''
return bot.sendVoiceNote(msg_chat_id, msg_reply_id, veico, '['..captionsend..']',"md")
end
if video then 
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:video"..video..msg_chat_id) or ''
return bot.sendVideo(msg_chat_id, msg_reply_id, video, '['..captionsend..']', "md")
end
if anemi then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:gif"..anemi..msg_chat_id) or ''
return bot.sendAnimation(msg_chat_id, msg_reply_id, anemi, '['..captionsend..']', "md")
end
if document then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:document"..document..msg_chat_id) or ''
return bot.sendDocument(msg_chat_id, msg_reply_id, document, '['..captionsend..']', 'md')
end  
if audio then
local captionsend = Redis:get(Gold.."Gold:Add:Rd:caption:audio"..audio..msg_chat_id) or ''
return bot.sendAudio(msg_chat_id, msg_reply_id, audio, '['..captionsend..']',"md")
end
end
-----------------
if Redis:get(Gold..'Gold:Gold:egibtt'..msg.chat_id) then
if text == 'هاي' or text == 'هيي' then
return send(msg.chat_id,msg_id,'*خالتك جرت ورايا 😹💔*',"md",true) 
end
if text == 'سلام عليكم' or text == 'السلام عليكم' or text == 'سلام عليكو' then
return send(msg.chat_id,msg_id,'*وعليكم السلام 🌝💜*',"md",true) 
end
if text == 'سلام' or text == 'مع سلامه' then
return send(msg.chat_id,msg_id,'*مع الف سلامه يقلبي متجيش تاني 😹💔🎶*',"md",true) 
end
if text == 'برايفت' or text == 'تع برايفت' then
return send(msg.chat_id,msg_id,'*خدوني معاكو برايفت والنبي 🥺💔*',"md",true) 
end
if text == 'النبي' or text == 'صلي علي النبي' then
return send(msg.chat_id,msg_id,'*عليه الصلاه والسلام 🌝💛*',"md",true) 
end
if text == 'نعم' or text == 'يا نعم' then
return send(msg.chat_id,msg_id,'*نعم الله عليك 🌚❤️*',"md",true) 
end
if text == '🙄' or text == '🙄🙄' then
return send(msg.chat_id,msg_id,'* نزل عينك تحت كدا علشان هتخاد على قفاك 😒❤️*',"md",true) 
end
if text == '🙄' or text == '🙄🙄' then
return send(msg.chat_id,msg_id,'*نزل عينك تحت كدا علشان هتخاد على قفاك 😒❤️*',"md",true) 
end
if text == '😂' or text == '😂😂' then
return send(msg.chat_id,msg_id,'*ضحكتك عثل زيكك ينوحيي 🌝❤️*',"md",true) 
end
if text == '😹' or text == '😹😹' then
return send(msg.chat_id,msg_id,'*ضحكتك عثل زيكك ينوحيي 🍯❤️*',"md",true) 
end
if text == '🤔' or text == '🤔🤔' then
return send(msg.chat_id,msg_id,'* بتفكر في اي 🤔*',"md",true) 
end
if text == '🌚' or text == '🌝' or text == '🌚🌚' or text == '🌝🌝' then
return send(msg.chat_id,msg_id,'*القمر ده شبهك 🙂❤️*',"md",true) 
end
if text == '💋' or text == '💋💋' then
return send(msg.chat_id,msg_id,'*انا عايز مح انا كمان 🥺💔*',"md",true) 
end
if text == '😭' or text == '😭😭' then
return send(msg.chat_id,msg_id,'*بتعيط تيب لي طيب 😥*',"md",true) 
end
if text == '🥺' or text == '🥺🥺' then
return send(msg.chat_id,msg_id,'*متزعلش بحبك 😻🤍*',"md",true) 
end
if text == '😒' or text == '😒😒' then
return send(msg.chat_id,msg_id,'*عدل وشك ونت بتكلمني 😒🙄*',"md",true) 
end
if text == 'بحبك' or text == 'حبق' then
return send(msg.chat_id,msg_id,'*وانا كمان بعشقك يا روحي 🤗🥰*',"md",true) 
end
if text == 'مح' or text == 'هات مح' then
return send(msg.chat_id,msg_id,'*محات حياتي يروحي 🌝❤️*',"md",true) 
end
if text == 'هلا' or text == 'هلا وغلا' then
return send(msg.chat_id,msg_id,'*هلا بيك ياروحي 👋*',"md",true) 
end
if text == 'هشش' or text == 'هششخرص' then
return send(msg.chat_id,msg_id,'*بنهش كتاكيت احنا هنا ولا اي 🐣😹*',"md",true) 
end
if text == 'الحمد الله' or text == 'بخير الحمد الله' then
return send(msg.chat_id,msg_id,'*دايما ياحبيبي 🌝❤️*',"md",true) 
end
if text == 'بف' or text == 'بص بف' then
return send(msg.chat_id,msg_id,'*وحيات امك ياكبتن خدوني معاكو بيف 🥺💔*',"md",true) 
end
if text == 'خاص' or text == 'بص خاص' then
return send(msg.chat_id,msg_id,'*ونجيب اشخاص 😂👻*',"md",true) 
end
if text == 'صباح الخير' or text == 'مساء الخير' then
return send(msg.chat_id,msg_id,'*انت الخير يعمري 🌝❤️*',"md",true) 
end
if text == 'صباح النور' or text == 'باح الخير' then
return send(msg.chat_id,msg_id,'*صباح العسل 😻🤍*',"md",true) 
end
if text == 'حصل' or text == 'حثل' then
return send(msg.chat_id,msg_id,'*خخخ امال 😹*',"md",true) 
end
if text == 'اه' or text == 'اها' then
return send(msg.chat_id,msg_id,'*اه اي يا قدع عيب 😹💔*',"md",true) 
end
if text == 'كسم' or text == 'كسمك' then
return send(msg.chat_id,msg_id,'*عيب ياوصخ 🙄👞*',"md",true) 
end
if text == 'بوتي' or text == 'يا بوتي' then
return send(msg.chat_id,msg_id,'*يـاروح وعقـل بـوتك 🥂💞*',"md",true) 
end
if text == 'متيجي' or text == 'تع' then
return send(msg.chat_id,msg_id,'*لا عيب بتكسف 😹💔*',"md",true) 
end
if text == 'هيح' or text == 'لسه صاحي' then
return send(msg.chat_id,msg_id,'*صح النوم 😹💔*',"md",true) 
end
if text == 'منور' or text == 'نورت' then
return send(msg.chat_id,msg_id,'*ده نورك ي قلبي 🌝💙*',"md",true) 
end
if text == 'باي' or text == 'انا ماشي' then
return send(msg.chat_id,msg_id,'*ع فين لوين رايح وسايبنى 🥺💔*',"md",true) 
end
if text == 'ويت' or text == 'ويت يحب' then
return send(msg.chat_id,msg_id,'*اي الثقافه دي 😒😹*',"md",true) 
end
if text == 'خخخ' or text == 'خخخخخ' then
return send(msg.chat_id,msg_id,'*اهدا يوحش ميصحش كدا 😒😹*',"md",true) 
end
if text == 'شكرا' or text == 'مرسي' then
return send(msg.chat_id,msg_id,'*العفو ياروحي 🙈🌝*',"md",true) 
end
if text == 'حلوه' or text == 'حلو' then
return send(msg.chat_id,msg_id,'*انت الي حلو ياقمر 🤤🌝*',"md",true) 
end
if text == 'بموت' or text == 'هموت' then
return send(msg.chat_id,msg_id,'*موت بعيد م ناقصين مصايب 😑😂*',"md",true) 
end
if text == 'اي' or text == 'ايه' then
return send(msg.chat_id,msg_id,'*جتك اوهه م سامع ولا ايي 😹👻*',"md",true) 
end
if text == 'طيب' or text == 'تيب' then
return send(msg.chat_id,msg_id,'*فرح خالتك قريب 😹💋💃🏻*',"md",true) 
end
if text == 'حاضر' or text == 'حتر' then
return send(msg.chat_id,msg_id,'*حضرلك الخير يارب 🙂❤️*',"md",true) 
end
if text == 'جيت' or text == 'انا جيت' then
return send(msg.chat_id,msg_id,'* لف ورجع تانى مشحوار 😂🚶‍♂👻*',"md",true) 
end
if text == 'بخ' or text == 'عو' then
return send(msg.chat_id,msg_id,'*يوه خضتني ياسمك اي 🥺💔*',"md",true) 
end
if text == 'حبيبي' or text == 'حبيبتي' then
return send(msg.chat_id,msg_id,'*اوه ياه 🌝😂*',"md",true) 
end
if text == 'تمام' or text == 'تمم' then
return send(msg.chat_id,msg_id,'* امك اسمها احلام 😹😹*',"md",true) 
end
if text == 'خلاص' or text == 'خلص' then
return send(msg.chat_id,msg_id,'*خلصتت روحكك يبعيد 😹💔*',"md",true) 
end
if text == 'سي في' or text == 'سيفي' then
return send(msg.chat_id,msg_id,'*كفيه شقط سيب حاجه لغيرك 😎😂*',"md",true) 
end
end
if Redis:get(Gold..'Gold:Gold:iraqq'..msg.chat_id) then
if text == '🙄' or text == '🙄🙄' then
return send(msg.chat_id,msg_id,'* نـزل عينـك لتنحول 😒❤️*',"md",true) 
end
if text == '🙂' or text == '🙂🙂' or text == '🙂🙂.' or text == '🙂🙂🙂' or text == '🙂🙂🙂🙂' then
return send(msg.chat_id,msg_id,'*عـود ثكيـل انتـه ؟! 🙂🙂*',"md",true) 
end
if text == '😐' or text == '😐😐' or text == '😐😐😐' or text == '😐😐😐😐' then
return send(msg.chat_id,msg_id,'*شبيـك صـافن حبـي 😐*',"md",true) 
end
if text == '😌' or text == '😌😌' or text == '😌😌😌' or text == '😌😌😌😌' then
return send(msg.chat_id,msg_id,'*ع شنو شايف روحك وجه الطاوه ؟!*',"md",true) 
end
if text == '😇' or text == '😇😇' or text == '😇😇😇' or text == '😇😇😇😇' then
return send(msg.chat_id,msg_id,'*اته مو ملاك اته جهنم بنفسهه 😂🔥*',"md",true) 
end
if text == '🤔' or text == '🤔🤔' then
return send(msg.chat_id,msg_id,'* سمعـو انشتـاين 🤔*',"md",true) 
end
if text == '🌚' or text == '🌝' or text == '🌚🌚' or text == '🌝??' then
return send(msg.chat_id,msg_id,'*وجهـك مـايبشـر بخيـر ✋🏻🙂❤️*',"md",true) 
end
if text == '💋' or text == '💋💋' then
return send(msg.chat_id,msg_id,'*مِـٰمْحِـح 😐🍓℡ᴖ̈*',"md",true) 
end
if text == '😭' or text == '😭😭' or text == '😭😭😭' or text == '😭😭😭😭' then
return send(msg.chat_id,msg_id,'* انطيـك منـاديل 🧻😐℡ᴖ̈*',"md",true) 
end
if text == '😒' or text == '😒😒' then
return send(msg.chat_id,msg_id,'*شبيڪ ؏ـمو🤞🏻😕*',"md",true) 
end
if text == "😂" or text == "😂😂" or text == "😂😂😂" or text == "😂😂😂😂" or text == "😹😹😹😹" or text == "😹😹😹" or text == "😹😹" or text == "😹" then
return send(msg.chat_id,msg_id,'*ڪياتـه الضحكه 😫😹*',"md",true) 
end
if text == 'احبك' or text == 'حبك' then
return send(msg.chat_id,msg_id,'*اموتبيڪ 😭😹💗*',"md",true) 
end
if text == 'مح' or text == 'محه' or text == 'محح' then
return send(msg.chat_id,msg_id,'*🥺😭😹💗 محح*',"md",true) 
end
if text == 'هاي' then
return send(msg.chat_id,msg_id,'*هاياتہ يبـ؏ـد حيليہ*',"md",true) 
end
if text == 'هلا' or text == 'هلا وغلا' then
return send(msg.chat_id,msg_id,'*هلا بيك  يروحـي 👋*',"md",true) 
end
if text == 'وين' then
return send(msg.chat_id,msg_id,'*ع البحـرين 😹👨‍🦯*',"md",true) 
end
if text == 'الحمد الله' or text == 'تمام وانته' or text == 'الحمدلله وانته' or text == 'الحمدلله' or text == 'حمدلله' then
return send(msg.chat_id,msg_id,'*عسـاهـا دووم حبي 🌝❤️*',"md",true) 
end
if text == 'صباح الخير' or text == 'مساء الخير' then
return send(msg.chat_id,msg_id,'*انتـه الخيـر يعمـري 🌝❤️*',"md",true) 
end
if text == 'صباح النور' or text == 'باح الخير' then
return send(msg.chat_id,msg_id,'*صباح العسل 😻🤍*',"md",true) 
end
if text == 'كسك' or text == 'كسمك' or text == 'كسي' then
return send(msg.chat_id,msg_id,'*عيب ياوصخ 🙄👞*',"md",true) 
end
if text == 'شكرا' or text == 'مرسي' then
return send(msg.chat_id,msg_id,'*العفو  يروحـي 🙈🌝*',"md",true) 
end
if text == 'حلوه' or text == 'حلو' then
return send(msg.chat_id,msg_id,'*انتـه الاحلـه 🌝💞*',"md",true) 
end
if text == 'همتت' or text == 'متت' then
return send(msg.chat_id,msg_id,'*موت بعيد م ناقصين مصايب 😑😂*',"md",true) 
end
if text == 'جيت' or text == 'انا جيت' then
return send(msg.chat_id,msg_id,'*ياهـله وسهـله 🌝💞*',"md",true) 
end
if text == 'حبيبي' or text == 'حبيبتي' then
return send(msg.chat_id,msg_id,'*عمـري انتـه 🌝💞*',"md",true) 
end
if text == "مسا الخير" or text== "مساء الخير" then
return send(msg.chat_id,msg_id,'*م ـساء ﺎُݪوࢪد 🥳💞*',"md",true) 
end
if text == "شسمج" then
return send(msg.chat_id,msg_id,'*اسمها سعديه 🥳😹💞*',"md",true) 
end
if text == "شسمك" then
return send(msg.chat_id,msg_id,'*اسمهہ جبار 😭😹💞*',"md",true) 
end
if text == "احبج" then
return send(msg.chat_id,msg_id,'*جذاب زاحف ؏ـلى نص الڪـࢪۅبہ 🙂😹💞*',"md",true) 
end
if text == "شوف" then
return send(msg.chat_id,msg_id,'*يلاا مو نحولت 😒😹💞*',"md",true) 
end
if text == "نايمين" then
return send(msg.chat_id,msg_id,'*شتࢪيد منهم منايمين امس 🙂😹💞*',"md",true) 
end
if text == "دكافي" then
return send(msg.chat_id,msg_id,'*سد حلكهم واحد واحد 🙂😹💞*',"md",true) 
end
if text == "كافي لغوه" then
return send(msg.chat_id,msg_id,'*سد حلكهم واحد واحد 🙂😹💞*',"md",true) 
end
if text == "غلس" then
return send(msg.chat_id,msg_id,'*اجـاني فضـوݪ اهمسݪـيہ 🥺😹💞*',"md",true) 
end
if text == "اوف" then
return send(msg.chat_id,msg_id,'*؏َـيب وليدي 🙂😹💞*',"md",true) 
end
if text == "انت منو" then
return send(msg.chat_id,msg_id,'*انيـہ حاميكم 😒😹💞*',"md",true) 
end
if text == "منو يمسح رسايلي" then
return send(msg.chat_id,msg_id,'*شوف ﺎُݪاحداث مطي ☹️😹💞*',"md",true) 
end
if text == "السلام عليكم" or text == "سلام عليكم" or text == "سلامن عليكم" then
return send(msg.chat_id,msg_id,'*و؏ـليڪم الـسلامہ💓*',"md",true) 
end
if text == "شلونك" or text == "شونك" or text == "شلونج" or text == "شونج" or text == "شونكم" then
return send(msg.chat_id,msg_id,'*بخيࢪ وانتہ. يࢪﯡפــيہ 😭💗*',"md",true) 
end
if text == "بوسيني" then
return send(msg.chat_id,msg_id,'*؏َـيب وليدي 🙂😹💞*',"md",true) 
end
if text == "بوسني" then
return send(msg.chat_id,msg_id,'*مابوس استحي 😹🥳💗*',"md",true) 
end
if text == "هلو" or text == "هلاو" then
return send(msg.chat_id,msg_id,'*💗🥳ۿلاﯡات يحلـﯡ *',"md",true) 
end
if text == "شنو هذا بوت" or text == "هذا بوت" then
local GoldTeaM = {"*خوشہ مـ؏ـلومهہ 😹✌🏻*","*آييہ උـبي اني بوتہ✌🏻🥳*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "باي" or text == "رايح" then
local GoldTeaM = {"*باياتہ උـبيہ💞*","*حنشتاقلڪ ؏ـمࢪي 💓🥺*","*ويـטּ ࢪايـح خلينهہ متونسيـטּ💘☹️*","*بـ؏ـد وڪتہ ويـטּ 😕♥️*","*ࢦطوࢦ نشتاقلڪ 🍫*","*باياتہ උـبيبيہ 🖤*","*ويـטּ ࢪايـح تزحفہ 😹✌🏻*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "جاو" or text == "ججاو" or text == "جكاو" or text == "تشاو" then
local GoldTeaM = {"*جــاواتـہ උـياتيہ 🖤*","*حنشتاقلڪ ؏ـمـࢪي 🥺💓*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "نورت" or text == "منور" or text == "منوره" or text == "نورتي" then
local GoldTeaM = {"*بنوࢪڪ يࢪﯡحــيہ 😭💗🥳*","*نـوࢪ ؏ـيونڪ 🥳😹💗*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "خالتك" or text == "خالتج" then
local GoldTeaM = {"*شبيهہ الشڪࢪهہ ازوجها 😹🥳*","*شࢪايد مِہטּ خالتهہ غيࢪ للبوسہ 😹💔*","*خالتهہ تفلشہ بغمزهہ تسويہ بيڪ سوايهہ 🥵😹🥺*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "تف" or text == "تفف" then
local GoldTeaM = {"*؏ـليڪ 🙂🤙🏻*","*وصخہ شتࢪجهہ منڪ 🥵✌🏻*","*تفہ بنصہ وجهڪ 🥵😹*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "🌝" or text == "🌝🌝" then
local GoldTeaM = {"*طالـ؏ صاڪ شنيہ💓🌝*","*منـوࢪ උـياتيہ♥️🌝*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "تحبني" then
local GoldTeaM = {"*احبڪ حب ؏ـبادهہ مِہטּ البصࢪا للڪࢪادهہ 🤤💓*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "جوعان" or text == "جوعانه" or text == "جعت" then
local GoldTeaM = {"*تࢪيد اسويلڪ اڪل مثلا🙂😹*","*آييہ ࢪوح اڪل انيشـ؏ـليهہ 🥵😹*","*تـ؏ـاࢦ اڪلنيہ 😭😹*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "ههه" or text == "هههه" or text == "ههههههه" then
local GoldTeaM = {"*ڪياتـه الضحكه 😫😹💞*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "اكلك" or text == "اكلج" then
local GoldTeaM = {"*ڪوࢦ උـياتيہ 🌚*","*ڪوليہ ماڪول لحد🌝*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "شبيك" or text == "شبيج" then
local GoldTeaM = {"*ڪـلـشييہ ما بيـهہ💘*","*ما بـيهہ شـٰيہ🤷💘*‌‎","*بــيهہ اَنــتهہ🤤💘*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "فديتك" or text == "فديتج" then
local GoldTeaM = {"*احح آييہ  فديتني 😫😹💞*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "ميتين" or text == "وينكم" then
local GoldTeaM = {"*طﺎُمسين تـ؏ فدشوي 🙂😹💞*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "انجب" or text == "نجب" then
local GoldTeaM = {"*صـاࢪ උـبيہ🙂🤞🏻*","*انجبہ انتہ لاتندفࢪ😏🤙🏻*","*انجـبہ انـتهہ🔪*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "كفو" then
local GoldTeaM = {"*ڪفو منـہ. شاربك 🥳😹💞*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "حاره" then
local GoldTeaM = {"*ايـي وﺎﻟلهۂَ ݪمنشئ ميشغل مبرده 👍💔*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
if text == "المدرسه" then
local GoldTeaM = {"*خࢪب ام ﺎُݪمدرسه 🙂👍💔💔💔*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md")
return false
end
end
if Redis:get(Gold..'Gold:Gold:yemenn'..msg.chat_id) then
if text == "السلام عليكم" or text == "سلام عليكم" or text == "هلو" or text == "هلاو" or text == "سلام" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*و؏ـليڪم السـلامـہ .. اررحــب اخـي*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🌚💗"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "كيفك" or text == "كيفكم" or text == "اخبارك" or text == "اخباركم" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*بخير دامك بخير يامالي*  ["..ban.first_name.."](tg://user?id="..ban.id..")  😇💞"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "صباح الخير" or text == "صباحو" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*صباحك قشطه وبسكويت ابو ولد*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🍫🍩"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "جدتمك" or text == "خالتمك" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*جدتمك السمراء يـا*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🌚🖤"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "نورت" or text == "منور" or text == "منوره" or text == "نورتي" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*نورت وشعشعت الجروب يامالي*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🌚💞" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "وين" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*هانك بالزوه بيتفرج علينا*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🙂💔" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "هذا بوت" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*مشنا بوت ياجلف*  ["..ban.first_name.."](tg://user?id="..ban.id..")  😒💔" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "اليمن" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*ع راسنـا انـت و اليمـن يـا*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🇾🇪😇💗" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "تعبت" or text == "تعب" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*يووو جعلي مكسر عليك يـا*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🥺☁️" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "تف" or text == "تفف" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*ادهن بها وجهك ساع البلسم واشتحط يـا*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🌚💞" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "ههه" or text == "هههه" or text == "ههههههه" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*يووو محـلا تيه الضحكـه تزيـغ العقـل*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🙊♥️" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "😂" or text == "😂😂" or text == "😂😂😂" or text == "😂😂😂😂" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*يووو محـلا تيه الضحكـه تزيـغ العقـل*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🙊♥️" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "😹" or text == "😹😹" or text == "😹😹😹" or text == "😹😹😹😹" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*يووو محـلا تيه الضحكـه تزيـغ العقـل*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🙊♥️" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "احسن" or text == "حالي" then
local GoldTeaM =   {"*يووووو و الحلا 🙊♥️*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "هيا" then
local GoldTeaM =   {"*اينه نسير كلنا معاكم 🌚♥️*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "🌚" or text == "🌚🌚" then
local GoldTeaM =   {"*ماجرا لوجهك كذيه قدو ساع الفحمه 🙁*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "🌝" or text == "🌝🌝" then
local GoldTeaM =   {"*ماشـاء الله عليـك بكـرت تدهـون بهـرد 🌚💔*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "جاوع" or text == "جاوعه" or text == "انا جاوع" then
local GoldTeaM =   {"*تعرف اين المطبخ او اوريك الطريق🌚😹.*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "اقلك" or text == "اقلكم" then
local GoldTeaM =   {"*ايوه مابه اقطب عرق الفضول اشتغل ☹️🥺.*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "مالك" or text == "مالكم" or text == "مالها" or text == "ماله" then
local GoldTeaM =   {"*مالي مصلي على النبي باقي انت صلي عليه 😴😂*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "فديتك" or text == "انا فدالك" or text == "انا فدالكم" then
local GoldTeaM =   {"*يووو ياربي والرقه تاثرت🌝❤.*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "احبك" or text == "احبكم" then
local GoldTeaM =   {"*ياجعلني شقليطه 🌚🍫*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == ".." or text == "..." then
local GoldTeaM =   {"*خوات ولا بنات عم 🌚💔*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "اصاه" or text == "اص" then
local GoldTeaM =   {"*لك لاصي يلصي بطونك 🌚😹.*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "اسكتي" or text == "اسكت" or text == "اسكتو" then
local GoldTeaM =   {"*اسكت انت لك لاصي يلصي بطونك 🌚😹.*" }
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "كفو" or text == "انشهد" then
local GoldTeaM =   {"*ايـوه شتـفق معـك بتيـه الكـلـمه 🌝♥️*"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "هاي" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*اشتحط لرخوه ماهو هاي يـا*  ["..ban.first_name.."](tg://user?id="..ban.id..")  😒💔"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "ارحب" or text == "مراحب" or text == "مرحبا" or text == "هلا" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*ارررحــب يهــز ارحــب يـا*  ["..ban.first_name.."](tg://user?id="..ban.id..")  🦦"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
if text == "سلخير" or text== "مساء الخير" then
local ban = bot.getUser(msg.sender_id.user_id)
local GoldTeaM = {"*جعل مساك حالي مثل وجهك يـا*  ["..ban.first_name.."](tg://user?id="..ban.id..") 🌚♥️"}
send(msg.chat_id,msg_id,''..GoldTeaM[math.random(#GoldTeaM)]..'',"md",true)  
return false
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match('^ايدي (%d+)$') then
numberidd = text:match('^ايدي (%d+)$')
numberid = math.floor(numberidd)
if not Redis:get(Gold.."Gold:Status:Id"..msg.chat_id) then
return false
end
if (not msg.Distinguished or not msg.Mistinguished) and Redis:get(Gold..'idnotmem'..msg.chat_id)  then
return send(msg.chat_id,msg.id,'\n*⇜ عذراً ايدي العضو معطل*',"md")
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,"ايدي") ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local InfoUser = bot.getUserFullInfo(msg.sender_id.user_id)
local Bio = FlterBio(getbio(msg.sender_id.user_id))
local nameuser = FlterBio(UserInfo.first_name)
local photo = bot.getUserProfilePhotos(msg.sender_id.user_id)
local UserId = msg.sender_id.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(Gold..'Gold:Num:Message:User'..msg.chat_id..':'..msg.sender_id.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(Gold..'Gold:Num:Message:Edit'..msg.chat_id..msg.sender_id.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(Gold.."Gold:Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
local NumAdd = Redis:get(Gold.."Gold:Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) or 0
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد يوزر'
end
if Redis:get(Gold.."Gold:Status:IdPhoto"..msg.chat_id) then
if photo.total_count < numberid then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendText(msg.chat_id, msg.id,
'لا يمكنني عرض الصورة رقم '..numberid..' لان عدد صورك '..photo.total_count..
'\n• 𝖭𝖺𝗆𝖾 𖦹 '..UserInfo.first_name..
'\n• 𝖨𝖣 𖦹 '..UserId..
'\n• 𝖴𝗌𝖾𝗋𝗇𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖱𝖺𝗇𝗄 𖦹 '..RinkBot..
'\n• 𝖬𝗌𝗀 𖦹 '..TotalMsg..
'\n• 𝖯𝗁𝗈𝗍𝗈 𖦹 '..TotalPhoto..
'\n• Bio 𖦹 ['..Bio..
']', "md",false, false, false, false, reply_markup)
end
if photo and photo.total_count and photo.total_count > 0 then
if photo.photos[numberid].animation then
if Redis:get(Gold..'porn'..msg.chat_id) then
local thumb_id = photo.photos[numberid].animation.file.remote.id
local idd = photo.photos[numberid].animation.file.id
if Redis:sismember(Gold.."sex_ids",idd) then
os.remove(""..num..".mp4")
return false 
end
if Redis:sismember(Gold.."not_sex_ids",idd) then
local File = request("https://api.telegram.org/bot" .. Token .. "/getfile?file_id="..photo.photos[numberid].animation.file.remote.id) 
local fc = JSON.decode(File)
local Name_File = download("https://api.telegram.org/file/bot"..Token.."/"..JSON.decode(File).result.file_path, "./id.mp4") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
else
local num = math.random(99999)
local Fille = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..thumb_id))
local dw = download('https://api.telegram.org/file/bot'..Token..'/'..Fille.result.file_path,""..num..".mp4")
local out = io.popen('python3 ./detect.py '..shq(dw), 'r'):read('*a')
print(out)
if string.find(out, "NONPORN") then
Redis:sadd(Gold.."not_sex_ids",idd)
os.remove(""..num..".mp4")
else
Redis:sadd(Gold.."sex_ids",idd) 
os.remove(""..num..".mp4")
return false 
end
end
end
local File = request("https://api.telegram.org/bot" .. Token .. "/getfile?file_id="..photo.photos[numberid].animation.file.remote.id) 
local fc = JSON.decode(File)
local Name_File = download("https://api.telegram.org/file/bot"..Token.."/"..JSON.decode(File).result.file_path, "./id.mp4") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendAnimation(msg.chat_id, msg.id, Name_File,
'\n• 𝖭𝖺m𝖾 𖦹 '..UserInfo.first_name..
'\n• 𝖨𝖣 𖦹 '..UserId..
'\n• 𝖴𝗌𝖾𝗋n𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖱𝖺𝗇𝗄 𖦹 '..RinkBot..
'\n• 𝖬𝗌𝗀 𖦹 '..TotalMsg..
'\n• 𝖯𝗁𝗈𝗍𝗈 𖦹 '..TotalPhoto..
'\n• 𝖡𝗂𝗈 𖦹 ['..Bio..
']', "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
if Redis:get(Gold..'porn'..msg.chat_id) then
local thumb_id = photo.photos[numberid].sizes[#photo.photos[numberid].sizes].photo.remote.id
local idd = photo.photos[numberid].sizes[#photo.photos[numberid].sizes].photo.id
if Redis:sismember(Gold.."sex_ids",idd) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
os.remove(""..num..".jpg")
return bot.sendText(msg.chat_id, msg.id,
'\n• 𝖭𝖺𝗆𝖾 𖦹 '..UserInfo.first_name..
'\n• 𝖨𝖣 𖦹 '..UserId..
'\n• 𝖴𝗌𝖾𝗋𝗇𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖱𝖺𝗇𝗄 𖦹 '..RinkBot..
'\n• 𝖬𝗌𝗀 𖦹 '..TotalMsg..
'\n• 𝖯𝗁𝗈𝗍𝗈 𖦹 '..TotalPhoto..
'\n• 𝖡𝗂𝗈 𖦹 ['..Bio..
']', "md",false, false, false, false, reply_markup)
end
if Redis:sismember(Gold.."not_sex_ids",idd) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[numberid].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n• 𝖭a𝗆𝖾 𖦹 '..UserInfo.first_name..
'\n• 𝖨𝖣 𖦹 '..UserId..
'\n• 𝖴𝗌𝖾𝗋𝗇𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖱𝖺𝗇k 𖦹 '..RinkBot..
'\n• 𝖬𝗌𝗀 𖦹 '..TotalMsg..
'\n• 𝖯𝗁oto 𖦹 '..TotalPhoto..
'\n• 𝖡𝗂𝗈 𖦹 ['..Bio..
']', "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
local num = math.random(99999)
local Fille = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..thumb_id))
local dw = download('https://api.telegram.org/file/bot'..Token..'/'..Fille.result.file_path,""..num..".jpg")
local out = io.popen('python3 ./detect.py '..shq(dw), 'r'):read('*a')
print(out)
if string.find(out, "NONPORN") then
Redis:sadd(Gold.."not_sex_ids",idd)
os.remove(""..num..".jpg")
else
Redis:sadd(Gold.."sex_ids",idd) 
os.remove(""..num..".jpg")
return false 
end
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[numberid].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n• 𝖭a𝗆𝖾 𖦹 '..UserInfo.first_name..
'\n• 𝖨𝖣 𖦹 '..UserId..
'\n• 𝖴𝗌𝖾𝗋𝗇𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖱𝖺𝗇k 𖦹 '..RinkBot..
'\n• 𝖬𝗌𝗀 𖦹 '..TotalMsg..
'\n• 𝖯𝗁oto 𖦹 '..TotalPhoto..
'\n• 𝖡𝗂𝗈 𖦹 ['..Bio..
']', "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendText(msg.chat_id, msg.id,
'\n• 𝖭𝖺𝗆𝖾 𖦹 '..UserInfo.first_name..
'\n• 𝖨𝖣 𖦹 '..UserId..
'\n• 𝖴𝗌𝖾𝗋𝗇𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖱𝖺𝗇𝗄 𖦹 '..RinkBot..
'\n• 𝖬𝗌𝗀 𖦹 '..TotalMsg..
'\n• 𝖯𝗁𝗈𝗍𝗈 𖦹 '..TotalPhoto..
'\n• 𝖡𝗂𝗈 𖦹 ['..Bio..
']', "md",false, false, false, false, reply_markup)
end
end
end
if text == "الحاسبه" or text == "اله حاسبه" or text == "الاله الحاسبه" or text == "الالة الحاسبة" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:del(Gold..msg.sender_id.user_id..msg.chat_id.."num")
start_mrkup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = msg.sender_id.user_id..'ON'},{text = 'DEL', data = msg.sender_id.user_id..'DEL'},{text = 'AC', data = msg.sender_id.user_id..'rest'},{text = 'OFF', data = msg.sender_id.user_id..'OFF'},
},
{
{text = '^', data = msg.sender_id.user_id..'calc&^'},{text = '√', data = msg.sender_id.user_id..'calc&√'},{text = '(', data = msg.sender_id.user_id..'calc&('},{text = ')', data = msg.sender_id.user_id..'calc&)'},
},
{
{text = '7', data = msg.sender_id.user_id..'calc&7'},{text = '8', data = msg.sender_id.user_id..'calc&8'},{text = '9', data = msg.sender_id.user_id..'calc&9'},{text = '÷', data = msg.sender_id.user_id..'calc&/'},
},
{
{text = '4', data = msg.sender_id.user_id..'calc&4'},{text = '5', data = msg.sender_id.user_id..'calc&5'},{text = '6', data = msg.sender_id.user_id..'calc&6'},{text = 'x', data = msg.sender_id.user_id..'calc&*'},
},
{
{text = '1', data = msg.sender_id.user_id..'calc&1'},{text = '2', data = msg.sender_id.user_id..'calc&2'},{text = '3', data = msg.sender_id.user_id..'calc&3'},{text = '-', data = msg.sender_id.user_id..'calc&-'},
},
{
{text = '0', data = msg.sender_id.user_id..'calc&0'},{text = '.', data = msg.sender_id.user_id..'calc&.'},{text = '+', data = msg.sender_id.user_id..'calc&+'},{text = '=', data = msg.sender_id.user_id..'equal'},
},
{{text = '˹𓌗 قنـاة البـوت 𓌗.',url="t.me/"..chsource..""}},
}
}
bot.sendText(msg.chat_id,msg.id," الالة الحاسبة\n✓","md",false, false, false, false, start_mrkup)
return false 
end
--------------
if text== "رفع اثول"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:tahaath"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفع العضو اثول الگروب🤪بنجاح\n⇜ تمت إضافته إلى قائمه الثولان😹\n✓️*","md") 
elseif text== "تنزيل اثول"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:tahaath"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيل العضو من ثولان الكروب\n⇜ تمت الزاله من قامة الثولان😹\n✓️*","md") 
elseif text== "رفع جلب"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:klp"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفع المتهم إلى جلب 🐕 بنجاح\n⇜ تمت إضافته إلى قائمه الجلاب😹\n✓️*","md") 
elseif text== "رفع مطي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:donke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفع المتهم إلى مطي 🦓بنجاح\n⇜ تمت إضافته إلى قائمه المطايه😹\n✓️*","md") 
elseif text== "تنزيل مطي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:donke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيل المتهم مطي بنجاح\n⇜ تمت ازالته من قائمه المطايه 🦓😹\n✓️*","md") 
elseif text== "رفع بقره"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:bkra"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفع المتهم بقره بنجاح\n⇜ الان اصبح بقرة مقدسه 🐄😹\n✓️*","md") 
elseif text== "تنزيل بقره"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:bkra"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيل المتهم بقره بنجاح\n⇜ تمت ٳزالته من قائمة البقرات 🐄😺\n✓️*","md") 
elseif text== "رفع ملك"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:kink"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهـلا عـزيـزي\n⇜ تم رفع صديقك ملـ👑ـك بنجاح\n⇜ اصبح ملك الكروب 👨‍🎨😍❗️ \n✓️*","md") 
elseif text== "تنزيل ملك"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:kink"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهـلا عـزيـزي\n⇜ تم تنزيل العضو المهتلف\n⇜ من قائمة ألملـ👑ـوك بنجاح 😹\n✓️*","md") 
elseif text== "رفع ملكه"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:Quean"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهـلا عـزيـزي\n⇜ تم رفع صديقتك ملكـ🥰ــه بنجاح\n⇜ اصبحت ملكة الكروب 💆‍♀😍❗️ \n✓️*","md") 
elseif text== "تنزيل ملكه"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:Quean"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهـلا عـزيـزي\n⇜ تم تنـزيـل العضـوه\n⇜ من قائمـة المـلـكـ👑ـات بنجاح 🥲🌚\n✓️*","md") 
elseif text== "تنزيل جلب"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:klp"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي \n⇜ تم تنزيل المتهم جلب 🐶بنجاح\n⇜ تمت إزالته من قائمه الجلاب🐕😹\n✓️*","md") 
elseif text== "تنزيل زاحف"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:zahf"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيل المتهم زاحف بنجاح\n⇜ تم ازالته من قائمه الزواحف🐊😹\n✓️*","md") 
elseif text== "رفع زاحف"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:zahf"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفعه زاحف😹 بنجاح\n⇜ تم اضافته الى قائمه الزواحف🐊😹\n✓️*","md") 
elseif text== "رفع صخل"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:sakl"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفع المتهم صخل بنجاح\n⇜ الان اصبح صخل الكروب 🐐😹\n✓️*","md") 
elseif text== "تنزيل صخل"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:sakl"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيل المتهم صخل بنجاح\n⇜ تمت ٳزالته من قائمة الصخوله🐐😺\n✓️*","md") 
elseif text== "رفع بكلبي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:klpe"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفع العضو داخل كلبك❤️\n⇜ تمت ترقيته بنجاح 😻\n✓️*","md") 
elseif text== "تنزيل من كلبي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then  
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:klpe"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيل من داخل قلبك❤️\n⇜ تمت ازالته من قائمه القلوب😹💔\n✓️*","md") 
elseif text== "رفع تاج"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:tagge"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهـلا عـزيـزي\n⇜ تم رفع صديقك تـ👑ـاج بنجاح  \n⇜ اصبح خط احمر ❗️ \n✓️*","md") 
elseif text== "تنزيل تاج"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:tagge"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهـلا عـزيـزي\n⇜ تم تنزيل العضو المهتلف\n⇜ من قائمة ألتـ👑ـاج بنجاح 😹💔\n✓️*","md") 
elseif text== "رفع مرتي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Controller(msg.chat_id,Message_Reply.sender_id.user_id) then
return send(msg.chat_id,msg_id,"\n* ⇜ هييـه ياورع .. مايمديـك تهيـن『 "..Controller(msg.chat_id,Message_Reply.sender_id.user_id).." 』*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:mrtee"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفع العضو مرتك👫 بنجاح\nالآن يمكنكم أخذ راحتكم🤤😉\n✓️*","md") 
elseif text== "تنزيل مرتي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:mrtee"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيل الجكمه👩‍⚕️مرتك بنجاح\nالآن انتم مفترقان☹️💔\n✓️*","md") 
elseif text== "رفع لوكي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:loke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم رفعه ضمن اللوكيه👨‍🦯😹\n✓️*","md") 
elseif text== "تنزيل لوكي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:loke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيله من اللوكيه😹\n✓️*","md") 
elseif text== "رفع طلي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id or UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مبـرمـج السـورس*","md",true)  
elseif UserInfo.id == Sudo_Id then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن مطـور السـورس*","md",true)  
elseif Redis:sismember(Gold.."Gold:MalekAsase:Group",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المـالك الاسـاسي*","md",true)  
elseif Redis:sismember(Gold.."Gold:DevelopersQ:Groups",UserInfo) or Redis:sismember(Gold.."Gold:MevelopersQ:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور الثـانـوي*","md",true)  
elseif Redis:sismember(Gold.."Gold:Developers:Groups",UserInfo) or Redis:sismember(Gold.."Gold:Mevelopers:Groups",UserInfo) then
return send(msg.chat_id,msg_id,"*⇜ هييـه ياورع .. مايمديـك تهيـن المطـور*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Gold.."mero:tele"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهلا عزيزي\n⇜ تم رفع المتهم طلي الكروب\n⇜ اطلع برا ابو البعرور الوصخ 🤢😂*","md") 
elseif text== "تنزيل طلي"  and msg.reply_to_message_id and not Redis:get(Gold.."amrthshesh"..msg.chat_id) then    
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييـه ياورع .. مايمديـك تهيـنني ؟!*","md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Gold.."mero:tele"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,"*⇜ اهــلا عزيزي\n⇜ تم تنزيله من الطليان👏😹\n✓️*","md") 
elseif text == ("الملوك") then
local list = Redis:smembers(Gold.."mero:kink"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد ملوك*","md") end
t = "\n*⇜ قائمة الملوك\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* الكنج 🤴🏻 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("البقرات") then
local list = Redis:smembers(Gold.."mero:bkra"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد بقرات*","md") end
t = "\n*⇜ قائمة البقرات\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* البقرة 🐄 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("الملكات") then
local list = Redis:smembers(Gold.."mero:Quean"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد ملكات*","md") end
t = "\n*⇜ قائمة الملكات\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* الملكه 👸🏻 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("مسح الملوك") then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:del(Gold.."mero:kink"..msg.chat_id)
send(msg.chat_id,msg_id,'*تم مسح الملوك* ',"md")
elseif text == ("مسح البقرات") then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:del(Gold.."mero:bkra"..msg.chat_id)
send(msg.chat_id,msg_id,'*تم مسح البقرات *',"md")
elseif text == ("مسح الملكات")  then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:del(Gold.."mero:Quean"..msg.chat_id)
send(msg.chat_id,msg_id,'*تم مسح الملكات *',"md")
elseif text == ("الثولان") then
local list = Redis:smembers(Gold.."mero:tahaath"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد ثولان*","md") end
t = "\n*⇜ قائمة الثولان\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* الاثول 👀 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("مسح الطليان")  then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:del(Gold.."mero:tele"..msg.chat_id)
send(msg.chat_id,msg_id,'*تم مسح الطليان *',"md")
elseif text == ("الطليان") then
local list = Redis:smembers(Gold.."mero:tele"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد طليان*","md") end
t = "\n*⇜ قائمة الطليان\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* الطلي 🐑 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("الطلاك") or text == ("الطلاق") then
local list = Redis:smembers(Gold.."mero:taha1"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد مطلقين*","md") end
t = "\n*⇜ قائمة الطلاك\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '[@'..UserInfo.username..']'
else
username = v 
end
t = t..""..k.."-* المطلقه 🙇🏻‍♀ : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("الجلاب") or text == ("الكلاب") then
local list = Redis:smembers(Gold.."mero:klp"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد جلاب*","md") end
t = "\n*⇜ قائمة الكلاب\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* الكلب 🦮 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("المطايه") then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold.."mero:donke"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد مطايه*","md") end
t = "\n*⇜ قائمة المطايه\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* المطي 🦓 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("الزواحف") or text == ("تاك الزواحف") or text == ("تاك للزواحف") then
local list = Redis:smembers(Gold.."mero:zahf"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد زواحف*","md") end
t = "\n*⇜ قائمة الزواحف\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* الزاحف 🦎 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("الصخول") then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold.."mero:sakl"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد صخول*","md") end
t = "\n*⇜ قائمة الصخول\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* الصخل 🐐 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("التيجان") or text == ("التاج") then
local list = Redis:smembers(Gold.."mero:tagge"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد قائمه تاج*","md") end
t = "\n*⇜ قائمة التاج\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* التاج 👑 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("الزوجات") then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold.."mero:mrtee"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد زوجات*","md") end
t = "\n*⇜ قائمة الزوجات\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-*🤰🏻 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
elseif text == ("اللوكيه") then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold.."mero:loke"..msg.chat_id)
if #list == 0 then return send(msg.chat_id,msg_id, "*⇜ لا يوجد لوكيه*","md") end
t = "\n*⇜ قائمة اللوكيه\nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."-* لوكي🕴 : "..username.."*\n"
if #list == k then
return send(msg.chat_id,msg_id, t,"md")
end
end
end
------------
if text == "رفع بقلبي" or text == "رفع قلبي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:")) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ مرفـوع في قلبـك مسبقـاً ✅*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*انت اهبل يبني عاوز ترفع نفسك فقلبك ؟؟*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*ابعد عني يبن الهبله*","md")
elseif Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:") then
return send(msg.chat_id,msg_id,"*للاسف العضو فقلب حد تاني*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:")) ~= tonumber(msg.sender_id.user_id) and not Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:") then
Redis:set(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:", msg.sender_id.user_id)
Redis:sadd(Gold..msg.chat_id..msg.sender_id.user_id.."my_heart:", Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⇜ تم رفعـه لـ قلبـك .. بنجـاح ✅").Reply,"md",true)
end
end
if text == "تنزيل من قلبي" or text == "تنزيل قلبي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:")) == tonumber(msg.sender_id.user_id) then
Redis:del(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:")
Redis:srem(Gold..msg.chat_id..msg.sender_id.user_id.."my_heart:", msg.chat_id..Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"تم تنزيلـه من قائمـة قلـوبك .. بنجـاح").Reply,"md",true) 
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ انت اهبل يبني عاوز تنزل نفسك ؟!*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي يبن الهبلـه  . . انا فـ قلـب مطـوري 😡🚫*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_heart:")) ~= tonumber(msg.sender_id.user_id)then
return send(msg.chat_id,msg_id,"*⇜ هو فقلبك اصلا عشان تنزلو ؟!*","md")
end
end
if text == "انا فقلب مين" or text == "انا قلب مين" then
if not Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_heart:") then
return send(msg.chat_id,msg_id,"*⇜ اقعد يعـم انت محـدش طايقـك اصـلاً ؟!*","md")
elseif Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_heart:") then
local in_heart_id = Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_heart:")
local heart_name = bot.getUser(in_heart_id).first_name
return send(msg.chat_id,msg_id,"*⇜ انـت فـ قـلب* ["..heart_name.."](tg://user?id="..in_heart_id..")","md")
end
end
if text == "قائمه قلبي" or text == "قائمة قلبي" or text == "قائمه كلبي" or text == "قائمة كلبي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local heart_list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_heart:")
if #heart_list == 0 then
return send(msg.chat_id,msg_id,"*⇜ قلبك فاضي محدش فيه .. متت😹😂*","md")
elseif #heart_list > 0 then
your_heart = "*- النـاس الي فـ قلبـك ← ♥️ \nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
your_heart = your_heart..k.." - ["..name.."](tg://user?id="..v..")\n"
end
return send(msg.chat_id,msg_id,your_heart,"md")
end
end
if text == "مسح قلبي" or text == "مسح قائمه قلبي" or text == "فرمت قلبي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_heart:")
for k,v in pairs(list) do
Redis:del(Gold..msg.chat_id..v.."in_heart:")
end
Redis:del(Gold..msg.chat_id..msg.sender_id.user_id.."my_heart:")
return send(msg.chat_id,msg_id,"*⇜ تم مسـح النـاس الي فـ قلبـك 🥲*","md")
end
-------
if text == "رفع صديق" or text == "رفع صديقي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:")) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ مرفـوع صديـقك مسبقـاً ✅*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*انت اهبل يبني عاوز ترفع نفسك صديق ؟؟*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . صديقي هو مطـوري 😡🚫*","md")
elseif Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:") then
return send(msg.chat_id,msg_id,"*للاسف هذا العضو صديق حد تاني*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:")) ~= tonumber(msg.sender_id.user_id) and not Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:") then
Redis:set(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:", msg.sender_id.user_id)
Redis:sadd(Gold..msg.chat_id..msg.sender_id.user_id.."my_frinds:", Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⇜ تم رفعـه صـديقك .. بنجـاح ✅").Reply,"md",true)
end
end
if text == "تنزيل صديق" or text == "تنزيل صديقي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:")) == tonumber(msg.sender_id.user_id) then
Redis:del(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:")
Redis:srem(Gold..msg.chat_id..msg.sender_id.user_id.."my_frinds:", msg.chat_id..Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"تم تنزيلـه من قائمـة اصدقائك .. بنجـاح").Reply,"md",true) 
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ انت اهبل يبني عاوز تنزل نفسك ؟!*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . صديقي هو مطـوري 😡🚫*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_frinds:")) ~= tonumber(msg.sender_id.user_id)then
return send(msg.chat_id,msg_id,"*⇜ هو صديق اصلا عشان تنزلو ؟!*","md")
end
end
if text == "انا صديق مين" or text == "انا صديقه مين" or text == "انا صديقة مين" or text == "اني صديقة مين" then
if not Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_frinds:") then
return send(msg.chat_id,msg_id,"*⇜ اقعد يعـم انت محـدش طايقـك اصـلاً ؟!*","md")
elseif Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_frinds:") then
local in_frinds_id = Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_frinds:")
local heart_name = bot.getUser(in_frinds_id).first_name
return send(msg.chat_id,msg_id,"*⇜ انـت صديـق* ["..heart_name.."](tg://user?id="..in_frinds_id..")","md")
end
end
if text == "اصدقائي" or text == "قائمة اصدقائي" or text == "قائمه الاصدقاء" or text == "قائمة الاصدقاء" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local heart_list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_frinds:")
if #heart_list == 0 then
return send(msg.chat_id,msg_id,"*⇜ مسكيـن ماعنـدك اصدقـاء*","md")
elseif #heart_list > 0 then
your_heart = "*- قائمـة اصدقائـك ← ♥️ \nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
your_heart = your_heart..k.." - ["..name.."](tg://user?id="..v..")\n"
end
return send(msg.chat_id,msg_id,your_heart,"md")
end
end
if text == "مسح اصدقائي" or text == "مسح الاصدقاء" or text == "مسح قائمه اصدقائي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_frinds:")
for k,v in pairs(list) do
Redis:del(Gold..msg.chat_id..v.."in_frinds:")
end
Redis:del(Gold..msg.chat_id..msg.sender_id.user_id.."my_frinds:")
return send(msg.chat_id,msg_id,"*⇜ تم مسـح قائمـة اصـدقائـك 🥲*","md")
end
-------
if text == "رفع اخ" or text == "رفع اخي" or text == "رفع اخو" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:")) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ مرفـوع اخـو مسبقـاً ✅*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*انت اهبل يبني عاوز ترفع نفسك اخ ؟؟*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد اخـوان 😡🚫*","md")
elseif Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:") then
return send(msg.chat_id,msg_id,"*للاسف هذا العضو اخ حد تاني*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:")) ~= tonumber(msg.sender_id.user_id) and not Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:") then
Redis:set(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:", msg.sender_id.user_id)
Redis:sadd(Gold..msg.chat_id..msg.sender_id.user_id.."my_brothers:", Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⇜ تم رفعـه اخـو .. بنجـاح ✅").Reply,"md",true)
end
end
if text == "تنزيل اخ" or text == "تنزيل اخي" or text == "تنزيل اخو" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:")) == tonumber(msg.sender_id.user_id) then
Redis:del(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:")
Redis:srem(Gold..msg.chat_id..msg.sender_id.user_id.."my_brothers:", msg.chat_id..Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"تم تنزيلـه من قائمـة اخوانك .. بنجـاح").Reply,"md",true) 
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ انت اهبل يبني عاوز تنزل نفسك ؟!*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد اخـوان 😡🚫*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_brothers:")) ~= tonumber(msg.sender_id.user_id)then
return send(msg.chat_id,msg_id,"*⇜ هو اخ اصلا عشان تنزلو ؟!*","md")
end
end
if text == "انا اخ مين" or text == "انا اخت مين" or text == "انا اخت مين" or text == "اني اخت مين" or text == "انا اخو مين" then
if not Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_brothers:") then
return send(msg.chat_id,msg_id,"*⇜ اقعد يعـم انت محـدش طايقـك اصـلاً ؟!*","md")
elseif Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_brothers:") then
local in_brothers_id = Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_brothers:")
local heart_name = bot.getUser(in_brothers_id).first_name
return send(msg.chat_id,msg_id,"*⇜ انت اخـو* ["..heart_name.."](tg://user?id="..in_brothers_id..")","md")
end
end
if text == "قائمة اخواني" or text == "اخواني" or text == "قائمه اخواني" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local heart_list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_brothers:")
if #heart_list == 0 then
return send(msg.chat_id,msg_id,"*⇜ مسكيـن ماعنـدك اخـوان*","md")
elseif #heart_list > 0 then
your_heart = "*- قائمـة اخوانـك ← ♥️ \nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
your_heart = your_heart..k.." - ["..name.."](tg://user?id="..v..")\n"
end
return send(msg.chat_id,msg_id,your_heart,"md")
end
end
if text == "مسح اخواني" or text == "مسح الاخوان" or text == "مسح قائمه اخواني" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_brothers:")
for k,v in pairs(list) do
Redis:del(Gold..msg.chat_id..v.."in_brothers:")
end
Redis:del(Gold..msg.chat_id..msg.sender_id.user_id.."my_brothers:")
return send(msg.chat_id,msg_id,"*⇜ تم مسـح قائمـة اخوانـك 🥲*","md")
end
-------
if text == "رفع ضلع" or text == "رفع ضلعي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:")) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ مرفـوع ضلـعك مسبقـاً ✅*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*انت اهبل يبني عاوز ترفع نفسك ضلع ؟؟*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد ضلوع 😡🚫*","md")
elseif Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:") then
return send(msg.chat_id,msg_id,"*للاسف هذا العضو ضلع حد تاني*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:")) ~= tonumber(msg.sender_id.user_id) and not Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:") then
Redis:set(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:", msg.sender_id.user_id)
Redis:sadd(Gold..msg.chat_id..msg.sender_id.user_id.."my_toloii:", Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⇜ تم رفعـه ضلع .. بنجـاح ✅").Reply,"md",true)
end
end
if text == "تنزيل ضلع" or text == "تنزيل ضلعي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:")) == tonumber(msg.sender_id.user_id) then
Redis:del(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:")
Redis:srem(Gold..msg.chat_id..msg.sender_id.user_id.."my_toloii:", msg.chat_id..Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"تم تنزيلـه من قائمـة ضلوعك .. بنجـاح").Reply,"md",true) 
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ انت اهبل يبني عاوز تنزل نفسك ؟!*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد ضلوع 😡🚫*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_toloii:")) ~= tonumber(msg.sender_id.user_id)then
return send(msg.chat_id,msg_id,"*⇜ هو ضلع اصلا عشان تنزلو ؟!*","md")
end
end
if text == "انا ضلع مين" or text == "انا ضلعة مين" or text == "انا ضلعة مين" or text == "اني ضلعة مين" or text == "اني ضلع مين" then
if not Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_toloii:") then
return send(msg.chat_id,msg_id,"*⇜ اقعد يعـم انت محـدش طايقـك اصـلاً ؟!*","md")
elseif Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_toloii:") then
local in_toloii_id = Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_toloii:")
local heart_name = bot.getUser(in_toloii_id).first_name
return send(msg.chat_id,msg_id,"*⇜ انـت ضلـع* ["..heart_name.."](tg://user?id="..in_toloii_id..")","md")
end
end
if text == "ضلوعي" or text == "قائمة ضلوعي" or text == "قائمه الضلوع" or text == "قائمة الضلوع" or text == "الضلوع" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local heart_list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_toloii:")
if #heart_list == 0 then
return send(msg.chat_id,msg_id,"*⇜ مسكيـن ماعنـدك ضلوع*","md")
elseif #heart_list > 0 then
your_heart = "*- قائمـة ضلوعـك ← ♥️ \nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
your_heart = your_heart..k.." - ["..name.."](tg://user?id="..v..")\n"
end
return send(msg.chat_id,msg_id,your_heart,"md")
end
end
if text == "مسح ضلوعي" or text == "مسح الضلوع" or text == "مسح قائمه الضلوع" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_toloii:")
for k,v in pairs(list) do
Redis:del(Gold..msg.chat_id..v.."in_toloii:")
end
Redis:del(Gold..msg.chat_id..msg.sender_id.user_id.."my_toloii:")
return send(msg.chat_id,msg_id,"*⇜ تم مسـح قائمـة ضلوعـك 🥲*","md")
end
-------
if text == "رفع وليدي" or text == "رفع ابني" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:")) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ مرفـوع وليـدك مسبقـاً ✅*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*انت اهبل يبني عاوز ترفع نفسك وليد ؟؟*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد اكون وليد حد 😡🚫*","md")
elseif Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:") then
return send(msg.chat_id,msg_id,"*للاسف هذا العضو وليد حد تاني*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:")) ~= tonumber(msg.sender_id.user_id) and not Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:") then
Redis:set(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:", msg.sender_id.user_id)
Redis:sadd(Gold..msg.chat_id..msg.sender_id.user_id.."my_waladi:", Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⇜ تم رفعـه ولدك .. بنجـاح ✅").Reply,"md",true)
end
end
if text == "تنزيل وليدي" or text == "تنزيل ابني" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:")) == tonumber(msg.sender_id.user_id) then
Redis:del(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:")
Redis:srem(Gold..msg.chat_id..msg.sender_id.user_id.."my_waladi:", msg.chat_id..Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"تم تنزيلـه من قائمـة ولادك .. بنجـاح").Reply,"md",true) 
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ انت اهبل يبني عاوز تنزل نفسك ؟!*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد اكون وليد حد 😡🚫*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_waladi:")) ~= tonumber(msg.sender_id.user_id)then
return send(msg.chat_id,msg_id,"*⇜ هو ولدك اصلا عشان تنزلو ؟!*","md")
end
end
if text == "انا ابن مين" or text == "انا وليد مين" or text == "اني ابن مين" or text == "اني وليد مين" then
if not Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_waladi:") then
return send(msg.chat_id,msg_id,"*⇜ اقعد يعـم انت محـدش طايقـك اصـلاً ؟!*","md")
elseif Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_waladi:") then
local in_waladi_id = Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_waladi:")
local heart_name = bot.getUser(in_waladi_id).first_name
return send(msg.chat_id,msg_id,"*⇜ انـت وليـد* ["..heart_name.."](tg://user?id="..in_waladi_id..")","md")
end
end
if text == "ولادي" or text == "اولادي" or text == "قائمه ولادي" or text == "قائمه اولادي" or text == "قائمة ولادي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local heart_list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_waladi:")
if #heart_list == 0 then
return send(msg.chat_id,msg_id,"*⇜ مسكيـن ماعنـدك ولاد*","md")
elseif #heart_list > 0 then
your_heart = "*- قائمـة ولادك ← ♥️ \nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
your_heart = your_heart..k.." - ["..name.."](tg://user?id="..v..")\n"
end
return send(msg.chat_id,msg_id,your_heart,"md")
end
end
if text == "مسح ولادي" or text == "مسح اولادي" or text == "مسح قائمه ولادي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_waladi:")
for k,v in pairs(list) do
Redis:del(Gold..msg.chat_id..v.."in_waladi:")
end
Redis:del(Gold..msg.chat_id..msg.sender_id.user_id.."my_waladi:")
return send(msg.chat_id,msg_id,"*⇜ تم مسـح قائمـة ولادك 🥲*","md")
end
-------
if text == "رفع بنتي" or text == "رفع بنيتي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:")) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ مرفـوعـه بنيتـك مسبقـاً ✅*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*انت اهبل يبني عاوز ترفع نفسك بنت ؟؟*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد اكون بنت حد 😡🚫*","md")
elseif Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:") then
return send(msg.chat_id,msg_id,"*للاسف هذا العضو بنت حد تاني*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:")) ~= tonumber(msg.sender_id.user_id) and not Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:") then
Redis:set(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:", msg.sender_id.user_id)
Redis:sadd(Gold..msg.chat_id..msg.sender_id.user_id.."my_banati:", Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⇜ تم رفعـها بنيتك .. بنجـاح ✅").Reply,"md",true)
end
end
if text == "تنزيل بنتي" or text == "تنزيل بنيتي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:")) == tonumber(msg.sender_id.user_id) then
Redis:del(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:")
Redis:srem(Gold..msg.chat_id..msg.sender_id.user_id.."my_banati:", msg.chat_id..Message_Reply.sender_id.user_id)
return send(msg.chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"تم تنزيلـه من قائمـة بناتك .. بنجـاح").Reply,"md",true) 
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"*⇜ انت اهبل يبني عاوز تنزل نفسك ؟!*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Gold) then
return send(msg.chat_id,msg_id,"*⇜ ابعـد عنـي  . . ماريد اكون بنت حد 😡🚫*","md")
elseif tonumber(Redis:get(Gold..msg.chat_id..Message_Reply.sender_id.user_id.."in_banati:")) ~= tonumber(msg.sender_id.user_id)then
return send(msg.chat_id,msg_id,"*⇜ هو بنيتك اصلا عشان تنزلو ؟!*","md")
end
end
if text == "انا بنت مين" or text == "انا بنية مين" or text == "اني بنت مين" or text == "اني بنية مين" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if not Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_banati:") then
return send(msg.chat_id,msg_id,"*⇜ اقعدي يبت انتي محـدش طايقـك اصـلاً ؟!*","md")
elseif Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_banati:") then
local in_banati_id = Redis:get(Gold..msg.chat_id..msg.sender_id.user_id.."in_banati:")
local heart_name = bot.getUser(in_banati_id).first_name
return send(msg.chat_id,msg_id,"*⇜ انـت بنـت* ["..heart_name.."](tg://user?id="..in_banati_id..")","md")
end
end
if text == "بناتي" or text == "تاك بناتي" or text == "قائمه بناتي" or text == "قائمه بناتي" or text == "قائمة بناتي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local heart_list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_banati:")
if #heart_list == 0 then
return send(msg.chat_id,msg_id,"*⇜ مسكيـن ماعنـدك بنات*","md")
elseif #heart_list > 0 then
your_heart = "*- قائمـة بناتك ← ♥️ \nٴ⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆\n*"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
your_heart = your_heart..k.." - ["..name.."](tg://user?id="..v..")\n"
end
return send(msg.chat_id,msg_id,your_heart,"md")
end
end
if text == "مسح بناتي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold..msg.chat_id..msg.sender_id.user_id.."my_banati:")
for k,v in pairs(list) do
Redis:del(Gold..msg.chat_id..v.."in_banati:")
end
Redis:del(Gold..msg.chat_id..msg.sender_id.user_id.."my_banati:")
return send(msg.chat_id,msg_id,"*⇜ تم مسـح قائمـة بناتك 🥲*","md")
end
--------------------------------------------------------------------------------------------------------------
if text and text:match('^ضع تفاعل (%d+) (.*)$') or text and text:match('^وضع تفاعل (%d+) (.*)$') then
if not msg.MalekAsase and not msg.MaleAsase then
return send(msg_chat_id,msg_id,'*⇜ عـذراً .. عـزيـزي 🤷🏻‍♀*\n*⇜ هذا الامـر يخـص المـالك الاسـاسـي 🎖*',"md",true)
end
local msgcountneed = {text:match('^ضع تفاعل (%d+) (.*)$') } or {text:match('^وضع تفاعل (%d+) (.*)$') }
if tonumber(msgcountneed[1]:match('(%d+)')) <= 999 then
return send(msg.chat_id,msg_id,'\n*• عذراً يجب ان تكون عدد الرسائل اكثر من 1000* ',"md",true)
end
if tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Gold.."rtpamalekassmsg"..msg.chat_id)) then
Redis:del(Gold.."rtpamalekass"..msg.chat_id)
Redis:del(Gold.."rtpamalekassmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Gold.."rtpamalekmsg"..msg.chat_id)) then
Redis:del(Gold.."rtpamalek"..msg.chat_id)
Redis:del(Gold.."rtpamalekmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Gold.."rtpamonsheassmsg"..msg.chat_id)) then
Redis:del(Gold.."rtpamonsheass"..msg.chat_id)
Redis:del(Gold.."rtpamonsheassmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Gold.."rtpamonshemsg"..msg.chat_id)) then
Redis:del(Gold.."rtpamonsge"..msg.chat_id)
Redis:del(Gold.."rtpamonshemsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Gold.."rtpamanagermsg"..msg.chat_id)) then
Redis:del(Gold.."rtpamanager"..msg.chat_id)
Redis:del(Gold.."rtpamanagermsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Gold.."rtpaadminmsg"..msg.chat_id)) then
Redis:del(Gold.."rtpaadmin"..msg.chat_id)
Redis:del(Gold.."rtpaadminmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Gold.."rtpaspecialmsg"..msg.chat_id)) then
Redis:del(Gold.."rtpaspecial"..msg.chat_id)
Redis:del(Gold.."rtpaspecialmsg"..msg.chat_id)
end
if msgcountneed[2] == "مالك اساسي" or msgcountneed[2] == "مالك الاساسي" or msgcountneed[2] == "المالك الاساسي" then
local StatusMember = bot.getChatMember(msg.chat_id,msg.sender_id.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص مـالك القـروب فقط *',"md",true)  
end
Redis:set(Gold.."rtpamalekass"..msg.chat_id,msgcountneed[2])
Redis:set(Gold.."rtpamalekassmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg.chat_id,msg_id,'\n*⇜ تم وضـع التفاعـل بنجـاح ✔️*\n*⇜ عـدد الرسـائل :* '..msgcountneed[1]:match('(%d+)')..'\n*⇜ الرتبـه :* مالك اساسي\n\n*⇜ سيتم رفـع الرتبـه تلقـائيـاً*\n ✓',"md")
elseif msgcountneed[2] == "مالك" or msgcountneed[2] == "المالك" then
Redis:set(Gold.."rtpamalek"..msg.chat_id,msgcountneed[2])
Redis:set(Gold.."rtpamalekmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg.chat_id,msg_id,'\n*⇜ تم وضـع التفاعـل بنجـاح ✔️*\n*⇜ عـدد الرسـائل :* '..msgcountneed[1]:match('(%d+)')..'\n*⇜ الرتبـه :* مالك\n\n*⇜ سيتم رفـع الرتبـه تلقـائيـاً*\n ✓',"md")
elseif msgcountneed[2] == "منشئ اساسي" or msgcountneed[2] == "منشئ الاساسي" or msgcountneed[2] == "المنشئ الاساسي" then
Redis:set(Gold.."rtpamonsheass"..msg.chat_id,msgcountneed[2])
Redis:set(Gold.."rtpamonsheassmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg.chat_id,msg_id,'\n*⇜ تم وضـع التفاعـل بنجـاح ✔️*\n*⇜ عـدد الرسـائل :* '..msgcountneed[1]:match('(%d+)')..'\n*⇜ الرتبـه :* منشئ اساسي\n\n*⇜ سيتم رفـع الرتبـه تلقـائيـاً*\n ✓',"md")
elseif msgcountneed[2] == "منشئ" or msgcountneed[2] == "المنشئ" then
Redis:set(Gold.."rtpamonsge"..msg.chat_id,msgcountneed[2])
Redis:set(Gold.."rtpamonshemsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg.chat_id,msg_id,'\n*⇜ تم وضـع التفاعـل بنجـاح ✔️*\n*⇜ عـدد الرسـائل :* '..msgcountneed[1]:match('(%d+)')..'\n*⇜ الرتبـه :* منشئ\n\n*⇜ سيتم رفـع الرتبـه تلقـائيـاً*\n ✓',"md")
elseif msgcountneed[2] == "مدير" or msgcountneed[2] == "المدير" then
Redis:set(Gold.."rtpamanager"..msg.chat_id,msgcountneed[2])
Redis:set(Gold.."rtpamanagermsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg.chat_id,msg_id,'\n*⇜ تم وضـع التفاعـل بنجـاح ✔️*\n*⇜ عـدد الرسـائل :* '..msgcountneed[1]:match('(%d+)')..'\n*⇜ الرتبـه :* مدير\n\n*⇜ سيتم رفـع الرتبـه تلقـائيـاً*\n ✓',"md")
elseif msgcountneed[2] == "ادمن" or msgcountneed[2] == "الادمن" then
Redis:set(Gold.."rtpaadmin"..msg.chat_id,msgcountneed[2])
Redis:set(Gold.."rtpaadminmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg.chat_id,msg_id,'\n*⇜ تم وضـع التفاعـل بنجـاح ✔️*\n*⇜ عـدد الرسـائل :* '..msgcountneed[1]:match('(%d+)')..'\n*⇜ الرتبـه :* ادمن\n\n*⇜ سيتم رفـع الرتبـه تلقـائيـاً*\n ✓',"md")
elseif msgcountneed[2] == "مميز" or msgcountneed[2] == "المميز" then
Redis:set(Gold.."rtpaspecial"..msg.chat_id,msgcountneed[2])
Redis:set(Gold.."rtpaspecialmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg.chat_id,msg_id,'\n*⇜ تم وضـع التفاعـل بنجـاح ✔️*\n*⇜ عـدد الرسـائل :* '..msgcountneed[1]:match('(%d+)')..'\n*⇜ الرتبـه :* مميز\n\n*⇜ سيتم رفـع الرتبـه تلقـائيـاً*\n ✓',"md")
else
return send(msg.chat_id,msg_id,'\n*⇜ مافي رتبة بالاسم هذا* ',"md")
end
end
if text == "حذف تفاعل الرتب" or text == "مسح تفاعل الرتب" then
if not msg.MalekAsase and not msg.MaleAsase then
return send(msg_chat_id,msg_id,'*⇜ عـذراً .. عـزيـزي 🤷🏻‍♀*\n*⇜ هذا الامـر يخـص المـالك الاسـاسـي 🎖*',"md",true)
end
Redis:del(Gold.."rtpamalekass"..msg.chat_id)
Redis:del(Gold.."rtpamalekassmsg"..msg.chat_id)
Redis:del(Gold.."rtpamalek"..msg.chat_id)
Redis:del(Gold.."rtpamalekmsg"..msg.chat_id)
Redis:del(Gold.."rtpamonsheass"..msg.chat_id)
Redis:del(Gold.."rtpamonsheassmsg"..msg.chat_id)
Redis:del(Gold.."rtpamonsge"..msg.chat_id)
Redis:del(Gold.."rtpamonshemsg"..msg.chat_id)
Redis:del(Gold.."rtpamanager"..msg.chat_id)
Redis:del(Gold.."rtpamanagermsg"..msg.chat_id)
Redis:del(Gold.."rtpaadmin"..msg.chat_id)
Redis:del(Gold.."rtpaadminmsg"..msg.chat_id)
Redis:del(Gold.."rtpaspecial"..msg.chat_id)
Redis:del(Gold.."rtpaspecialmsg"..msg.chat_id)
return send(msg.chat_id,msg_id,'\n*⇜ تم حذف وتعطيل توزيع رتب المتفاعلين*',"md",true)
end
if text and text:match('^حذف تفاعل (.*)$') or text and text:match('^مسح تفاعل (.*)$') or text and text:match('^مسح التفاعل (.*)$') or text and text:match('^حذف التفاعل (.*)$') then
if not msg.MalekAsase and not msg.MaleAsase then
return send(msg_chat_id,msg_id,'*⇜ عـذراً .. عـزيـزي 🤷🏻‍♀*\n*⇜ هذا الامـر يخـص المـالك الاسـاسـي 🎖*',"md",true)
end
local msgcountdel = text:match('^حذف تفاعل (.*)$') or text:match('^مسح تفاعل (.*)$')  or text:match('^مسح التفاعل (.*)$') or text:match('^حذف التفاعل (.*)$')
if msgcountdel == "مالك اساسي" or msgcountdel == "مالك الاساسي" or msgcountdel == "المالك الاساسي" then
local StatusMember = bot.getChatMember(msg.chat_id,msg.sender_id.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص مـالك القـروب فقط* ',"md",true)  
end
Redis:del(Gold.."rtpamalekass"..msg.chat_id)
Redis:del(Gold.."rtpamalekassmsg"..msg.chat_id)
send(msg.chat_id,msg_id,'\n*⇜ تم مسـح رتبـة المالك الاساسي مـن التفاعـل*',"md")
elseif msgcountdel == "مالك" or msgcountdel == "المالك" then
Redis:del(Gold.."rtpamalek"..msg.chat_id)
Redis:del(Gold.."rtpamalekmsg"..msg.chat_id)
send(msg.chat_id,msg_id,'\n*⇜ تم مسـح رتبـة المالك مـن التفاعـل*',"md")
elseif msgcountdel == "منشئ اساسي" or msgcountdel == "منشئ الاساسي" or msgcountdel == "المنشئ الاساسي" then
Redis:del(Gold.."rtpamonsheass"..msg.chat_id)
Redis:del(Gold.."rtpamonsheassmsg"..msg.chat_id)
send(msg.chat_id,msg_id,'\n*⇜ تم مسـح رتبـة المنشئ الاساسي مـن التفاعـل*',"md")
elseif msgcountdel == "منشئ" or msgcountdel == "المنشئ" then
Redis:del(Gold.."rtpamonsge"..msg.chat_id)
Redis:del(Gold.."rtpamonshemsg"..msg.chat_id)
send(msg.chat_id,msg_id,'\n*⇜ تم مسـح رتبـة المنشئ مـن التفاعـل*',"md")
elseif msgcountdel == "مدير" or msgcountdel == "المدير" then
Redis:del(Gold.."rtpamanager"..msg.chat_id)
Redis:del(Gold.."rtpamanagermsg"..msg.chat_id)
send(msg.chat_id,msg_id,'\n*⇜ تم مسـح رتبـة المدير مـن التفاعـل*',"md")
elseif msgcountdel == "ادمن" or msgcountdel == "الادمن" then
Redis:del(Gold.."rtpaadmin"..msg.chat_id)
Redis:del(Gold.."rtpaadminmsg"..msg.chat_id)
send(msg.chat_id,msg_id,'\n*⇜ تم مسـح رتبـة الادمن مـن التفاعـل*',"md")
elseif msgcountdel == "مميز" or msgcountdel == "المميز" then
Redis:del(Gold.."rtpaspecial"..msg.chat_id)
Redis:del(Gold.."rtpaspecialmsg"..msg.chat_id)
send(msg.chat_id,msg_id,'\n*⇜ تم مسـح رتبـة المميز مـن التفاعـل*',"md")
else
return send(msg.chat_id,msg_id,'\n*⇜ مافي رتبة بالاسم هذا* ',"md")
end
end
if text == "تفاعل الرتب" or text == "تفاعل رتب" then
rtpamalekass = Redis:get(Gold.."rtpamalekass"..msg.chat_id)
rtpamalekassmsg = Redis:get(Gold.."rtpamalekassmsg"..msg.chat_id)
rtpamalek = Redis:get(Gold.."rtpamalek"..msg.chat_id)
rtpamalekmsg = Redis:get(Gold.."rtpamalekmsg"..msg.chat_id)
rtpamonsheass = Redis:get(Gold.."rtpamonsheass"..msg.chat_id)
rtpamonsheassmsg = Redis:get(Gold.."rtpamonsheassmsg"..msg.chat_id)
rtpamonsge = Redis:get(Gold.."rtpamonsge"..msg.chat_id)
rtpamonshemsg = Redis:get(Gold.."rtpamonshemsg"..msg.chat_id)
rtpamanager = Redis:get(Gold.."rtpamanager"..msg.chat_id)
rtpamanagermsg = Redis:get(Gold.."rtpamanagermsg"..msg.chat_id)
rtpaadmin = Redis:get(Gold.."rtpaadmin"..msg.chat_id)
rtpaadminmsg = Redis:get(Gold.."rtpaadminmsg"..msg.chat_id)
rtpaspecial = Redis:get(Gold.."rtpaspecial"..msg.chat_id)
rtpaspecialmsg = Redis:get(Gold.."rtpaspecialmsg"..msg.chat_id)
if not rtpamalekass and not rtpamalek and not rtpamonsheass and not rtpamonsge and not rtpamanager and not rtpaadmin and not rtpaspecial then
return send(msg.chat_id,msg_id,"\n*⇜ عذراً عزيزي لا توجد رتب للتفاعل هنا *","md",true)  
end
if rtpamalekass then
rtpamalekassres = '▪︎ '..rtpamalekass..' ↤︎ '..rtpamalekassmsg..' رسالة\n'
else
rtpamalekassres = ''
end
if rtpamalek then
rtpamalekres = '▪︎ '..rtpamalek..' ↤︎ '..rtpamalekmsg..' رسالة\n'
else
rtpamalekres = ''
end
if rtpamonsheass then
rtpamonsheassres = '▪︎ '..rtpamonsheass..' ↤︎ '..rtpamonsheassmsg..' رسالة\n'
else
rtpamonsheassres = ''
end
if rtpamonsge then
rtpamonsgeres = '▪︎ '..rtpamonsge..' ↤︎ '..rtpamonshemsg..' رسالة\n'
else
rtpamonsgeres = ''
end
if rtpamanager then
rtpamanagerres = '▪︎ '..rtpamanager..' ↤︎ '..rtpamanagermsg..' رسالة\n'
else
rtpamanagerres = ''
end
if rtpaadmin then
rtpaadminres = '▪︎ '..rtpaadmin..' ↤︎ '..rtpaadminmsg..' رسالة\n'
else
rtpaadminres = ''
end
if rtpaspecial then
rtpaspecialres = '▪︎ '..rtpaspecial..' ↤︎ '..rtpaspecialmsg..' رسالة\n'
else
rtpaspecialres = ''
end
send(msg.chat_id,msg_id,"\n*⇜ مرحبـاً بـك عـزيـزي فـي تفاعـل الـرتب :*\n\n"..rtpamalekassres..rtpamalekres..rtpamonsheassres..rtpamonsgeres..rtpamanagerres..rtpaadminres..rtpaspecialres.."\n✓","md",true)
end
if text then
nummaguser = Redis:get(Gold..'Gold:Num:Message:Usertrand'..msg.chat_id..':'..msg.sender_id.user_id) or 1
local name = bot.getUser(msg.sender_id.user_id)
if name.first_name then
namee = ""..name.first_name..""
else
namee = " لا يوجد اسم"
end
if Redis:get(Gold.."rtpamalekassmsg"..msg.chat_id) == nummaguser then
Redis:sadd(Gold.."Gold:MalekAsase:Group"..msg.chat_id,msg.sender_id.user_id) 
send(msg.chat_id,msg_id,"\n*⇜ مبـروك لـ الحلـو ↤︎* "..namee.."\n*⇜ وصـل تفـاعـلك الـى :* "..math.floor(nummaguser).." *رسالة*\n*⇜ وحصلت بالمقابـل على رتبـة :* "..Redis:get(Gold.."rtpamalekass"..msg.chat_id).."\n✓","md")
elseif Redis:get(Gold.."rtpamalekmsg"..msg.chat_id) == nummaguser then
Redis:sadd(Gold.."Gold:TheBasicsQ:Group"..msg.chat_id,msg.sender_id.user_id)
send(msg.chat_id,msg_id,"\n*⇜ مبـروك لـ الحلـو ↤︎* "..namee.."\n*⇜ وصـل تفـاعـلك الـى :* "..math.floor(nummaguser).." *رسالة*\n*⇜ وحصلت بالمقابـل على رتبـة :* "..Redis:get(Gold.."rtpamalek"..msg.chat_id).."\n✓","md")
elseif Redis:get(Gold.."rtpamonsheassmsg"..msg.chat_id) == nummaguser then
Redis:sadd(Gold.."Gold:TheBasics:Group"..msg.chat_id,msg.sender_id.user_id) 
send(msg.chat_id,msg_id,"\n*⇜ مبـروك لـ الحلـو ↤︎* "..namee.."\n*⇜ وصـل تفـاعـلك الـى :* "..math.floor(nummaguser).." *رسالة*\n*⇜ وحصلت بالمقابـل على رتبـة :* "..Redis:get(Gold.."rtpamonsheass"..msg.chat_id).."\n✓","md")
elseif Redis:get(Gold.."rtpamonshemsg"..msg.chat_id) == nummaguser then
Redis:sadd(Gold.."Gold:Originators:Group"..msg.chat_id,msg.sender_id.user_id) 
send(msg.chat_id,msg_id,"\n*⇜ مبـروك لـ الحلـو ↤︎* "..namee.."\n*⇜ وصـل تفـاعـلك الـى :* "..math.floor(nummaguser).." *رسالة*\n*⇜ وحصلت بالمقابـل على رتبـة :* "..Redis:get(Gold.."rtpamonsge"..msg.chat_id).."\n✓","md")
elseif Redis:get(Gold.."rtpamanagermsg"..msg.chat_id) == nummaguser then
Redis:sadd(Gold.."Gold:Managers:Group"..msg.chat_id,msg.sender_id.user_id) 
send(msg.chat_id,msg_id,"\n*⇜ مبـروك لـ الحلـو ↤︎* "..namee.."\n*⇜ وصـل تفـاعـلك الـى :* "..math.floor(nummaguser).." *رسالة*\n*⇜ وحصلت بالمقابـل على رتبـة :* "..Redis:get(Gold.."rtpamanager"..msg.chat_id).."\n✓","md")
elseif Redis:get(Gold.."rtpaadminmsg"..msg.chat_id) == nummaguser then
Redis:sadd(Gold.."Gold:Addictive:Group"..msg.chat_id,msg.sender_id.user_id) 
send(msg.chat_id,msg_id,"\n*⇜ مبـروك لـ الحلـو ↤︎* "..namee.."\n*⇜ وصـل تفـاعـلك الـى :* "..math.floor(nummaguser).." *رسالة*\n*⇜ وحصلت بالمقابـل على رتبـة :* "..Redis:get(Gold.."rtpaadmin"..msg.chat_id).."\n✓","md")
elseif Redis:get(Gold.."rtpaspecialmsg"..msg.chat_id) == nummaguser then
Redis:sadd(Gold.."Gold:Distinguished:Group"..msg.chat_id,msg.sender_id.user_id) 
send(msg.chat_id,msg_id,"\n*⇜ مبـروك لـ الحلـو ↤︎* "..namee.."\n*⇜ وصـل تفـاعـلك الـى :* "..math.floor(nummaguser).." *رسالة*\n*⇜ وحصلت بالمقابـل على رتبـة :* "..Redis:get(Gold.."rtpaspecial"..msg.chat_id).."\n✓","md")
end
end
--------------------------------------------------------------------------------------------------------------
if text == "ضع الردود للمميزين" or text == "وضع الردود للمميزين" then
if not msg.TheBasicsQ or not msg.TheMasicsQ then
return send(msg_chat_id,msg_id,'*⇜ عـذراً .. عـزيـزي 🤷🏻‍♀*\n*⇜ هذا الامـر يخـص المـالك🎖*',"md",true)
end
Redis:set(Gold.."myrdspecial"..msg.chat_id,"true")
return send(msg.chat_id,msg.id,"*⇜ تم وضع اضافة ردي للمميزين ومافوق* ","md",true)
end
if text == "ضع الردود للاعضاء" or text == "وضع الردود للاعضاء" then
if not msg.TheBasicsQ or not msg.TheMasicsQ then
return send(msg_chat_id,msg_id,'*⇜ عـذراً .. عـزيـزي 🤷🏻‍♀*\n*⇜ هذا الامـر يخـص المـالك🎖*',"md",true)
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:del(Gold.."myrdspecial"..msg.chat_id)
return send(msg.chat_id,msg.id,"*⇜ تم وضع اضافة ردي لجميع الاعضاء* ","md",true)
end
if text == "تفعيل اضف ردي" or text == "تفعيل ردي" or text == "تفعيل ردود الاعضاء" then
if not msg.TheBasicsQ or not msg.TheMasicsQ then
return send(msg_chat_id,msg_id,'*⇜ عـذراً .. عـزيـزي 🤷🏻‍♀*\n*⇜ هذا الامـر يخـص المـالك🎖*',"md",true)
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if Redis:get(Gold.."onmyrd"..msg.chat_id) then
return send(msg.chat_id,msg.id,"*⇜ تم تفعيل ردود الاعضاء مسبقاً* ","md",true)
else
Redis:set(Gold.."onmyrd"..msg.chat_id,"true")
return send(msg.chat_id,msg.id,"*⇜ ابشر فعلت ردود الاعضاء* ","md",true)
end
end
if text == "تعطيل اضف ردي" or text == "تعطيل ردي" or text == "تعطيل ردود الاعضاء" then
if not msg.TheBasicsQ or not msg.TheMasicsQ then
return send(msg_chat_id,msg_id,'*⇜ عـذراً .. عـزيـزي 🤷🏻‍♀*\n*⇜ هذا الامـر يخـص المـالك🎖*',"md",true)
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if Redis:get(Gold.."onmyrd"..msg.chat_id) then
Redis:del(Gold.."onmyrd"..msg.chat_id)
return send(msg.chat_id,msg.id,"*⇜ ابشر عطلت ردود الاعضاء *","md",true)
else
return send(msg.chat_id,msg.id,"*⇜ تم تعطيل ردود الاعضاء مسبقاً *","md",true)
end
end
if text == "اضف ردي" then
if not Redis:get(Gold.."onmyrd"..msg.chat_id) then
return send(msg.chat_id,msg.id,"*⇜ اضافة الردود للاعضاء معطلة*\n*⇜ لتفعيلها ( تفعيل ردود الاعضاء )*","md",true)
end
if not msg.Distinguished or not msg.Mistinguished then
if Redis:get(Gold.."myrdspecial"..msg.chat_id) then
return send(msg.chat_id,msg.id,"*⇜ عذراً عزيزي اضافة ردي للمميزين ومافوق فقط*","md",true)
end
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if Redis:sismember(Gold.."Gold:List:myrdmyid"..msg.chat_id,msg.sender_id.user_id) then
return send(msg.chat_id,msg_id,"\n*⇜ عذراً عزيزي انت ضايف ردك من قبل*\n*⇜ لحذف ردك ( حذف ردي )*","md",true)
end
Redis:set(Gold.."Gold:Set:myrd"..msg.sender_id.user_id..":"..msg.chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =msg.sender_id.user_id..'/cancelamr'}
},
}
}
return send(msg.chat_id,msg_id,"*⇜ حسناً عزيزي ارسل اسمك الان*", 'md', false, false, false, false, reply_markup)
end
if text == "حذف ردي" or text == "مسح ردي" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local myrd = Redis:get(Gold.."Gold:List:myrdmyrd"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg.chat_id, msg.id,"*⇜ تم مسح ردك بنجاح*\n*⇜ الرد (* "..myrd.." *)*", 'md')
Redis:srem(Gold.."Gold:List:myrd"..msg.chat_id, myrd)
Redis:srem(Gold.."Gold:List:myrdmyid"..msg.chat_id, msg.sender_id.user_id)
Redis:del(Gold.."Gold:Add:myrdtext"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:Add:myrdid"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:List:myrdmyrd"..msg.sender_id.user_id..":"..msg.chat_id)
end
if (text == "حذف رده" or text == "مسح رده") and msg.reply_to_message_id ~= 0 then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييه مايمديك تستخدم الامر علي ياورع ؟!*","md",true)  
end
local myrd = Redis:get(Gold.."Gold:List:myrdmyrd"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
send(msg.chat_id, msg.id,"*⇜ الـرد (* "..myrd.." *)\n⇜ تم مسـح رده .. بنجـاح*", 'md')
Redis:srem(Gold.."Gold:List:myrd"..msg.chat_id, myrd)
Redis:srem(Gold.."Gold:List:myrdmyid"..msg.chat_id, Message_Reply.sender_id.user_id)
Redis:del(Gold.."Gold:Add:myrdtext"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:Add:myrdid"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:List:myrdmyrd"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
end
if text and text:match('^مسح رده @(%S+)$') or text and text:match('^حذف رده @(%S+)$') then
local UserName = text:match('^مسح رده @(%S+)$') or text:match('^حذف رده @(%S+)$')
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg.chat_id,msg_id,"\n*⇜ عـذراً .. لا يوجد حسـاب بهـذا المعـرف ؟!*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg.chat_id,msg_id,"\n*⇜ عـذراً  .. لا تستطيع استخدام معرف قناة او مجموعة ؟!*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg.chat_id,msg_id,"\n*⇜ عـذراً  .. لا تستطيع استخـدام معـرف البـوت ؟!*","md",true)  
end
local myrd = Redis:get(Gold.."Gold:List:myrdmyrd"..UserId_Info.id..":"..msg.chat_id)
send(msg.chat_id, msg.id,"*⇜ الـرد (* "..myrd.." *)\n⇜ تم مسـح رده .. بنجـاح*", 'md')
Redis:srem(Gold.."Gold:List:myrd"..msg.chat_id, myrd)
Redis:srem(Gold.."Gold:List:myrdmyid"..msg.chat_id, UserId_Info.id)
Redis:del(Gold.."Gold:Add:myrdtext"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:Add:myrdid"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:List:myrdmyrd"..UserId_Info.id..":"..msg.chat_id)
end
if text and text:match('^مسح رده (%d+)$') or text and text:match('^حذف رده (%d+)$') then
local UserId = text:match('^مسح رده (%d+)$') or text:match('^حذف رده (%d+)$')
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg.chat_id,msg_id,"\n*⇜ عـذراً البـوت ليـس مشـرفاً .. يرجـى رفعـه وإعطـائه كـافة الصـلاحيات*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg.chat_id,msg_id,'\n⇜ البوت ليس لديه صلاحيه حظر المستخدمين ',"md",true)  
end
if not msg.Originators and not Redis:get(Gold.."Gold:Status:BanId"..msg.chat_id) then
return send(msg.chat_id,msg_id,"⇜ ( الحظر - الطرد - التقييد ) معطل من قبل المنشئين","md",true)
end 
local UserInfo = bot.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return send(msg.chat_id,msg_id,"\n⇜ عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
local myrd = Redis:get(Gold.."Gold:List:myrdmyrd"..UserId..":"..msg.chat_id)
send(msg.chat_id, msg.id,"*⇜ الـرد (* "..myrd.." *)\n⇜ تم مسـح رده .. بنجـاح*", 'md')
Redis:srem(Gold.."Gold:List:myrd"..msg.chat_id, myrd)
Redis:srem(Gold.."Gold:List:myrdmyid"..msg.chat_id, UserId)
Redis:del(Gold.."Gold:Add:myrdtext"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:Add:myrdid"..myrd..msg.chat_id)
Redis:del(Gold.."Gold:List:myrdmyrd"..UserId..":"..msg.chat_id)
end
if text == "ردي" then
if not Redis:get(Gold.."onmyrd"..msg.chat_id) then
return send(msg.chat_id,msg.id,"*⇜ اضافة الردود للاعضاء معطلة*\n*⇜ لتفعيلها ( تفعيل ردود الاعضاء )*","md",true)
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
checkmyrde = Redis:get(Gold.."Gold:List:myrdmyrd"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(Gold.."Gold:Add:myrdid"..checkmyrde..msg.chat_id) then
myrd = Redis:get(Gold.."Gold:List:myrdmyrd"..msg.sender_id.user_id..":"..msg.chat_id)
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Bio = FlterBio(getbio(msg.sender_id.user_id))
local photo = bot.getUserProfilePhotos(msg.sender_id.user_id)
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ban.first_name
else
news = " لا يوجد اسم"
end
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد يوزر'
end
if photo and photo.total_count and photo.total_count > 0 then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n• الاسـم 𖦹 '..news..
'\n• اليـوزر 𖦹 ['..UserInfousername..
']\n• النبـذه 𖦹 ['..Bio..
']', "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendText(msg.chat_id,msg_id,
'\n• الاسـم 𖦹 '..news..
'\n• اليـوزر 𖦹 ['..UserInfousername..
']\n• النبـذه 𖦹 ['..Bio..
']', "md",false, false, false, false, reply_markup)
end
else
send(msg.chat_id, msg.id,"*⇜ لا يوجد لديك رد*\n*⇜ لأضافة ردك ( اضف ردي )*", 'md')
end
end
if text == "رده" and msg.reply_to_message_id ~= 0 then
if not Redis:get(Gold.."onmyrd"..msg.chat_id) then
return send(msg.chat_id,msg.id,"*⇜ اضافة الردود للاعضاء معطلة*\n*⇜ لتفعيلها ( تفعيل ردود الاعضاء )*","md",true)
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg_id,"\n*⇜ عـذراً .. تستطيع فقـط استخـدام الامـر على المستخدمين*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg_id,"\n*⇜ هييه مايمديك تستخدم الامر علي ياورع ؟!*","md",true)  
end
checkmyrde = Redis:get(Gold.."Gold:List:myrdmyrd"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
if Redis:get(Gold.."Gold:Add:myrdid"..checkmyrde..msg.chat_id) then
myrd = Redis:get(Gold.."Gold:List:myrdmyrd"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
local Bio = FlterBio(getbio(Message_Reply.sender_id.user_id))
local photo = bot.getUserProfilePhotos(Message_Reply.sender_id.user_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
if ban.first_name then
news = ban.first_name
else
news = " لا يوجد اسم"
end
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد يوزر'
end
if photo and photo.total_count and photo.total_count > 0 then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n• الاسـم 𖦹 '..news..
'\n• اليـوزر 𖦹 ['..UserInfousername..
']\n• النبـذه 𖦹 ['..Bio..
']', "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendText(msg.chat_id,msg_id,
'\n• الاسـم 𖦹 '..news..
'\n• اليـوزر 𖦹 ['..UserInfousername..
']\n• النبـذه 𖦹 ['..Bio..
']', "md",false, false, false, false, reply_markup)
end
else
send(msg.chat_id, msg.id,"*⇜ لا يوجد لديـه رد*\n*⇜ لأضافة رده يجب ان يرسل ( اضف ردي )*", 'md')
end
end
if text == "ردود الاعضاء" or text == "ردود اعضاء" then
if not Redis:get(Gold.."onmyrd"..msg.chat_id) then
return send(msg.chat_id,msg.id,"*⇜ اضافة الردود للاعضاء معطلة*\n*⇜ لتفعيلها ( تفعيل ردود الاعضاء )*","md",true)
end
if not msg.Addictive or not msg.Mddictive then
return send(msg.chat_id,msg_id,'\n*⇜ هـذا الامـر يخـص* ( '..Controller_Num(7)..' ) ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
local list = Redis:smembers(Gold.."Gold:List:myrd"..msg.chat_id.."")
text = "*⇜ قائمـة ردود الأعضـاء*\nٴ*⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆*\n"
for k,v in pairs(list) do
if Redis:get(Gold.."Gold:Add:myrdtext"..v..msg.chat_id) then
local rdid = Redis:get(Gold.."Gold:Add:myrdid"..v..msg.chat_id)
local ban = bot.getUser(rdid)
if ban.first_name then
news = ban.first_name
else
news = " لا يوجد اسم"
end
db = "["..ban.first_name.."](tg://user?id="..rdid..")"
end
text = text..""..k.." - ( "..v.." ) | ( "..db.." )\n"
end
if #list == 0 then
text = "*⇜ مافيه ردود اعضاء مضافة !* "
end
return send(msg.chat_id,msg_id,text,"md",true)  
end
if text == "مسح ردود الاعضاء" or text == "حذف ردود الاعضاء" then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هـذا الامـر يخـص* ( '..Controller_Num(6)..' ) ',"md",true)  
end
local list = Redis:smembers(Gold.."Gold:List:myrd"..msg.chat_id)
for k,v in pairs(list) do   
Redis:del(Gold.."Gold:Add:myrdtext"..v..msg.chat_id)
Redis:del(Gold.."Gold:Add:myrdid"..v..msg.chat_id)
Redis:del(Gold.."Gold:List:myrd"..msg.chat_id)
Redis:del(Gold.."Gold:List:myrdmyid"..msg.chat_id)
end
return send(msg.chat_id,msg_id,"*⇜ تم مسح جميع ردود الاعضاء*","md",true)
end
if text and Redis:get(Gold.."onmyrd"..msg.chat_id) then
local Texingt = Redis:get(Gold.."Gold:Add:myrdtext"..text..msg.chat_id)
if Texingt then
local Texingtowner = Redis:get(Gold.."Gold:Add:myrdid"..text..msg.chat_id)
local UserInfo = bot.getUser(Texingtowner)
local Bio = FlterBio(getbio(Texingtowner))
local photo = bot.getUserProfilePhotos(Texingtowner)
local ban = bot.getUser(Texingtowner)
if ban.first_name then
news = ban.first_name
else
news = " لا يوجد اسم"
end
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد يوزر'
end
if photo and photo.total_count and photo.total_count > 0 then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= UserInfo.first_name ,url = "tg://user?id="..UserInfo.id..""},
},
}
}
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n• Name 𖦹 '..news..
'\n• 𝖴𝗌𝖾𝗋𝗇𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖡𝗂𝗈 𖦹 ['..Bio..
']', "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return bot.sendText(msg.chat_id,msg_id,
'\n• Name 𖦹 '..news..
'\n• 𝖴𝗌𝖾𝗋𝗇𝖺𝗆𝖾 𖦹 ['..UserInfousername..
']\n• 𝖡𝗂𝗈 𖦹 ['..Bio..
']', "md")
end
end
end
-----------------
if text and text:match("^(.*)$") then
if Redis:get(Gold.."Gold:Set:myrd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
if text and #text:match("^(.*)$") >= 30 then
Redis:del(Gold.."Gold:Set:myrd"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg.chat_id, msg.id,"*⇜ قلل من عدد الاحرف*", 'md')
end
local Texingt = Redis:get(Gold.."Gold:Add:myrdtext"..text..msg.chat_id)
if Texingt == text then
return send(msg.chat_id,msg_id,"\n*⇜ عذراً عزيزي الرد ( "..text.." ) مضاف مسبقاً *","md",true)  
end
Redis:set(Gold.."Gold:List:myrdmyrd"..msg.sender_id.user_id..":"..msg.chat_id, text)
Redis:sadd(Gold.."Gold:List:myrdmyid"..msg.chat_id, msg.sender_id.user_id)
Redis:sadd(Gold.."Gold:List:myrd"..msg.chat_id, text)
Redis:set(Gold.."Gold:Add:myrdtext"..text..msg.chat_id, text)
Redis:set(Gold.."Gold:Add:myrdid"..text..msg.chat_id, msg.sender_id.user_id)
Redis:del(Gold.."Gold:Set:myrd"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg.chat_id, msg.id,"*⇜ واضفنا ردك ياحلو ✅*\n*⇜ اكتب (* "..text.." *) لـ تجربته*", 'md')
end
end
if text == 'ترتيب الاوامر' then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هـذا الامـر يخـص* ( '..Controller_Num(6)..' ) ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ا','ايدي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'م','رفع مميز')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'اد', 'رفع ادمن')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مد','رفع مدير')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'منش', 'رفع منشئ')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مط','رفع مطور')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تن','تنزيل الكل')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'را','الرابط')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رر','الردود')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'،،','مسح المكتومين')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رد','اضف رد')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'غ','غنيلي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رس','رسائلي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ثانوي','رفع مطور اساسي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مس','مسح تعديلاتي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ن','نقاطي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'س','اسالني')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ل','لغز')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مع','معاني')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ح','حزوره')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رف','رفع القيود')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'الغ','الغاء حظر')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ث','تثبيت')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ك','كشف')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تت','تاك')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تك','تاك للكل')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تغ','تغيير الايدي')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'قق','قفل الاشعارات')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'فف','فتح الاشعارات')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مر','مسح رد')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'امر','اضف امر')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ش','شعر')
Redis:set(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'غغ','اغنيه')
return send(msg.chat_id,msg_id,[[
*⇜ تم تـرتيب الاوامـر بالشكـل التالـي :*
ٴ*⋆┄─┄─┄─┄┄─┄─┄─┄─┄┄⋆*
⇜ ايدي - ا 
⇜ رفع مميز - م 
⇜ رفع ادمن - اد 
⇜ رفع مدير - مد 
⇜ رفع منشئ - منش 
⇜ رفع منشئ الاساسي - اس  
⇜ رفع مطور - مط 
⇜ رفع مطور ثانوي - ثانوي 
⇜ تنزيل الكل بالرد - تن 
⇜ تعطيل الايدي بالصوره - تعط 
⇜ تفعيل الايدي بالصوره - تفع 
⇜ تغيير الايدي - تغ 
⇜ تنزيل جميع الرتب - تنز 
⇜ قفل الاشعارات - قق 
⇜ فتح الاشعارات - فف 
⇜ الرابط - را
⇜ الردود - رر 
⇜ تثبيت - ث 
⇜ كشف - ك 
⇜ تاك - تت 
⇜ تاك للكل - تك 
⇜ رفع القيود - رف 
⇜ الغاء حظر - الغ 
⇜ مسح المكتومين - ،، 
⇜ اضف رد - رد 
⇜ مسح رد - مر 
⇜ اضف امر - امر 
⇜ مسح تعديلاتي - مس 
⇜ مسح رسائلي - رس 

]],"md")
end
if text == 'استعاده الاوامر' or text == "استعادة الاوامر" then
if not msg.Managers or not msg.Mamagers then
return send(msg.chat_id,msg_id,'\n*⇜ هـذا الامـر يخـص* ( '..Controller_Num(6)..' ) ',"md",true)  
end
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ا','ايدي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'م','رفع مميز')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'اد', 'رفع ادمن')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مد','رفع مدير')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'منش', 'رفع منشئ')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مط','رفع مطور')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تن','تنزيل الكل')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'را','الرابط')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رر','الردود')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'،،','مسح المكتومين')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رد','اضف رد')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مس','مسح تعديلاتي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'غ','غنيلي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رس','رسائلي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ن','نقاطي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'س','اسالني')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ل','لغز')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مع','مغاني')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ح','حزوره')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'رف','رفع القيود')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'الغ','الغاء حظر')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ث','تثبيت')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ك','كشف')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تت','تاك')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تك','تاك للكل')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تغ','تغيير الايدي')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'تنزل','تنزيل جميع الرتب')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'قق','قفل الاشعارات')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'فف','فتح الاشعارات')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'مر','مسح رد')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'امر','اضف امر')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'ش','شعر')
Redis:del(Gold.."Gold:Get:Reides:Commands:Group"..msg.chat_id..":"..'غغ','اغنيه')
return send(msg.chat_id,msg_id,[[*
⇜ تم استعادة الاوامر
*]],"md")
end
if text == "احسب عمري" or text == "احسب العمر" or text == "حساب العمر" then
if Redis:sismember(Gold.."Gold:Text:Cmd:Lock"..msg_chat_id,text) then
if Locks_Status(msg.sender_id.user_id,msg,text) ~= "noon" then
return send(msg_chat_id,msg_id,Locks_Status(msg.sender_id.user_id,msg,text),"md",true)
end
end
if not Redis:get(Gold.."myages"..msg.chat_id) then
Redis:setex(Gold.."Age:send:"..msg.chat_id..":"..msg.sender_id.user_id, 30, true)
return send(msg.chat_id, msg.id,"⇜ ارسل عمرك بالصيغيه التالية :\n يوم/شهر/سنة\n- مثال : 20/2/2002 ", 'md')
end
end
if text and Redis:get(Gold.."Age:send:"..msg.chat_id..":"..msg.sender_id.user_id) then
if text and text:match('(%d+)/(%d+)/(%d+)') then
local input = {text:match('(%d+)/(%d+)/(%d+)')}
local day = input[1]
local month = input[2]
local year = input[3]
local api = http.request("http://ahmed-yad.ml/Anubis/birth_day_pro.php?day="..day.."&month="..month.."&year="..year)
local api_decode = JSON.decode(api)
if not api_decode["العمر الميلادي"] then
return send(msg.chat_id, msg.id,"⇜ صيغة العمر خطأ\n ⇜ ارسل عمرك بالصيغيه التالية :\n يوم/شهر/سنة\n- مثال : 20/2/2002", 'md')
end
local birth_date = "- عمرك الميلادي : "..api_decode["العمر الميلادي"]
local birth_hijri = "- عمرك الهجري : "..api_decode["العمر الهيجري"]
local next_birth_day = "- عيد ميلادك القادم : ".. api_decode["عيد الميلاد القادم"]
local birth_months = "- عمرك بالاشهر : " .. api_decode["العمر بالشهور"]
local birth_weeks = "- عمرك بالاسابيع : ".. api_decode["العمر بالاسابيع"]
local birth_days = "- عمرك بالايام : ".. api_decode["العمر بالايام"]
local birth_hours = "- عمرك بالساعات : ".. api_decode["العمر بالساعات"]
local birth_day_name = "- ولدت يوم : ".. api_decode["يوم الميلاد"]
local in_Season = "- فصل : ".. api_decode["ولد في فصل"]
local brg = "- برجك : ".. api_decode["برج"]
local breath = "- اتنفست : ".. api_decode["عدد الانفاس"].." نفس 🫁"
local heart_beat = "- نبضات قلبك : ".. api_decode["عدد نبضات القلب"] .." نبضه 🫀"
local lol = "- ضحكت : ".. api_decode["كم مره ضحك"].."ضحكه 😂"
local sleep_time = "- نمت : ".. api_decode["مده النوم في العمر"].." ساعه 🕔"
local eat_times = api_decode["مده الاكل في العمر"]
Redis:del(Gold.."Age:send:"..msg.chat_id..":"..msg.sender_id.user_id)
local Msg_text = birth_date.."\n"..birth_hijri.."\n"..birth_months.."\n"..birth_weeks.."\n"..birth_days.."\n"..birth_hours.."\n"..birth_day_name.." "..in_Season.." "..brg.."\n"..breath.."\n"..heart_beat.."\n"..lol.."\n"..sleep_time.."\n✬"
return send(msg.chat_id, msg.id,Msg_text, 'html')
else
return send(msg.chat_id, msg.id,"⇜ صيغة العمر خطأ\n ⇜ ارسل عمرك بالصيغيه التالية :\n يوم/شهر/سنة\n- مثال : 20/2/2002", 'md')
end
end
if text == "بوت" and not Redis:get(Gold.."BotaTyp") then
local NamesBot = (Redis:get(Gold.."Gold:Name:Bot") or "بووت")
local ban = bot.getUser(msg.sender_id.user_id)
Botyname = "*عمـري*  ["..ban.first_name.."](tg://user?id="..ban.id..")  *اسمـي "..NamesBot.." 🧸♥️*"
send(msg.chat_id,msg_id,Botyname,"md") 
end
if text == (Redis:get(Gold.."Gold:Name:Bot") or "بووت") and not Redis:get(Gold.."BotaTyp") then
local NamesBot = (Redis:get(Gold.."Gold:Name:Bot") or "بووت")
local BotName = {
'*زعلان*',
'*عيوني*',
'*لبيه*',
'*مو فاضي*'
}
send(msg.chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if text == "بوت" and Redis:get(Gold.."BotaTyp") then
local NamesBot = (Redis:get(Gold.."Gold:Name:Bot") or "بوته")
local ban = bot.getUser(msg.sender_id.user_id)
Botyname = "*ياروحها*  ["..ban.first_name.."](tg://user?id="..ban.id..")  *اسمـي "..NamesBot.." 🧸♥️*"
send(msg.chat_id,msg_id,Botyname,"md") 
end
if text == (Redis:get(Gold.."Gold:Name:Bot") or "بوته") and Redis:get(Gold.."BotaTyp") then
local NamesBot = (Redis:get(Gold.."Gold:Name:Bot") or "بوته")
local BotName = {
'*زعلانه*',
'*ياعمرها*',
'*روحها انت*',
'*عيونها*',
'*مو فاضيه*'
}
send(msg.chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if (text == "القوانين" or text == "قوانين" or text == "قق") and msg.chat_id == "-1001935599871" then
local Rules = Redis:get(Gold.."Gold:Group:Rules" .. msg.chat_id)   
if Rules then     
return send(msg.chat_id,msg_id,Rules,"md",true)     
else      
local zorder =[[
*- قـوانيـن المجمـوعـة  ⚠️ :*
ٴ*⋆┄─┄─┄─┄─┄─┄─┄─┄⋆*

.𝟭.  *يُمنع ارسال اي اوامر او التكلم عن اي سورسات ثانيه غير ماتركش*


.𝟮.  *يُمنع منعا باتا الدخول خاص لمشرفات القروب اواي بنت منصبه هنا*


.𝟯.  *يُمنع السب والغلط والفشار سواء ع مشرفين القروب او الاعضاء*


.𝟰.  *يُمنع ارسال اي روابط او توجيهات خارجة عن موضوع السورس*


.𝟱.  *يُمنع الكلام الجانبي اثناء الاستفسارات او عند التحذير بذلك*


.𝟲.  *يُمنع طلب تنصيب او اضافة فيزا او التوثيق او انشاء حساب من الغير*


.𝟳.  *يُمنع سحب الناس خاص او اخذ اكواد منهم الا بإذن من احد المشرفين*


.𝟴.  *يُمنع منعا باتاً التنصيب بمقابل او التسويق لذلك الا لـ المشرفين فقط*


.𝟵.  *يُمنع طلب رتبه ويُمنع اي مشرف اعطاء حدا رتبه سواء في البوت او اشراف*


.𝟭𝟬.  *اوقات تقييد المجموعة في حال عندك استفسار تستطيع الدخول للمشرفين خاص ماعدا البنات او انتظر لحتى يعاد فتح المجموعة*



*اي شخص يخالف القوانين المذكورة سابقا يقابل بالتحذير ماعدا المخالفات رقم 𝟭 & 𝟮 تقابل بالكتم او القييد او الحظر وعقوبات اخرى رادعه*
]]
return send(msg.chat_id,msg_id,zorder,"md",true)   
end
end
if text == "قنوات فولت" or text == "القنوات" then
local zthon =[[
*- قنـوات سـورس فـولـت :*
ٴ*⋆┄─┄─┄─┄─┄─┄─┄─┄⋆*
[• قنـاة السـورس الرسميـة](https://t.me/qqvqqs) .

[• قنـاة التحديثـات](https://t.me/+_aqorTcLPd5jMmFk) .

[•  مطـور السـورس](https://t.me/ykrky) .
]]
return send(msg.chat_id,msg_id,zthon,"md",true)   
end
--------------------------------------------------------------------------------------------------------------


end
return {Gold = rdood}
