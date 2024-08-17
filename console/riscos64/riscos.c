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

int rename(const char *from, const char *to)
{
    /* FIXME */
    return 0;
}

int chmod(const char *file, int mode)
{
    /* FIXME */
    return 0;
}

char *getenv(const char *var)
{
    /* FIXME */
    return NULL;
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

int fileno(FILE *f)
{
    return f->_fileno;
}

double sqrt(double value)
{
    /* FIXME: Not implemented */
    return value;
}

double asin(double value)
{
    /* FIXME: Not implemented */
    return value;
}

double atan(double value)
{
    /* FIXME: Not implemented */
    return value;
}

double acos(double value)
{
    /* FIXME: Not implemented */
    return value;
}

double fabs(double value)
{
    /* FIXME: Not implemented */
    return value;
}

double exp(double value)
{
    /* FIXME: Not implemented */
    return value;
}

double tan(double value)
{
    /* FIXME: Not implemented */
    return value;
}

long double truncl(long double value)
{
    /* FIXME: Not implemented */
    return value;
}

long double floorl(long double value)
{
    /* FIXME: Not implemented */
    return value;
}

double pow(double value1, double value2)
{
    /* FIXME: Not implemented */
    return value1;
}

double log(double value)
{
    /* FIXME: Not implemented */
    return value;
}

long long int llabs(long long int value)
{
    /* FIXME: Not implemented */
    if (value < 0)
        value = -value;
    return value;
}

void __clear_cache(char *begin, char *end)
{
    /* FIXME: Not implemented */
    /* Use OS_SynchroniseCodeAreas ? */
}

void putevt(void)
{
    /* FIXME: Not implemented */
}

double __extenddftf2(double)
{
    /* FIXME: Not implemented */
    return 0.0;
}

double __floatditf(double)
{
    /* FIXME: Not implemented */
    return 0.0;
}

double __netf2(double)
{
    /* FIXME: Not implemented */
    return 0.0;
}

double __trunctfdf2(double)
{
    /* FIXME: Not implemented */
    return 0.0;
}

