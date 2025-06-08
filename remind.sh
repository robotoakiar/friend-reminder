#!/bin/bash
# สคริปต์เตือนสติเพื่อน (Friend Reminder Script)
# ใช้งาน: curl -sL https://github.com/yourusername/friend-reminder/raw/main/remind.sh | bash
# หรือ: wget -qO- https://github.com/yourusername/friend-reminder/raw/main/remind.sh | bash

set -e

# สี ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color
RAINBOW=('\033[0;31m' '\033[0;33m' '\033[0;32m' '\033[0;36m' '\033[0;34m' '\033[0;35m')

# ตรวจสอบระบบปฏิบัติการ
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        OS="windows"
    else
        OS="unknown"
    fi
}

# ฟังก์ชันแสดงข้อความสีรุ้ง
rainbow_text() {
    local text="$1"
    local i=0
    for (( j=0; j<${#text}; j++ )); do
        echo -en "${RAINBOW[$((i % 6))]}${text:$j:1}"
        ((i++))
    done
    echo -e "${NC}"
}

# ฟังก์ชันสร้าง ASCII Art แบบง่าย
simple_figlet() {
    local text="$1"
    case "$text" in
        "เตือนสติ")
            cat << 'EOF'
 ███████╗███████╗████████╗██╗   ██╗██████╗ ███╗   ██╗███████╗ █████╗ ████████╗██╗
 ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗████╗  ██║██╔════╝██╔══██╗╚══██╔══╝██║
 █████╗  █████╗     ██║   ██║   ██║██████╔╝██╔██╗ ██║███████╗███████║   ██║   ██║
 ██╔══╝  ██╔══╝     ██║   ██║   ██║██╔══██╗██║╚██╗██║╚════██║██╔══██║   ██║   ██║
 ███████╗███████╗   ██║   ╚██████╔╝██║  ██║██║ ╚████║███████║██║  ██║   ██║   ██║
 ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝
EOF
            ;;
        "GOTCHA")
            cat << 'EOF'
  ██████╗  ██████╗ ████████╗ ██████╗██╗  ██╗ █████╗ 
 ██╔════╝ ██╔═══██╗╚══██╔══╝██╔════╝██║  ██║██╔══██╗
 ██║  ███╗██║   ██║   ██║   ██║     ███████║███████║
 ██║   ██║██║   ██║   ██║   ██║     ██╔══██║██╔══██║
 ╚██████╔╝╚██████╔╝   ██║   ╚██████╗██║  ██║██║  ██║
  ╚═════╝  ╚═════╝    ╚═╝    ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝
EOF
            ;;
        *)
            echo "=== $text ==="
            ;;
    esac
}

# ฟังก์ชันแสดง ASCII cow (แบบง่าย)
simple_cow() {
    local message="$1"
    cat << EOF
 ___________________
< $message >
 -------------------
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
EOF
}

# ฟังก์ชันเล่นเสียง
play_audio() {
    local url="$1"
    case "$OS" in
        "macos")
            if command -v afplay >/dev/null 2>&1; then
                curl -s "$url" | afplay - >/dev/null 2>&1 &
            elif command -v say >/dev/null 2>&1; then
                say "Never gonna give you up, never gonna let you down" >/dev/null 2>&1 &
            fi
            ;;
        "linux")
            if command -v mpv >/dev/null 2>&1; then
                mpv --no-video --volume=50 "$url" >/dev/null 2>&1 &
            elif command -v paplay >/dev/null 2>&1; then
                curl -s "$url" | paplay >/dev/null 2>&1 &
            elif command -v espeak >/dev/null 2>&1; then
                echo "Never gonna give you up" | espeak >/dev/null 2>&1 &
            fi
            ;;
        "windows")
            # Windows จะใช้ PowerShell แทน
            echo "Playing audio on Windows requires PowerShell"
            ;;
    esac
}

# ฟังก์ชันเปิด browser
open_browser() {
    local url="$1"
    case "$OS" in
        "macos")
            command -v open >/dev/null 2>&1 && open "$url" >/dev/null 2>&1 &
            ;;
        "linux")
            if command -v xdg-open >/dev/null 2>&1; then
                xdg-open "$url" >/dev/null 2>&1 &
            elif command -v firefox >/dev/null 2>&1; then
                firefox "$url" >/dev/null 2>&1 &
            elif command -v google-chrome >/dev/null 2>&1; then
                google-chrome "$url" >/dev/null 2>&1 &
            fi
            ;;
        "windows")
            command -v start >/dev/null 2>&1 && start "$url" >/dev/null 2>&1 &
            ;;
    esac
}

# ฟังก์ชันแสดงข้อความหลอกๆ
fake_loading() {
    echo -e "${CYAN}กำลังตรวจสอบความปลอดภัยของระบบ...${NC}"
    for i in {1..5}; do
        echo -ne "${YELLOW}[$i/5] กำลังสแกนไฟล์... ${NC}"
        for j in {1..20}; do
            echo -ne "█"
            sleep 0.05
        done
        echo -e " ${GREEN}✓${NC}"
    done
    echo -e "${RED}⚠️  พบสิ่งผิดปกติ! กำลังแสดงรายงาน... ⚠️${NC}"
    sleep 1
}

# ฟังก์ชันแสดงข้อความเตือนสติ
show_reminder() {
    cat << 'EOF'

📢 ข้อความเตือนสติจากเพื่อน:

1. 🍔 วันนี้กินข้าวหรือยัง? อย่าลืมดูแลสุขภาพนะ
2. 💧 ดื่มน้ำเปล่าวันละ 2 ลิตร เพื่อสุขภาพที่ดี
3. 👥 โทรหาครอบครัวบ้างมั้ย? เขาคิดถึงเธอ
4. 😴 นอนให้เพียงพอ อย่าดึกเกินไป
5. 🌱 ออกกำลังกายสัก 30 นาทีต่อวัน
6. 📚 อ่านหนังสือหรือเรียนรู้สิ่งใหม่ๆ บ้าง
7. 😊 ยิ้มให้คนรอบข้าง โลกจะสดใสขึ้น
8. 🎵 ฟังเพลงที่ชอบ เพื่อผ่อนคลายจิตใจ

PS: และอย่าลืม... 

EOF
}

# ฟังก์ชันหลัก
main() {
    clear
    detect_os
    
    # ซ่อน cursor
    echo -e "\033[?25l"
    
    # แสดงการโหลดปลอม
    fake_loading
    
    # แสดงข้อความเตือนสติ
    echo -e "${WHITE}"
    simple_figlet "เตือนสติ"
    echo -e "${NC}"
    
    show_reminder
    
    # ASCII art ขั้นสุดท้าย
    echo -e "${RED}"
    simple_figlet "GOTCHA"
    echo -e "${NC}"
    
    # ข้อความสุดท้าย
    echo -e "${PURPLE}"
    simple_cow "Never gonna give you up!"
    echo -e "${NC}"
    
    rainbow_text "🎵 Never gonna give you up, Never gonna let you down 🎵"
    rainbow_text "🎵 Never gonna run around and desert you! 🎵"
    
    echo ""
    echo -e "${CYAN}🎉 You've been RICKROLLED! 🎉${NC}"
    echo -e "${YELLOW}แต่ได้ข้อความเตือนสติมาด้วยนะ! 😄${NC}"
    echo ""
    
    # เล่นเสียงและเปิด browser
    if [ "${SKIP_MEDIA:-}" != "1" ]; then
        echo -e "${GREEN}กำลังเปิดของขวัญพิเศษ... 🎁${NC}"
        play_audio "https://www.youtube.com/watch?v=dQw4w9WgXcQ" 
        sleep 1
        open_browser "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    fi
    
    # แสดง cursor กลับ
    echo -e "\033[?25h"
    
    # ข้อความปิดท้าย
    echo -e "${WHITE}ขอบคุณที่เป็นเพื่อนที่ดี! 💝${NC}"
    echo -e "${CYAN}ไว้เจอกันใหม่นะ! (และระวังการคลิกลิงก์แปลกๆ ด้วย 😉)${NC}"
    echo ""
}

# ฟังก์ชันทำความสะอาดเมื่อมีการยกเลิก
cleanup() {
    echo -e "\n${RED}กำลังยกเลิก...${NC}"
    echo -e "\033[?25h"  # แสดง cursor
    pkill -f "mpv.*youtube" 2>/dev/null || true
    pkill -f "afplay" 2>/dev/null || true
    exit 0
}

# ตั้งค่า trap สำหรับการยกเลิก
trap cleanup INT TERM

# ตรวจสอบว่าเป็นการเรียกใช้ตรงๆ หรือผ่าน curl
if [ "${BASH_SOURCE[0]}" = "${0}" ] || [ -z "${BASH_SOURCE[0]}" ]; then
    # แสดงข้อมูลการใช้งาน
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        cat << 'EOF'
สคริปต์เตือนสติเพื่อน v1.0

วิธีใช้:
  # ทางโดยตรง
  ./remind.sh

  # ผ่าน curl
  curl -sL https://your-repo.com/remind.sh | bash

  # ข้ามการเปิดสื่อ
  SKIP_MEDIA=1 curl -sL https://your-repo.com/remind.sh | bash

  # ดูวิธีใช้
  ./remind.sh --help

หมายเหตุ: สคริปต์นี้จะเปิด YouTube และอาจเล่นเสียง
ใช้ SKIP_MEDIA=1 เพื่อข้ามส่วนนี้

EOF
        exit 0
    fi
    
    # รันฟังก์ชันหลัก
    main
fi

# ข้อมูลสำหรับผู้พัฒนา
# Repository: https://github.com/yourusername/friend-reminder
# License: MIT
# เขียนด้วยความรักและความซุกซน 💝
