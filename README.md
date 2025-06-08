# 🎵 Friend Reminder - สคริปต์เตือนสติเพื่อน

สคริปต์เพื่อเตือนเพื่อนๆ ให้ดูแลสุขภาพ และได้รับความบันเทิงเล็กๆ น้อยๆ พร้อมกัน! 😄

![Bash](https://img.shields.io/badge/bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![macOS](https://img.shields.io/badge/macos-000000?style=for-the-badge&logo=apple&logoColor=white)
![GitHub stars](https://img.shields.io/github/stars/robotoakiar/friend-reminder?style=social)
![GitHub forks](https://img.shields.io/github/forks/robotoakiar/friend-reminder?style=social)

## 🚀 วิธีใช้งานแบบด่วน

### แบบง่ายสุด (แนะนำ) ⭐
```bash
curl -sL https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash
```

### แบบใช้ wget
```bash
wget -qO- https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash
```

### แบบไม่เปิดสื่อ (เงียบๆ) 🔇
```bash
SKIP_MEDIA=1 curl -sL https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash
```

### แบบ Short URL (สำหรับแชร์เพื่อน) 📲
```bash
# จะอัพเดทเมื่อมี bit.ly link
curl -sL bit.ly/KMITL42 | bash
```

## 🎯 คุณสมบัติ

- ✅ **รองรับทุกระบบ** - Linux, macOS, และ Windows (WSL/Cygwin)
- ✅ **ไม่ต้องติดตั้งอะไร** - ใช้ curl หรือ wget เท่านั้น
- ✅ **ข้อความเตือนสติ** - 8 ข้อความที่มีประโยชน์จริง
- ✅ **ASCII Art สวยงาม** - แอนิเมชั่นและสีสันสดใส
- ✅ **เซอร์ไพรส์เล็กๆ** - เสียงและวิดีโอ (ถ้าต้องการ)
- ✅ **ปลอดภัย 100%** - ไม่ทำลายระบบ ไม่ต้อง sudo
- ✅ **ปรับแต่งได้** - มี option เปิด/ปิดสื่อ
- ✅ **ใช้ง่าย** - คำสั่งเดียวเท่านั้น

## 📝 ข้อความเตือนสติที่จะได้รับ

🍔 **สุขภาพ** - เตือนดูแลการกินอาหารและดื่มน้ำ  
👥 **ครอบครัว** - เตือนโทรหาคนที่รัก  
😴 **การพักผ่อน** - เตือนนอนให้เพียงพอ  
🌱 **ออกกำลังกาย** - เตือนเคลื่อนไหวร่างกาย  
📚 **การเรียนรู้** - เตือนอ่านหนังสือและพัฒนาตัวเอง  
😊 **ความสุข** - เตือนยิ้มและมองโลกในแง่ดี  
🎵 **ความบันเทิง** - เพลงและความสนุกเล็กๆ น้อยๆ  
💝 **และเซอร์ไพรส์พิเศษ** - ที่จะทำให้คุณยิ้ม!

## 🎬 ตัวอย่างผลลัพธ์

```
กำลังตรวจสอบความปลอดภัยของระบบ...
[1/5] กำลังสแกนไฟล์... ████████████████████ ✓
[2/5] กำลังสแกนไฟล์... ████████████████████ ✓
...
⚠️  พบสิ่งผิดปกติ! กำลังแสดงรายงาน... ⚠️

 ███████╗███████╗████████╗██╗   ██╗██████╗ ███╗   ██╗███████╗ █████╗ ████████╗██╗
 ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗████╗  ██║██╔════╝██╔══██╗╚══██╔══╝██║
 █████╗  █████╗     ██║   ██║   ██║██████╔╝██╔██╗ ██║███████╗███████║   ██║   ██║
 ...

📢 ข้อความเตือนสติจากเพื่อน:
1. 🍔 วันนี้กินข้าวหรือยัง? อย่าลืมดูแลสุขภาพนะ
2. 💧 ดื่มน้ำเปล่าวันละ 2 ลิตร เพื่อสุขภาพที่ดี
...

🎉 You've been RICKROLLED! 🎉
แต่ได้ข้อความเตือนสติมาด้วยนะ! 😄
```

## 🛠 การใช้งานขั้นสูง

### ⚙️ ตัวแปรสำหรับปรับแต่ง
```bash
# ปิดการเล่นสื่อทั้งหมด
SKIP_MEDIA=1 curl -sL https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash

# ปิดการใช้สี (สำหรับ terminal เก่า)
NO_COLOR=1 curl -sL https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash

# รวมทั้งสองแบบ
SKIP_MEDIA=1 NO_COLOR=1 curl -sL https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash
```

### 📱 การแชร์ให้เพื่อน
```bash
# วิธีที่ 1: ส่งคำสั่งตรงๆ
"เฮ้ย! ลองรันคำสั่งนี้ดูสิ มีข้อความดีๆ ให้:
curl -sL https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash"

# วิธีที่ 2: แกล้งเป็นการอัพเดท
"อัพเดทระบบหน่อย: curl -sL bit.ly/your-link | bash"

# วิธีที่ 3: ซ่อนใน .bashrc
echo 'alias system-check="curl -sL https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh | bash"' >> ~/.bashrc
```

### 🔄 การติดตั้งถาวร
```bash
# ดาวน์โหลดมาเก็บไว้
wget https://raw.githubusercontent.com/robotoakiar/friend-reminder/main/remind.sh
chmod +x remind.sh
./remind.sh

# หรือใส่ใน PATH
sudo cp remind.sh /usr/local/bin/remind-friend
remind-friend
```

## 📊 สถิติและติดตาม

### 🔍 การตรวจสอบการใช้งาน
```bash
# ดูจำนวน stars และ forks
curl -s https://api.github.com/repos/robotoakiar/friend-reminder | jq '{stars: .stargazers_count, forks: .forks_count, watchers: .watchers_count}'

# เช็ควันที่อัพเดทล่าสุด
curl -s https://api.github.com/repos/robotoakiar/friend-reminder | jq '.updated_at'
```

### 📈 GitHub Analytics
- ไปที่ [GitHub Insights](https://github.com/robotoakiar/friend-reminder/pulse) เพื่อดูสถิติ
- ตรวจสอบ Traffic และ Popular content

## ❓ FAQ

**Q: สคริปต์นี้ปลอดภัยมั้ย?**  
A: ใช่! ไม่มีการใช้ `sudo` หรือแก้ไขไฟล์สำคัญ เป็นเพียงการแสดงข้อความและเปิดเบราว์เซอร์

**Q: ทำไมถึงเปิด YouTube?**  
A: เป็นส่วนหนึ่งของความสนุก! แต่สามารถปิดได้ด้วย `SKIP_MEDIA=1`

**Q: ใช้ได้กับ WSL มั้ย?**  
A: ได้! รองรับ Windows Subsystem for Linux

**Q: จะหยุดเสียงยังไง?**  
A: กด `Ctrl+C` ใน terminal หรือปิด tab เบราว์เซอร์

**Q: สามารถปรับแต่งข้อความได้มั้ย?**  
A: ได้! Fork repo นี้แล้วแก้ไขไฟล์ `remind.sh`

## 🤝 การมีส่วนร่วม

ยินดีรับ Pull Request และ Issue ทุกประเภท! 🎉

### 🚀 Quick Start
```bash
# Fork แล้ว clone
git clone https://github.com/YOUR_USERNAME/friend-reminder.git
cd friend-reminder

# สร้าง branch ใหม่
git checkout -b feature/awesome-feature

# แก้ไขและทดสอบ
./remind.sh

# Commit และ push
git add .
git commit -m "✨ Add awesome feature"
git push origin feature/awesome-feature
```

### 💡 ไอเดียสำหรับพัฒนา
- [ ] 🌐 รองรับภาษาอื่นๆ (English, Japanese)
- [ ] 🎨 ASCII art แบบใหม่
- [ ] 📱 Version สำหรับ PowerShell/CMD
- [ ] ⏰ ระบบแจ้งเตือนตามเวลา
- [ ] 🎲 ข้อความเตือนสติแบบสุ่ม
- [ ] 📞 Integration กับ Discord/Slack
- [ ] 🖼️ รองรับ GIF และรูปภาพ

### 🏆 Contributors
<a href="https://github.com/robotoakiar/friend-reminder/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=robotoakiar/friend-reminder" />
</a>

## ⚠️ ข้อควรระวัง

### ✅ ควรทำ
- ใช้เพื่อความบันเทิงกับเพื่อนสนิท
- ทดสอบก่อนแชร์ให้คนอื่น
- อ่าน source code ก่อนรัน script จากคนแปลกหน้า

### ❌ ไม่ควรทำ
- ใช้ในสภาพแวดล้อมงานที่เป็นทางการ
- รันสคริปต์จากแหล่งที่ไม่เชื่อถือ
- แชร์ให้คนที่ไม่รู้จักหรือไม่สนิท

## 📞 ติดต่อและสนับสนุน

- 🐛 **พบ Bug?** → [เปิด Issue](https://github.com/robotoakiar/friend-reminder/issues)
- 💡 **มีไอเดีย?** → [Discussion](https://github.com/robotoakiar/friend-reminder/discussions)
- ⭐ **ชอบโปรเจกต์?** → กด Star และ Share!
- 📧 **อื่นๆ** → ดู profile สำหรับข้อมูลติดต่อ

## 📜 License

```
MIT License - ใช้ได้อย่างอิสระ! 🆓

Copyright (c) 2024 robotoakiar
```
รายละเอียดเต็มใน [LICENSE](LICENSE) file

## 🎉 Credits และขอบคุณ

- 🎵 **Rick Astley** - สำหรับเพลงที่ไม่มีวันเบื่อ
- 🐧 **Linux Community** - สำหรับเครื่องมือ CLI ที่ยอดเยี่ยม
- 🌈 **ASCII Art Artists** - สำหรับแรงบันดาลใจ
- 💝 **เพื่อนๆ ทุกคน** - ที่ทำให้โลกนี้สนุกขึ้น

---

<div align="center">

### 🌟 หากชอบโปรเจกต์นี้ อย่าลืมกด Star นะ! 🌟

[![GitHub stars](https://img.shields.io/github/stars/robotoakiar/friend-reminder.svg?style=social&label=Star)](https://github.com/robotoakiar/friend-reminder)
[![GitHub forks](https://img.shields.io/github/forks/robotoakiar/friend-reminder.svg?style=social&label=Fork)](https://github.com/robotoakiar/friend-reminder)

**"ความสุขจะเพิ่มขึ้นเมื่อแบ่งปัน... รวมถึงการ Rickroll ด้วย! 😄"**

</div>
