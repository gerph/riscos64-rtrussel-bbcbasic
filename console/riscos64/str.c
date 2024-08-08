/*******************************************************************
 * File:     strdup.c
 * Purpose:  String duplication routines
 * Author:   Justin Fletcher
 * Date:     17 Mar 2001
 ******************************************************************/

#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#ifdef FORTIFY
#include "fortify.h"
#endif


/*********************************************** <c> Gerph *********
 Function:     strdup
 Description:  Copy a string into a new block of memory
 Parameters:   x-> string to copy
 Returns:      pointer to new copy of string, or NULL if failed
 ******************************************************************/
char *(strdup)(char const *x)
{
  char *n=malloc(strlen(x)+1);
  if (n!=NULL) strcpy(n,x);
  return n;
}

/*********************************************** <c> Gerph *********
 Function:     strndup
 Description:  Duplicate a string to a particular length
 Parameters:   str-> string to copy
               n = number of CHARACTERS to copy
 Returns:      pointer to new string
 ******************************************************************/
char *(strndup)(char const *str, size_t n)
{
  char *s=malloc(n+1);
  if (s!=NULL)
  {
    strncpy(s,str,n); s[n]='\0';
  }
  return s;
}

/*********************************************** <c> Gerph *********
 Function:     stricmp
 Description:  Case insensitive comparison
 Parameters:   str1 = one string
               str2 = the other one
 Returns:      <0 if str1 < str2
               >0 if str1 > str2
               =0 if str1 = str2
 ******************************************************************/
int stricmp(const char *str1, const char *str2)
{
  char one,two;
  int  index;
  int  len=strlen(str1); /* speeds things up a tad */
  for(index=0; index<=len; index++)
  {
#ifdef __riscos64
    one = *str1++;
    if (one >= 'A' && one <= 'Z')
        one += 32;

    two = *str2++;
    if (two >= 'A' && two <= 'Z')
        two += 32;
#else
    one=tolower(*str1++);
    two=tolower(*str2++);
#endif
    if (one!=two)
    {
      if (one<two)
        return -1;
      else
        return 1;
    }
  }
  return 0;
}

int strcasecmp(const char *str1, const char *str2)
{
    return stricmp(str1, str2);
}


/*********************************************** <c> Gerph *********
 Function:     strnicmp
 Description:  Case insensitive comparison for a number of chars
 Parameters:   str1 = one string
               str2 = the other one
 Returns:      <0 if str1 < str2
               >0 if str1 > str2
               =0 if str1 = str2
 ******************************************************************/
int strnicmp(const char *str1, const char *str2, size_t n)
{
  char one,two;
  int  index;

  for(index=n; index>0; index--)
  {
#ifdef __riscos64
    one = *str1++;
    if (one >= 'A' && one <= 'Z')
        one += 32;

    two = *str2++;
    if (two >= 'A' && two <= 'Z')
        two += 32;
#else
    one=tolower(*str1++);
    two=tolower(*str2++);
#endif
    if (one!=two)
    {
      if (one<two)
        return -1;
      else
        return 1;
    }
    /* If they are the same, and both are terminated, we've got it */
    if (one=='\0')
      return 0;
  }
  return 0;
}

int strncasecmp(const char *str1,const char *str2, size_t n)
{
    return strnicmp(str1, str2, n);
}

#ifdef FORTIFY
char *strdup_label(char const *x, const char *file, int line)
{
    char *dup = strdup(x);
    if (dup)
    {
        char label[256];
        sprintf(label, "strndup at %s, line %i", file, line);
        (Fortify_LabelPointer)(dup, label, file, line);
    }
    return dup;
}
char *strndup_label(char const *x, int n, const char *file, int line)
{
    char *dup = strndup(x, n);
    if (dup)
    {
        char label[256];
        sprintf(label, "strndup at %s, line %i", file, line);
        (Fortify_LabelPointer)(dup, label, file, line);
    }
    return dup;
}
#endif
