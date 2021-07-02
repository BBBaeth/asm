#include "libasm.h"
#include "stdio.h"

int		main(int argc, char **argv)
{
	if (argc > 1 && argv)
	{
		printf(" length of arg1 : |%zd|\n", ft_strlen(argv[1]));
	}
	return (0);
}
