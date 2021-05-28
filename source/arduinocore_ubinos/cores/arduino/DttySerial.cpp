#include <ubinos/bsp.h>

#include <DttySerial.h>

DttySerial SerialDtty;

int DttySerial::available(void)
{
    // FIXME: need to implement dtty_available()
    return dtty_kbhit();
}

int DttySerial::read(void)
{
    int r;
    char ch;

    r = dtty_getc_unblocked(&ch);
    if (r == 0)
    {
        r = (int) ch;
    }
    else {
        r = -1;
    }

    return r;
}

int DttySerial::peek(void)
{
    // FIXME: need to implement dtty_peek()
    return 0;
}

size_t DttySerial::write(uint8_t c)
{
    int r;

    r = dtty_putc((int) c);
    if (r == 0)
    {
        r = 1;
    }
    else
    {
        r = 0;
    }

    return r;
}

