# mms
make me smile, make file generator

### Install
```
git clone https://github.com/Neotoxic-off/mms
cd mms
chmod +x install.sh
./install.sh
```

### Usage
```
Autotmatic mode detection
HOMEMODE ==> mms <Source.c> <Output> <Lib_Path>
LIBMODE  ==> mms <Lib_Path> <Lib_name>
```

<img src="https://raw.githubusercontent.com/Neotoxic-off/mms/master/pics/homemode.png">
# Homemode: Use it to generate a makefile on the root folder

<img src="https://raw.githubusercontent.com/Neotoxic-off/mms/master/pics/libmode.png">
# Libmode: Use it to generate a makefile for your lib


## Makefile generated:
```
##
## EPITECH PROJECT, 2019
## Generated with mms
## File description:
## Makefile
##

NRM		=	\e[0m
NRED	=	\e[31m
NGRN	=	\e[32m
NYEL	=	\e[33m
NCYN	=	\e[36m
BRED	=	\e[1;31m
BGRN	=	\e[1;32m
BYEL	=	\e[1;33m
BCYN	=	\e[1;36m

## CONFIGURATION

SRC		=	src.c
BIN		=	bin
CMP		=	gcc
FLAGS	=	-g -Wall --extra
LIB	=	lib/

all: NAME clean

infos:
	@echo "$(NRM)Source..........: $(BCYN) $(SRC) $(NRM)"
	@echo "$(NRM)Binary..........: $(BCYN) $(BIN) $(NRM)"
	@echo "$(NRM)Lib.............: $(BCYN) $(LIB) $(NRM)"
	@echo "$(NRM)Compiler........: $(BCYN) $(CMP) $(NRM)"
	@echo "$(NRM)Flags...........: $(BCYN) $(FLAGS) $(NRM)"
NAME: infos
	@echo "$(NRM)Status..........: $(BGRN) Compiling $(NRM)"
	@echo "$(NRM)Status..........: $(BYEL) Starting logs $(NRM)"
	@make -C $(LIB)
	@cp $(LIB)/include/* ./include
	@$(CMP) -o $(BIN) $(SRC) $(LIB)/*.a $(FLAGS)
	@echo "$(NRM)Status..........: $(BYEL) Logs ended $(NRM)"
	@if [ -e "$(BIN)" ]; then echo "$(NRM)Status..........: $(BGRN) Compiled $(NRM)"; else echo "$(NRM)Status..........: $(BRED) Failed $(NRM)"; fi
clean:
	@echo "$(NRM)Status..........: $(BGRN) Cleanning $(NRM)"
	@find -name "*.o" -delete -o -name -delete
	@echo "$(NRM)Status..........: $(BGRN) Cleanned $(NRM)"
fclean:
	@echo "$(NRM)Status..........: $(BGRN) Cleanning $(NRM)"
	@rm -f $(BIN)
	@find -name "*.a" -delete -o -name -delete
	@echo "$(NRM)Status..........: $(BGRN) Cleanned $(NRM)"
re: fclean all

```


