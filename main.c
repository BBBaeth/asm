#include "libasm.h"
#include "stdio.h"
#include "string.h"
#include <errno.h>

int		main(int argc, char **argv)
{
	if (argc > 1 && argv && argv[2])
	{
	}
		char	str1[] = "ChatonBananePeche";
		char	str2[] = "Chiot";
		printf(" length of arg1 for asm : |%zd|\n", ft_strlen(argv[1]));
		printf(" length of 'salut les potes': |%zd|\n", ft_strlen("salut les potes"));
		printf(" arg for asm : |%d|\n", ft_strcmp(argv[1], argv[2]));
		if (argv[1] && argv[2])
		printf(" arg for cmp : |%d|\n", strcmp(argv[1], argv[2]));
		errno = 0;
		printf("return asmcpy : |%s|\n", ft_strcpy(str1, str2));
		printf(", errno : %d\n", errno);
		errno = 0;
		printf("return cpy: |%s|\n", strcpy(str1, str2));
		printf(", errno : %d\n", errno);
	return (0);
}
