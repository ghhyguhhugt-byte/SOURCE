#!/bin/bash
# ============================================================
#  تحديث + إعادة تشغيل نظيف للبوت
#  Usage:  ./update.sh
# ============================================================
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR" || exit 1

echo "⇜ ١. وقف كل نسخ البوت..."
pkill -f "lua5.3 Gold.lua" 2>/dev/null
screen -S bot -X quit 2>/dev/null
sleep 2
# نتأكد إن كل النسخ اتقفلت
REMAIN=$(pgrep -f "lua5.3 Gold.lua" | wc -l)
if [ "$REMAIN" -gt 0 ]; then
    pkill -9 -f "lua5.3 Gold.lua" 2>/dev/null
    sleep 1
fi

echo "⇜ ٢. سحب التحديث..."
git checkout -- . 2>/dev/null
if ! git pull; then
    echo "✘ فشل السحب — وقّف هنا"
    exit 1
fi

echo "⇜ ٣. تجهيز TDLib..."
[ -f tdlua.so ] || unzip -o tdlua.zip > /dev/null

echo "⇜ ٤. تشغيل البوت..."
screen -S bot -d -m lua5.3 Gold.lua
sleep 3

echo "⇜ ٥. الحالة:"
screen -ls
echo ""
echo "عدد نسخ البوت الشغالة: $(pgrep -f 'lua5.3 Gold.lua' | wc -l)  (المفروض ١)"
echo ""
echo "لمتابعة الأخطاء:  tail -f /tmp/bot_errors.log"
