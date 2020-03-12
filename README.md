# mms
make me smile, make file generator

### Install
```
git clone https://github.com/Neotoxic-off/mms
cd mms
chmod +x install.sh
./install.sh
```

### HELP
```
Library Name:	 Name of the lib to compile for the program
Library Path:	 Path of the lib to compile for the program
Binary Name:	 Name of the output
H Path:		 Path of the .h file


	┌──── include
	│     └── my.h
	├──── lib
	│     └── my
	│         ├── libmy.a
	│         ├── Makefile
	│         ├── my_putchar.c
	│         ├── my_putstr.c
	│         └── my_strlen.c
	├──── src
	│     ├── init.c
	│     ├── display.c
	│     └── main.c
	├── Binary
	└── Makefile

```

### Usage
```
./mms [-root / -lib]
```

## Makefile generated:
```
##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Makefile
##

OBJS	=	$(patsubst %.c, %.o, $(wildcard ./src/*.c))

LIBNAME	=	libmy.a
LIBPATH	=	./lib/my/

HFILE	=	./include/my.h

NAME	=	binary

CFLAGS	=	-I ./include
CFLAGS	+=	-g3
CFLAGS	+=	-Wall -Wextra

CC	=	@gcc
RM	=	@rm -f

all:	$(NAME)

$(NAME):	$(OBJS)
	@$(MAKE) -C $(LIBPATH) --no-print-directory
	$(CC) -o $(NAME) $(OBJS)

$(OBJS): $(HFILE)

clean:
	@$(MAKE) clean -C $(LIBPATH) --no-print-directory
	@$(RM) $(OBJS)
	@echo "\e[32m[OK]\033[0m Cleanned"

fclean:
	@$(MAKE) fclean -C $(LIBPATH) --no-print-directory
	@$(RM) $(OBJS)
	@rm -f $(NAME)
	@echo "\e[32m[OK]\033[0m Cleanned"

re:	fclean all

.c.o:	%.c
	@$(CC) -c $< -o $@ $(CFLAGS) && echo "\e[32m[OK]\033[0m" $< || echo "\e[91;5m[KO]\e[25m" $< "\033[0m"

.PHONY: all clean fclean re

```


