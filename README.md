# بوت تيليجرام — سورس

بوت تيليجرام كامل شغال على **Lua 5.3** + **TDLib** + **Redis**.
شغّال من غير ما يطلب منك حاجة غير التوكن.

---

## التشغيل السريع

```bash
# 1) افتح config.lua وحط توكنك
nano config.lua
#    Token = "123456789:AAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",

# 2) شغّل
./Run
```

من غير غير ده. لو التوكن فاضي أو مش موجود، البوت بيقولك على الشاشة بالحرف إيه الناقص وبيرجع — **مش بيسألك أي حاجة**.

---

## المتطلبات

| الحاجة | الأمر |
|---|---|
| Lua 5.3 | `apt install lua5.3 liblua5.3-dev` |
| Redis | `apt install redis-server` && `systemctl start redis` |
| LuaSocket + LuaSec | `luarocks install luasocket luasec luautf8` |
| TDLib | ملف `tdlua.so` جاهز جوّه `tdlua.zip` — `Run` بيفكّه لوحده |
| أدوات | `apt install build-essential zip unzip curl` |

**اختياري** (لو عايز خاصية الذكاء الاصطناعي `بوت`، أو فلتر الإباحية):
```bash
pip install yt-dlp gtts opencv-python tensorflow keras nsfw-detector
```

---

## الإعدادات — `config.lua`

| الحقل | لازم؟ | الوصف |
|---|---|---|
| `Token` | ✅ **لازم** | توكن البوت من [@BotFather](https://t.me/BotFather) |
| `SudoId` | اختياري | آيدي حسابك الرقمي. من غيره مفيش أوامر مطور |
| `UserSudo` | اختياري | يوزرنيمك بدون `@` |
| `ApiId` / `ApiHash` | اختياري | من [@mybots](https://t.me/mybots). لو فاضيين، بيشتغلوا بقيم السورس |
| `OpenAiKey` | اختياري | مفتاح OpenAI — لو فاضي، أمر `بوت` يردّ saying إنه مقفول |

الليналь تغيير إعدادات تقدر تعملها من جوه البوت نفسه بأمر `تغيير المطور الاساسي` — بيعدّل `config.lua` على طول.

---

## التشغيل على طول (screen / systemd)

```bash
# screen
screen -S bot -d -m ./Run

# أو systemd
sudo tee /etc/systemd/system/telebot.service <<'EOF'
[Unit]
Description=Telegram Bot
After=network.target redis-server.service

[Service]
User=YOUR_USER
WorkingDirectory=/path/to/source
ExecStart=/usr/bin/screen -S bot -d -m ./Run
Restart=always

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable --now telebot
```

---

## الملفات

```
config.lua      ← الإعدادات (الملف الوحيد اللي بتعدّله)
Gold.lua        ← الملف الرئيسي: الرتب، الأوامر، التوجيه
Callback.lua    ← أزرار Inline + ردود على الرسائل المعدّلة
Games.lua       ← الألعاب
Bank.lua        ← البنك + الملفات الصوتية
locks.lua       ← الأقفال (كتم/طرد/تقييد)
rotba.lua       ←●● roadblocks / الروابط
rdood.lua       ← الردود
zhrfa.lua       ← الزخرفة
porno.lua       ← فلتر الإباحية (يحتاج open_nsfw.h5 + detect.py)
smsm.lua        ← الردود الذكية (سقسمة)
Youtube.lua     ← تحميل من يوتيوب / تيك / ساوند / فيس
libs/           ← المكتبات
tdlua.zip       ← TDLib مُجمّع
```

كل بلاجن بيرجع `{ Gold = function_name }` و `Gold.lua` بيحمّله بـ `dofile`.

---

## ملاحظات أمنية

**اتعمل في السورس ده:**
- 🔒 كل آيدي المطور الأصلي اتشال — رتبك انت بس من `config.lua`
- 🔒 مفتاح OpenAI اللي كان مكتوب جوه الكود اتشال (كان مكشوف على النت) — دلوقتي من `config.lua`
- 🔒 7 ثغرات command injection اتقفلت (روابط يوتيوب/ساوند + نصوص TTS) بـ `shq()` اللي بتقفل النص في quotes
- 🔒 التوكن مابقاش بيتكتب في Redis ولا `Information.lua`

**خلي بالك:**
- ⚠️ Redis **من غير كلمة سر** — أي حد على نفس الشبكة يقدر يوصله. لو السيرفر عام، حط `requirepass` في `redis.conf`
- ⚠️ كله بيشتغل بصلاحيات `lua5.3` عادي دلوقتي (الصانع كان بيشغّله بـ `sudo` — اتشال)
- ⚠️ `tdlua.so` باينARY مجمّع — مفيش source بتاعه. لو مش واثق، فحصه قبل ما تشغّله
- ⚠️ في أوامر بتطلب صلاحيات أدمن في الجروب (طرد/كتم) — لازم البوت يكون أدمن

---

## الاستخدام

الأوامر بتشتغل ببعت اسم البوت + مسافة:
```
<اسم البوت> قفل
<اسم البوت> حذف
```

أو مباشرة لو `Bot_Name` مضبوط. جوه الخاص:
```
رفعDeveloper  ← اضغط الزر
```

الأهم: **لازم البوت يكون أدمن في أي جروب** — كل أوامر الأقفال بتفشل من غير كده.
