#!/usr/bin/env python3
# Author Neo
# Official repository:
# https://github.com/Neotoxic-off/mms/

import os
import sys

version = "2.0.1"

action  = " ~> "
message = "==> "
read    = "  >  "
year = "2020"

def helpme():
    print(message, "Binary Name")
    print("     Name of the output")
    print(message, "Library Name")
    print("     Name of the lib to compile for the program")
    print(message, "Library Path")
    print("     Path of the lib to compile for the program")
    print(message, "H Path")
    print("     Path of the .h file")

def config_root():
    binary  = "binary"
    libname = "libmy.a"
    libpath = "./lib/my/"
    hfile   = "./include/my.h"
    root(binary, libname, libpath, hfile)

def root(binary, libname, libpath, hfile):
    if os.path.exists("Makefile"):
        os.remove("Makefile")
    f = open("Makefile", "x")
    f.write("##\n## EPITECH PROJECT, " + year + "\n## Makefile\n## File description:\n## Makefile\n##\n\n")

    f.write("OBJS\t=\t$(patsubst %.c, %.o, $(wildcard ./src/*.c))\n\n")

    f.write("LIBNAME\t=\t" + libname + "\n")
    f.write("LIBPATH\t=\t" + libpath + "\n\n")

    f.write("HFILE\t=\t" + hfile + "\n\n")

    f.write("NAME\t=\t" + binary + "\n\n")

    f.write("CFLAGS\t=\t-I ./include\n")
    f.write("CFLAGS\t+=\t-g3\n")
    f.write("CFLAGS\t+=\t-Wall -Wextra\n\n")

    f.write("CC\t=\t@gcc\n")
    f.write("RM\t=\t@rm -f\n\n")

    f.write("all:\t$(NAME)\n\n")

    f.write("$(NAME):\t$(OBJS)\n")
    f.write("\t@$(MAKE) -C $(LIBPATH) --no-print-directory\n")
    f.write("\t$(CC) -o $(NAME) $(OBJS)\n\n")

    f.write("$(OBJS): $(HFILE)\n\n")

    f.write("clean:\n")
    f.write("\t@$(MAKE) clean -C $(LIBPATH) --no-print-directory\n")
    f.write("\t@$(RM) $(OBJS)\n")
    f.write("\t@echo \"\e[32m[OK]\\033[0m Cleanned\"\n\n")

    f.write("fclean:\n")
    f.write("\t@$(MAKE) fclean -C $(LIBPATH) --no-print-directory\n")
    f.write("\t@$(RM) $(OBJS)\n")
    f.write("\t@rm -f $(NAME)\n")
    f.write("\t@echo \"\e[32m[OK]\\033[0m Cleanned\"\n\n")

    f.write("re:\tfclean all\n\n")

    f.write(".c.o:\t%.c\n")
    f.write("\t@$(CC) -c $< -o $@ $(CFLAGS) && echo \"\e[32m[OK]\\033[0m\" $< || echo \"\e[91;5m[KO]\e[25m\" $< \"\\033[0m\"\n\n")

    f.write(".PHONY: all clean fclean re\n")

def config_lib():
    name  = "libmy.a"
    lib(name)

def lib(name):
    if os.path.exists("Makefile"):
        os.remove("Makefile")
    f = open("Makefile", "x")

    f.write("##\n## EPITECH PROJECT, " + year + "\n## Makefile\n## File description:\n## Makefile\n##\n\n")

    f.write("OBJS\t=\t$(patsubst %.c, %.o, $(wildcard *.c))\n\n")

    f.write("NAME \t=\t" + name + "\n\n")

    f.write("CFLAGS\t=\t-I .\n")
    f.write("CFLAGS\t+=\t-g3\n")
    f.write("CFLAGS\t+=\t-Wall -Wextra\n\n")

    f.write("CC\t\t=\t@gcc\n")
    f.write("AR\t\t=\t@ar rc\n")
    f.write("RM\t\t=\t@rm -f\n\n")

    f.write("all:\t$(NAME)\n\n")

    f.write("$(NAME):\t$(OBJS)\n")
    f.write("\t@$(AR) $(NAME) $(OBJS)\n\n")

    f.write("$(OBJS): my.h\n\n")

    f.write("clean:\n")
    f.write("\t@$(RM) $(OBJS)\n")
    f.write("\t@echo \"\e[32m[OK]\033[0m Cleanned\"\n\n")

    f.write("fclean:\n")
    f.write("\t@$(RM) $(OBJS)\n")
    f.write("\t@rm -f $(NAME)\n")
    f.write("\t@echo \"\e[32m[OK]\033[0m Cleanned\"\n\n")

    f.write("re:\tfclean all\n\n")

    f.write(".c.o:\t%.c\n")
    f.write("\t@$(CC) -c $< -o $@ $(CFLAGS) && echo \"\e[32m[OK]\033[0m\" $< || echo \"\e[91;5m[KO]\e[25m\" $< \"\033[0m\"\n\n")

    f.write(".PHONY: all clean fclean re\n")

if len(sys.argv) > 1:
    if sys.argv[1] == "-h":
        helpme()
    elif sys.argv[1] == "-root":
        config_root()
    elif sys.argv[1] == "-lib":
        config_lib()
    else:
        print("Mod undetected\nUsage: ./mms [-root / -lib]")
else:
        print("Mod undetected\nUsage: ./mms [-root / -lib]")
