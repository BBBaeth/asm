NAME = libasm.a

SRCS =	ft_strlen.s \
		ft_strcpy.s \
		ft_read.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s \

SRCO = $(SRCS:.s=.o)

FLAGS = -Wall -Wextra -Werror

NFLAGS = -f macho64

NASM = nasm

SRCS_PATH = srcs

OBJ_PATH = compiled_objects

SRC = $(addprefix $(SRCS_PATH)/,$(SRCS))
OBJ = $(addprefix $(OBJ_PATH)/,$(SRCO))

.PHONY: all, clean, fclean, re

all: $(NAME)

$(NAME): $(OBJ)
		ar -rc $(NAME) $(OBJ)
		ranlib $(NAME)

$(OBJ_PATH)/%.o: $(SRCS_PATH)/%.s
		@mkdir $(OBJ_PATH) 2> /dev/null || true
		NASM  $(NFLAGS) $< -o $@

libasmtest: $(NAME) $(OBJ)
		gcc $(FLAGS) -o libasmTest main.c $(NAME)

clean :
		rm -rf $(OBJ)
		@mkdir $(OBJ_PATH) 2> /dev/null || true

fclean: clean
		rm -rf $(NAME)
		rm -rf $(OBJ_PATH)
		rm -f libasmTest

re: fclean all
