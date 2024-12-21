#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "kernel.h"
#include "swis.h"


int chdir(const char *dir)
{
    /* FIXME */
    return 0;
}

int mkdir(const char *dir, int mode)
{
    /* FIXME */
    return 0;
}

int rmdir(const char *dir)
{
    /* FIXME */
    return 0;
}

int chmod(const char *file, int mode)
{
    /* FIXME */
    return 0;
}


char *realpath(const char *filename, char *result_path)
{
    /* FIXME */
    return NULL;
}

char *getcwd(void)
{
    /* FIXME */
    return NULL;
}

ssize_t write(int fileno, char *data, size_t size)
{
    _kernel_oserror *err;
    size_t not_transferred = 0;
    err = _swix(OS_GBPB, _INR(0, 3)|_OUT(3), 2, fileno, data, size, &not_transferred);
    if (err)
        return -1;
    return size - not_transferred;
}

ssize_t read(int fileno, char *data, size_t size)
{
    _kernel_oserror *err;
    size_t not_transferred = 0;
    err = _swix(OS_GBPB, _INR(0, 3)|_OUT(3), 4, fileno, data, size, &not_transferred);
    if (err)
        return -1;
    return size - not_transferred;
}

long long int llabs(long long int value)
{
    if (value < 0)
        value = -value;
    return value;
}

void __clear_cache(char *begin, char *end)
{
    _swix(OS_SynchroniseCodeAreas, _INR(0, 2), 1, begin, end);
}

void putevt(void)
{
    /* FIXME: Not implemented */
}
