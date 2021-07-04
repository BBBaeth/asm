#include "libasm.h"
#include "stdio.h"
#include "string.h"
#include <errno.h>

int		main(int argc, char **argv)
{
	if (argc > 1 && argv)
	{
	}
		errno = 0;
		printf(" length of arg1 for asm : |%zd|\n", ft_strlen(argv[1]));
		printf(", errno asm : %d\n", errno);
		errno = 0;
		printf(" length of 'salut les potes': |%zd|\n", ft_strlen("salut les potes"));
		printf(", errno asm : %d\n", errno);
		errno = 0;
		printf(" arg for asm : |%d|\n", ft_strcmp(argv[1], argv[2]));
		printf(", errno asm : %d\n", errno);
		if (argv[1] && argv[2])
		printf(" arg for cmp : |%d|\n", strcmp(argv[1], argv[2]));
		printf(" cmp1 for asm : |%d|\n", ft_strcmp("coucou", "coucou"));
		printf(" cmp1 for cmp : |%d|\n", strcmp("coucou", "coucou"));
		printf(" cmp2 for asm : |%d|\n", ft_strcmp("", "zouzou"));
		printf(" cmp2 for cmp : |%d|\n", strcmp("", "zouzou"));
		printf(" cmp3 for asm : |%d|\n", ft_strcmp("", ""));
		printf(" cmp3 for cmp : |%d|\n", strcmp("", ""));
	return (0);
}
