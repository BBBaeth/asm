#include "libasm.h"
#include "stdio.h"
#include "string.h"

int		main(int argc, char **argv)
{
	if (argc > 1 && argv)
	{
	}
		printf(" length of arg1 for asm : |%zd|\n", ft_strlen(argv[1]));
//		printf(" length of arg1 for C : |%zd|\n", strlen(argv[1]));
		printf(" length of 'salut les potes': |%zd|\n", ft_strlen("salut les potes"));
	return (0);
}
